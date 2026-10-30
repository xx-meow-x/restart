#!/usr/bin/env python3
"""
pack_player.py - build the player's sprite sheets for game.asm straight from the real Ragnarok
body sprite (.spr) and animation (.act) files, the weapon's .spr/.act, and the head sheets.

  python pack_player.py body.spr body.act hero.png pickup_heads.png weapon.spr weapon.act  out_folder

Writes into out_folder: player_body.bmp, player_head.bmp, player_weapon.bmp and player_layout.txt (the numbers to put in game.asm).
All three bmp files use the same grid: 9 columns (frames) x rows, every cell CELLW x CELLH, with the
character's ground point (the act file's origin) at column CELLOX, row CELLOY of the cell.
Rows are action * 5 + view, view = 0 S, 1 SW, 2 W, 3 NW, 4 N (the other three directions are these flipped).
Actions: 0 stand(1 frame) 1 walk(8) 2 pick up(3) 3 ready(6) 4 attack(5) 5 skill(9) 6 cast(8) 7 hurt(3) 8 dead(1)
weapon.bmp has its own, wider cell (WCELLW x WCELLH, ground point at WCELLOX, WCELLOY) because the swing reaches far to the side.
Its rows: (weapon class * 3 + block) * 5 + view, class 0 short blade / 1 long blade, block 0 ready stance, 1 attack, 2 skill.
The weapon file only has pictures 0-5; where the animation wants one of 6-11, the nearest swing picture is used instead (FALLBACK).
Heads are placed from the body act's attach point of every frame plus a fixed offset (K_HEAD), so they stay exactly on
the body and move with it. In stand/walk all five views are distinct. In every other action the act only has two
poses (front-left "A", back-left "B") and the other directions are flips, so there the packed views are:
view 0 = pose A + south head, view 1 = pose A + south-west head, views 2 and 3 = pose B + north-west head,
view 4 = pose B mirrored + north-east head.  The game picks rows with the direction maps printed in player_layout.txt.
Needs: pip install pillow numpy
"""
import os, struct, sys
import numpy as np
from PIL import Image
from actlib import parse_act, load_spr

ACTIONS = [("stand", 0, 1), ("walk", 8, 8), ("pickup", 24, 3), ("ready", 32, 6), ("attack", 40, 5),
           ("skill", 80, 9), ("cast", 88, 8), ("hurt", 48, 3), ("dead", 56, 1)]       # name, first act index, frames
COLS = 9
K_HEAD = [(-1, -9), (5, -9), (7, -9), (-11, 9), (-11, 10)]       # head centre minus the body's attach point (stand/walk)
HEAD_OVERLAP = 5                                                  # how far (px) the head's bottom overlaps the body's top
K_B = (-11, 9)                                                    # same, for pose B in the other actions (view 2/3)
K_B_MIRROR = (10, 9)                                              # ... and for pose B mirrored (view 4)
PICK_FRONT = [0, 1, 3]; PICK_BACK = [4, 5, 7]                     # the bowed head pictures used for the 3 pick-up frames (front / back views)
PICK_OFFS = {0: (-2, 11), 1: (-4, 12), 3: (-6, 13), 4: (-2, 11), 5: (-4, 12), 7: (-6, 13)}   # where the bowed head's centre hangs, relative to the neck (x, y)
DEAD_HEAD = 13                                                    # head image used when lying down
BODY_TINT = (1.0, 1.0, 1.0)                                       # multiply the body sheet's red, green, blue (1.0 = unchanged). Affects skin and clothes alike.
HEAD_TINT = (1.0, 1.0, 1.0)                                       # same for the head sheet: this is the hair colour (and the face)
WEAPON_TINT = [(1.0, 1.0, 1.0), (1.0, 1.0, 1.0)]                  # per blade: short (Spike), long (Longsword). Try (0.8, 0.9, 1.4) for an icy blue
SNAP_WEAPON = True                                                # attack / skill swing: pull the blade onto the nearest part of the body (the file's own positions float)
SNAP_TOUCH = 2                                                    # ... when it is farther than this many pixels away
LONG_SCALE = 1.5                                                  # the long blade is the short one scaled up

