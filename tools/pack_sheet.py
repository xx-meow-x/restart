#!/usr/bin/env python3
"""
pack_sheet.py - repack the player's loose sprite sheet and head sheet into the grids game.asm loads.

  python pack_sheet.py basic.png hero.png pickup_heads.png body.bmp head.bmp

basic.png  the annotated body sheet (transparent background, labels and brackets are ignored because
           only the boxed regions in BOXES below are read).  Groups used:
             idle (5 poses: S SW W NW N)      picking up (4)        idle SW + NW (6 each)
             walking (5 rows S SW W NW N x 8) attacks SW + NW: one-handed (4), thrusting (6), one-handed 2 (7)
             (the death frames are in the sheet but not packed yet)
hero.png   one row of head images; images 1-5 are the heads for S SW W NW N.
pickup_heads.png  the 8 head images for picking up, at the same scale as hero.png (transparent, or on a plain
           background colour that is then treated as transparent):
           images 1-4 are the SW pick-up (head tilting down, then seen from above); 5-8 are the same for
           NW (not used yet, the body sheet has no NW pick-up).

Output (both files): 8 columns x 17 rows of 80 x 108 cells, 32-bit top-down BMP with alpha:
  row 0-4   walk  S SW W NW N (8 frames)         row 5-9  idle S SW W NW N (1, 6, 1, 6, 1 frames)
  row 10    picking up (4)                       row 11/12 attack A SW/NW (4)
  row 13/14 attack B SW/NW (6)                   row 15/16 attack C SW/NW (7)
Feet on the bottom of the cell, torso centred.  The head sheet has the same grid with only the
head in it.  The head is anchored to the body in every frame: it sits on the body's neck and moves with
it, so it rises and falls with the walking bob.  In the pick-up frames the bowed head images hang
forward off the shoulders (HEAD_PICK_OFFSETS).
Needs: pip install pillow numpy
"""
import struct, sys
import numpy as np
from PIL import Image

CELLW, CELLH, COLS, ROWS = 80, 108, 8, 17
HEAD_OVERLAP = 5            # pixels the head's bottom overlaps the body's neck, in every frame
HEAD_PICK_OFFSETS = [(-2, 11), (-4, 12), (-6, 12), (-6, 13)]   # pick-up: where the bowed head's centre goes, relative to the neck point (x, y)
BOXES = {                    # (x0, y0, x1, y1) of each group in basic.png
    "idle": (278, 0, 585, 100), "pickup": (285, 135, 535, 235), "idle2": (280, 262, 625, 445),
    "walk": (940, 0, 1445, 420), "atk1": (232, 468, 500, 660), "atk2": (512, 468, 910, 660),
    "atk3": (938, 468, 1405, 660)}

def runs(v, gap, minlen):
    idx = np.where(v)[0]
    if len(idx) == 0: return []
    out = []; s = p = idx[0]
    for r in idx[1:]:
        if r > p + gap: out.append((int(s), int(p))); s = r
        p = r
    out.append((int(s), int(p)))
    return [(s, e) for s, e in out if e - s + 1 >= minlen]

def group(op, a, name, rows, per_row):
    x0, y0, x1, y1 = BOXES[name]
    sub = op[y0:y1, x0:x1]
    bands = runs(sub.any(axis=1), 3, 30)
    assert len(bands) == rows, f"{name}: expected {rows} rows, found {len(bands)}"
    out = []
    for s, e in bands:
        cols = runs(sub[s:e+1].any(axis=0), 2, 8)
        assert len(cols) == per_row, f"{name}: expected {per_row} sprites per row, found {len(cols)}"
        out.append([(x0 + c0, y0 + s, x0 + c1, y0 + e) for c0, c1 in cols])
    return out

def frame(a, op, box):
    x0, y0, x1, y1 = box
    m = op[y0:y1+1, x0:x1+1]; ys = np.where(m.any(axis=1))[0]
    ty0, ty1 = y0 + ys[0], y0 + ys[-1]
    m = op[ty0:ty1+1, x0:x1+1]; img = a[ty0:ty1+1, x0:x1+1]
    return img, m

def place(img, m):
    """position of a sprite inside a cell + the body's neck point (cell coordinates)"""
    h, w = m.shape
    torso = m[int(h*.30):max(int(h*.70), int(h*.30)+1)]
    cx = np.where(torso)[1].mean()
    ox = int(round(CELLW/2 - cx)); oy = CELLH - h
    assert oy >= 0 and ox >= 0 and ox + w <= CELLW, f"sprite does not fit ({w}x{h}, ox={ox})"
    band = np.zeros_like(m); lo = max(0, int(cx) - 8); hi = min(w, int(cx) + 9); band[:, lo:hi] = m[:, lo:hi]
    ny = np.where(band.any(axis=1))[0][0]                         # top of the body above the torso = the neck
    nx = np.where(band[ny:ny+3])[1].mean()
    return ox, oy, ox + nx, oy + ny