def runs(v, gap=2, minlen=3):
    idx = np.where(v)[0]; out = []; s = p = idx[0]
    for r in idx[1:]:
        if r > p + gap: out.append((int(s), int(p))); s = r
        p = r
    out.append((int(s), int(p)))
    return [(s, e) for s, e in out if e - s + 1 >= minlen]

def strip(path, bgcolor=False):
    """cut a strip of sprites into separate RGBA images"""
    a = np.array(Image.open(path).convert("RGBA"))
    mask = a[:, :, 3] > 0
    if bgcolor and not (a[:, :, 3] == 0).any(): mask = np.abs(a[:, :, :3].astype(int) - a[0, 0, :3]).sum(axis=2) > 20
    out = []
    for s, e in runs(mask.any(axis=0), 2, 3):
        m = mask[:, s:e+1]; ys = np.where(m.any(axis=1))[0]
        out.append(Image.fromarray(np.dstack([a[ys[0]:ys[-1]+1, s:e+1, :3], np.where(m[ys[0]:ys[-1]+1], 255, 0)]).astype(np.uint8), "RGBA"))
    return out

def body_alpha(layers_imgs):
    """compose a frame's body layers on a scratch canvas (ground point at 200,200) and return its alpha mask"""
    cv = np.zeros((400, 400), bool)
    for g, x, y in layers_imgs:
        a = np.array(g)[:, :, 3] > 0; l = 200 + x - g.width // 2; t = 200 + y - g.height // 2
        cv[t:t + g.height, l:l + g.width] |= a
    return cv

def neck_point(cv):
    """the body's neck point (canvas coordinates): the top of the body above the torso"""
    ys, xs = np.nonzero(cv); top, bot = ys.min(), ys.max(); h = bot - top + 1
    r0 = top + int(h * .30); r1 = top + max(int(h * .70), int(h * .30) + 1)
    cx = np.nonzero(cv[r0:r1])[1].mean()
    lo = max(0, int(cx) - 8); hi = int(cx) + 9
    band = np.zeros_like(cv); band[:, lo:hi] = cv[:, lo:hi]
    ny = np.where(band.any(axis=1))[0][0]
    nx = np.nonzero(band[ny:ny + 3])[1].mean()
    return nx, ny

def head_on_neck(cv, himg, overlap):
    """head centre (relative to the ground point) so the head hangs from the neck: its chin on the neck, overlapping a little"""
    nx, ny = neck_point(cv)
    m = np.array(himg)[:, :, 3] > 0
    hneck = np.nonzero(m[-3:])[1].mean()                 # x of the head's chin
    hx = int(round(nx - hneck)); hy = int(round(ny)) - himg.height + overlap
    return hx + himg.width // 2 - 200, hy + himg.height // 2 - 200

def head_bowed(cv, himg, off):
    """a bowed head: its centre of mass hangs forward of the neck by off = (dx, dy)"""
    nx, ny = neck_point(cv)
    m = np.array(himg)[:, :, 3] > 0
    cyy, cxx = [v.mean() for v in np.nonzero(m)]
    hx = int(round(nx + off[0] - cxx)); hy = int(round(ny + off[1] - cyy))
    return hx + himg.width // 2 - 200, hy + himg.height // 2 - 200

def end_centre(cv, himg, right):
    """head centre for a lying body: at its left or right end"""
    cols = np.nonzero(cv.any(axis=0))[0]; xe = cols.max() if right else cols.min()
    sel = cv[:, xe - 10:xe + 1] if right else cv[:, xe:xe + 11]
    cy = np.nonzero(sel)[0].mean()
    return int(round(xe - 200 + (-2 if right else 2))), int(round(cy - 200 - 2))