def write_bmp(path, img):
    H, W = img.shape[:2]
    bgra = img[:, :, [2, 1, 0, 3]].tobytes()
    hdr = b"BM" + struct.pack("<IHHI", 54 + len(bgra), 0, 0, 54)
    dib = struct.pack("<IiiHHIIiiII", 40, W, -H, 1, 32, 0, len(bgra), 2835, 2835, 0, 0)
    open(path, "wb").write(hdr + dib + bgra)
    print(f"wrote {path}: {W}x{H}, cells {CELLW}x{CELLH}, {COLS} columns x {ROWS} rows")

def main():
    a = np.array(Image.open(sys.argv[1]).convert("RGBA")); op = a[:, :, 3] > 128
    ha = np.array(Image.open(sys.argv[2]).convert("RGBA"))
    pimg = np.array(Image.open(sys.argv[3]).convert("RGBA")).astype(int)            # pick-up heads
    pa = pimg[:, :, :3]
    pmask = pimg[:, :, 3] > 0 if (pimg[:, :, 3] == 0).any() else np.abs(pa - pa[0, 0]).sum(axis=2) > 20   # transparent, or opaque background
    psegs = runs(pmask.any(axis=0), 2, 8); assert len(psegs) >= 4, f"expected 8 pick-up heads, found {len(psegs)}"
    pickheads = []
    for s0, e0 in psegs[:4]:
        m0 = pmask[:, s0:e0+1]; yy = np.where(m0.any(axis=1))[0]; m0 = m0[yy[0]:yy[-1]+1]; im0 = pa[yy[0]:yy[-1]+1, s0:e0+1]
        pickheads.append((np.dstack([im0, np.where(m0, 255, 0)]).astype(np.uint8), m0))
    hsegs = runs((ha[:, :, 3] > 0).any(axis=0), 2, 3); assert len(hsegs) >= 5
    heads = []
    for hx0, hx1 in hsegs[:5]:
        himg = ha[:, hx0:hx1+1]; hm = himg[:, :, 3] > 0
        hy = np.where(hm.any(axis=1))[0]; himg = himg[hy[0]:hy[-1]+1]; hm = hm[hy[0]:hy[-1]+1]
        heads.append((himg, hm, np.where(hm[-3:])[1].mean()))
    idle5 = group(op, a, "idle", 1, 5)[0]; pick = group(op, a, "pickup", 1, 4)[0]
    idle2 = group(op, a, "idle2", 2, 6); walk = group(op, a, "walk", 5, 8)
    atk = [group(op, a, n, 2, k) for n, k in (("atk1", 4), ("atk2", 6), ("atk3", 7))]
    plan = []                                   # (sheet row, [boxes], head image, pick-up?)
    for v in range(5): plan.append((v, walk[v], v, False))
    plan += [(5, [idle5[0]], 0, False), (6, idle2[0], 1, False), (7, [idle5[2]], 2, False), (8, idle2[1], 3, False), (9, [idle5[4]], 4, False),
             (10, pick, 1, True)]
    for k in range(3):
        plan += [(11 + 2*k, atk[k][0], 1, False), (12 + 2*k, atk[k][1], 3, False)]
    body = np.zeros((ROWS * CELLH, COLS * CELLW, 4), np.uint8); head = np.zeros_like(body)
    for row, boxes, hi, is_pick in plan:
        himg, hm, hneck = heads[hi]; hh, hw = hm.shape; info = []
        for f, box in enumerate(boxes):
            img, m = frame(a, op, box); ox, oy, nx, ny = place(img, m); h, w = m.shape
            cell = body[row*CELLH + oy: row*CELLH + oy + h, f*CELLW + ox: f*CELLW + ox + w]
            cell[m] = img[m]; info.append((nx, ny))
        for f, (nx, ny) in enumerate(info):                       # the head follows the body in every frame
            if is_pick:
                himg, hm = pickheads[f]; hh, hw = hm.shape
                cyy, cxx = [v.mean() for v in np.where(hm)]          # bowed head: its centre goes forward of the neck
                dx, dy = HEAD_PICK_OFFSETS[f]
                hx = int(round(nx + dx - cxx)); hy_ = int(round(ny + dy - cyy))
            else:
                hx = int(round(nx - hneck)); hy_ = int(round(ny)) - hh + HEAD_OVERLAP
            assert hx >= 0 and hx + hw <= CELLW and hy_ >= 0, f"head row {row} frame {f} does not fit (x={hx}, y={hy_})"
            hc = head[row*CELLH + hy_: row*CELLH + hy_ + hh, f*CELLW + hx: f*CELLW + hx + hw]
            hc[hm] = himg[hm]
    write_bmp(sys.argv[4], body); write_bmp(sys.argv[5], head)
main()