def main():
    body_spr, body_act, hero, pickp, wspr, wact, out = sys.argv[1:8]
    os.makedirs(out, exist_ok=True)
    bacts, _ = parse_act(body_act); wacts, _ = parse_act(wact)
    bmk, _, _ = load_spr(body_spr); wmk, wn, _ = load_spr(wspr)
    heads = strip(hero); pheads = strip(pickp, True); assert len(heads) >= 14 and len(pheads) >= 8
    flip = lambda im: im.transpose(Image.FLIP_LEFT_RIGHT)
    def head_for(action, view, f):
        """-> (head image, pick-up offset or None)"""
        if action == "pickup":
            idx = (PICK_FRONT if view < 2 else PICK_BACK)[f]
            off = PICK_OFFS[idx]
            img = pheads[idx]
            if view == 4: img, off = flip(img), (-off[0], off[1])      # mirrored pose: mirrored head
            return img, off
        if action == "dead": return heads[DEAD_HEAD], None
        if action in ("stand", "walk"): return heads[view], None
        if view < 2: return heads[view], None                          # pose A: front heads
        return (flip(heads[3]) if view == 4 else heads[3]), None       # pose B: north-west head (mirrored for view 4)
    def scaled(img, s):
        return img if s == 1 else img.resize((max(1, round(img.width * s)), max(1, round(img.height * s))), Image.NEAREST)
    # ---- pass 1: where does everything land (relative to the ground point)? ----
    items = []                          # (sheet, row, col, image, cx, cy)  centre of the image relative to the origin
    for ai, (name, base, nf) in enumerate(ACTIONS):
        for v in range(5):
            for f in range(nf):
                fr = bacts[base + v][f]
                limgs = []
                for L in fr["layers"]:
                    if L["spr"] < 0: continue
                    g = bmk(L["spr"], L["type"])
                    if L["mirror"]: g = g.transpose(Image.FLIP_LEFT_RIGHT)
                    items.append(("body", ai * 5 + v, f, g, L["x"], L["y"])); limgs.append((g, L["x"], L["y"]))
                himg, poff = head_for(name, v, f)
                cv = body_alpha(limgs)
                if name == "dead":
                    cx, cy = end_centre(cv, himg, right=(v != 4))
                elif poff is not None:
                    cx, cy = head_bowed(cv, himg, poff)
                else:
                    cx, cy = head_on_neck(cv, himg, HEAD_OVERLAP)
                items.append(("head", ai * 5 + v, f, himg, cx, cy))
    WBLOCKS = (("ready", 32, None), ("attack", 80, [0, 1, 2, 5, 6]), ("skill", 80, None))   # name, act action, which frames
    FALLBACK = {6: 5, 7: 2, 8: 2, 9: 3, 10: 4, 11: 5}      # swing pictures the weapon file lacks -> the nearest one it has
    for cls in range(2):
        for bi, (wname, base, pick) in enumerate(WBLOCKS):
            for v in range(5):
                frames = wacts[base + v]
                for f, src in enumerate(pick if pick else range(len(frames))):
                    for L in frames[src]["layers"]:
                        sp = L["spr"]
                        if sp < 0: continue
                        if sp >= wn: sp = FALLBACK.get(sp, -1)
                        if sp < 0 or sp >= wn: continue
                        g = wmk(sp, L["type"])
                        if L["mirror"]: g = g.transpose(Image.FLIP_LEFT_RIGHT)
                        items.append(("weapon", (cls * 3 + bi) * 5 + v, f, scaled(g, 1 if cls == 0 else LONG_SCALE), L["x"], L["y"]))
    if SNAP_WEAPON:
        from collections import defaultdict
        body_items = defaultdict(list)
        for it in items:
            if it[0] == "body": body_items[(it[1], it[2])].append(it)
        def points(g, cx, cy):
            ys, xs = np.nonzero(np.array(g)[:, :, 3] > 0)
            return np.stack([xs + cx - g.width // 2, ys + cy - g.height // 2], 1)
        snapped = []
        for sheet, row, col, g, cx, cy in items:
            blk, v = (row // 5) % 3, row % 5
            if sheet == "weapon" and blk in (1, 2):                  # attack and skill swings
                bp = np.concatenate([points(b[3], b[4], b[5]) for b in body_items[((4 if blk == 1 else 5) * 5 + v, col)]])
                wp = points(g, cx, cy)
                d2 = ((wp[:, None, :] - bp[None, :, :]) ** 2).sum(2); i, j = np.unravel_index(d2.argmin(), d2.shape)
                if d2[i, j] > SNAP_TOUCH ** 2:
                    cx += int(bp[j][0] - wp[i][0]); cy += int(bp[j][1] - wp[i][1])
            snapped.append((sheet, row, col, g, cx, cy))
        items = snapped
    def extents(sel):
        it = [t for t in items if sel(t[0])]
        return (min(cx - g.width // 2 for _, _, _, g, cx, cy in it), min(cy - g.height // 2 for _, _, _, g, cx, cy in it),
                max(cx - g.width // 2 + g.width for _, _, _, g, cx, cy in it), max(cy - g.height // 2 + g.height for _, _, _, g, cx, cy in it))
    x0, y0, x1, y1 = extents(lambda k: k != "weapon")
    half = max(max(-x0, x1) + 1, 57); CELLW = 2 * half + 1; CELLOX = half          # never smaller than the layout game.asm is built for
    CELLOY = max(-y0 + 1, 94); CELLH = max(CELLOY + y1 + 1, 121)
    wx0, wy0, wx1, wy1 = extents(lambda k: k == "weapon")
    whalf = max(max(-wx0, wx1) + 1, 73); WCELLW = 2 * whalf + 1; WCELLOX = whalf      # never smaller than the layout game.asm is built for
    WCELLOY = max(-wy0 + 1, 83); WCELLH = max(WCELLOY + wy1 + 1, 88)
    # ---- pass 2: draw ----
    sheets = {"body": np.zeros((45 * CELLH, COLS * CELLW, 4), np.uint8), "head": np.zeros((45 * CELLH, COLS * CELLW, 4), np.uint8),
              "weapon": np.zeros((30 * WCELLH, COLS * WCELLW, 4), np.uint8)}
    for sheet, row, col, g, cx, cy in items:
        a = np.array(g); m = a[:, :, 3] > 0
        if sheet == "weapon": left = col * WCELLW + WCELLOX + cx - g.width // 2; top = row * WCELLH + WCELLOY + cy - g.height // 2
        else: left = col * CELLW + CELLOX + cx - g.width // 2; top = row * CELLH + CELLOY + cy - g.height // 2
        dst = sheets[sheet][top: top + g.height, left: left + g.width]
        dst[m] = a[m]
    def tint(a, t):                                                   # multiply the colours of the visible pixels by t = (r, g, b)
        m = a[:, :, 3] > 0
        for c in range(3): a[:, :, c][m] = np.clip(a[:, :, c][m].astype(np.float32) * t[c], 0, 255).astype(np.uint8)
    tint(sheets["body"], BODY_TINT); tint(sheets["head"], HEAD_TINT)
    for c in range(2): tint(sheets["weapon"][c * 15 * WCELLH:(c + 1) * 15 * WCELLH], WEAPON_TINT[c])
    def write_bmp(path, img):
        H, W = img.shape[:2]; bgra = img[:, :, [2, 1, 0, 3]].tobytes()
        open(path, "wb").write(b"BM" + struct.pack("<IHHI", 54 + len(bgra), 0, 0, 54) +
                               struct.pack("<IiiHHIIiiII", 40, W, -H, 1, 32, 0, len(bgra), 2835, 2835, 0, 0) + bgra)
        print(f"wrote {path}: {W}x{H} ({len(bgra)//1048576 + 1} MB)")
    for k in sheets: write_bmp(os.path.join(out, "player_" + k + ".bmp"), sheets[k])
    txt = (f"CELLW = {CELLW}\nCELLH = {CELLH}\nCELLOX = {CELLOX}   ; column of the ground point inside a cell\nCELLOY = {CELLOY}   ; row of the ground point inside a cell\n"
           f"COLS = {COLS}\nframes per action (stand walk pickup ready attack skill cast hurt dead): {[nf for _, _, nf in ACTIONS]}\n"
           f"body.bmp rows = {45}\nWCELLW = {WCELLW}\nWCELLH = {WCELLH}\nWCELLOX = {WCELLOX}\nWCELLOY = {WCELLOY}\nweapon.bmp rows = 30, width = {COLS * WCELLW}\n")
    txt += ("direction -> row-view, flip   (dir 0 S, 1 SW, 2 W, 3 NW, 4 N, 5 NE, 6 E, 7 SE)\n"
            "  stand/walk : views 0,1,2,3,4,3f,2f,1f\n  other actions: views 0,1,3,3,4,3f,1f,1f\n")
    open(os.path.join(out, "player_layout.txt"), "w").write(txt); print(txt)
main()
