#!/usr/bin/env python3
"""
gat_to_walls.py - bake wall and pillar heights for game.asm from Ragnarok .gat / .gnd files.

  python gat_to_walls.py gnd_folder output_folder [pixels_per_unit] [props_folder]

For every map it also writes <map>.wtx (see below).
For every map it writes <map>.hgt: one byte per cell (north row first, same order as the .map),
the height in screen pixels of the wall or pillar standing on that cell (0 = no wall).
  * walls: blocked cells that stand higher than the nearest walkable floor, using the real
    heights stored in the map (altitude difference x pixels_per_unit, default 3.2)
  * pillars: small isolated blocked objects at floor level get a fixed height of PILLAR px as a stand-in.
    With a props_folder (the .prp files from bake_props.py) a stand-in is skipped wherever a real standing 3D
    model sits on or right next to it: the model is the pillar then.
<map>.wuv: for every wall cell that has a texture in the .wtx, the piece of that texture sheet its wall face uses in the original
map: 16 bytes = 8 little-endian 16-bit numbers (u,v of the bottom-left, bottom-right, top-left, top-right corner of the cell's part of
the face, 0..65535 across the sheet). Without the .wuv the whole sheet is tiled over the face instead.
<map>.wtx: one byte per cell (same order as the .hgt): 0 = use the map's wall texture, otherwise the number of the texture (+1)
used by the nearest real wall face of the original map (within 2 tiles). The game uses it per wall segment, so walls
are no longer all one pattern. Delete the .wtx files to go back to one texture per map.
It also prints the line  wallTex dd ...  to paste into game.asm: which ground texture each map
uses for its wall faces (taken from the wall faces in the .gnd).
Needs: pip install numpy scipy
"""
import os, struct, sys
import numpy as np
from scipy import ndimage

ORDER = ["ctf1", "ctf2", "ctf3", "ctf4", "ctb1", "ctb2", "ctb3", "ctb4"]
PILLAR, HMAX, SMALL = 88, 160, 60

def dec(b):
    try: return b.decode("cp949")
    except Exception: return b.decode("latin1")

def gnd_info(path):
    d = open(path, "rb").read()
    W, H = struct.unpack("<ii", d[6:14]); tc, tl = struct.unpack("<ii", d[18:26]); off = 26
    names = [dec(d[off+i*tl: off+(i+1)*tl].split(b"\0")[0]) for i in range(tc)]; off += tc*tl
    lc, lw, lh, _ = struct.unpack("<iiii", d[off:off+16]); off += 16 + lc*256
    sc = struct.unpack("<i", d[off:off+4])[0]; off += 4
    surf = np.frombuffer(d, np.dtype([("u", "<f4", 4), ("v", "<f4", 4), ("tex", "<i2"), ("lm", "<i2"), ("col", "u1", 4)]), sc, off); off += sc*40
    tiles = np.frombuffer(d, np.dtype([("alt", "<f4", 4), ("top", "<i4"), ("front", "<i4"), ("right", "<i4")]), W*H, off)
    return names, surf, tiles

def prop_cells(path, W, H):
    """cells (x, row counted from the SOUTH, like the .gat) under the standing props of a .prp file (flat floor props are ignored)"""
    if not os.path.exists(path): return set()
    d = open(path, "rb").read(); ns, npr, Hh, _, _, nf = struct.unpack("<IIIIII", d[4:28]); o = 28 + ns * 20
    rows = np.frombuffer(d, "<u4", Hh + 1, o); o += (Hh + 1) * 4
    props = np.frombuffer(d, np.dtype([("s", "<u4"), ("x", "<i4"), ("y", "<i4")]), npr, o)
    cells = set()
    for r in range(Hh):
        for i in range(rows[r], rows[r + 1]):
            cells.add((int(props["x"][i]) // 40, H - 1 - r))
    return cells

def main():
    gdir, out = sys.argv[1:3]; scale = float(sys.argv[3]) if len(sys.argv) > 3 else 3.2
    pdir = sys.argv[4] if len(sys.argv) > 4 else None
    os.makedirs(out, exist_ok=True)
    files = {}
    for f in os.listdir(gdir):
        for m in ORDER:
            if f.lower().endswith(m + ".gat"): files[m] = os.path.join(gdir, f)
    atlas = []; wall_tex = []
    for m in ORDER:
        names, surf, tiles = gnd_info(files[m][:-4] + ".gnd")
        for n in names:
            b = n.replace("\\", "/").split("/")[-1]
            if b.lower() not in [a.lower() for a in atlas]: atlas.append(b)
    for m in ORDER:
        g = open(files[m], "rb").read(); W, H = struct.unpack("<ii", g[6:14])
        a = np.frombuffer(g, np.dtype([("f", "<f4", 4), ("t", "<u4")]), W*H, 14)
        alt = a["f"].mean(axis=1).reshape(H, W); walk = np.isin(a["t"], (0, 3, 4, 6)).reshape(H, W)
        d, (iy, ix) = ndimage.distance_transform_edt(~walk, return_indices=True)
        hpx = (alt[iy, ix] - alt) * scale                      # >0: stands higher than the floor
        h = np.where((~walk) & (d <= 8) & (hpx >= 12), np.minimum(hpx, HMAX), 0)
        h = ndimage.median_filter(h, size=3) * (~walk)           # smooth out noise
        h = (np.round(h / 8) * 8).astype(np.int32)
        lab, k = ndimage.label(~walk, structure=np.ones((3, 3)))
        sizes = ndimage.sum(~walk, lab, range(1, k+1)); mx = ndimage.maximum(h, lab, range(1, k+1))
        npil = 0; skipped = 0; pill = np.zeros_like(walk)
        pc = prop_cells(os.path.join(pdir, m + ".prp"), W, H) if pdir else set()
        objs = ndimage.find_objects(lab)
        for i in range(k):
            if sizes[i] <= SMALL and mx[i] < 12:
                sy, sx = objs[i]
                if any((x, y) in pc for x in range(sx.start - 2, sx.stop + 2) for y in range(sy.start - 2, sy.stop + 2)): skipped += 1; continue
                h[lab == i+1] = PILLAR; pill[lab == i+1] = True; npil += 1
        h = np.clip(h, 0, 255).astype(np.uint8)[::-1]            # north row first
        open(os.path.join(out, m + ".hgt"), "wb").write(h.tobytes())
        # wall texture: most used wall-face texture, preferring names with the wall character
        names, surf, tiles = gnd_info(files[m][:-4] + ".gnd")
        cnt = {}
        for k2 in ("front", "right"):
            for i in tiles[k2][tiles[k2] >= 0]:
                n = names[surf["tex"][i]].replace("\\", "/").split("/")[-1]; cnt[n] = cnt.get(n, 0) + 1
        pick = lambda f: [n for n in sorted(cnt, key=cnt.get, reverse=True) if f(n)]
        base_names = [n.replace("\\", "/").split("/")[-1] for n in names]
        dungeon = [n for n in base_names if "\ub358\uc804" in n and "\ubc14\ub2e5" not in n]          # rock textures
        if m.startswith("ctb") and dungeon:
            cand = sorted(dungeon, key=lambda n: -cnt.get(n, 0))                                      # basements: cave rock
        else:
            cand = pick(lambda n: "\ubcbd" in n) or pick(lambda n: "\ubc14\ub2e5" not in n and "backside" not in n.lower()) or pick(lambda n: True)
        wall_tex.append([a_.lower() for a_ in atlas].index(cand[0].lower()))
        # ---- per-cell wall textures from the real wall faces of the .gnd ----
        aidx = {a_.lower(): i for i, a_ in enumerate(atlas)}
        gW, gH = struct.unpack("<ii", open(files[m][:-4] + ".gnd", "rb").read(14)[6:14])
        tex_atlas = np.array([-1 if "backside" in n.lower() else aidx.get(n.replace("\\", "/").split("/")[-1].lower(), -1) for n in names])
        # floor-only pictures (a mossy round decal, a grate, a carpet, the zodiac circle, a manhole cover, a wood sheet with magenta) must not end up on walls
        FLOOR_ONLY = {aidx[n] for n in ("gp-lostdun_g03.bmp", "prt_carpet03.bmp", "fie-05.bmp") if n in aidx} | {i for n_, i in aidx.items() if any(k in n_ for k in ("\ubc14\ub2e51", "\uc2dc\uacc4\ud0d1\ub358\uc804\ubc14\ub2e5", "\uc2dc\uacc4\ud0d1\ub0b4\ubd80\ubc14\ub2e503"))}
        tex_atlas = np.where(np.isin(tex_atlas, list(FLOOR_ONLY)), -1, tex_atlas)
        ftex = np.full(gW * gH, -1, np.int16); okf = tiles["front"] >= 0
        mT = tiles["alt"][:, 2:].mean(1).reshape(gH, gW); mN = np.zeros((gH, gW)); mN[:-1] = tiles["alt"][:, :2].mean(1).reshape(gH, gW)[1:]
        okf = okf & ((mT - mN) > 2).reshape(-1)                  # only faces that really rise to the north: walls seen from the south
        ftex[okf] = tex_atlas[surf["tex"][tiles["front"][okf]]]; ftex = ftex.reshape(gH, gW)
        wt = np.zeros((H, W), np.int16); hs = h[::-1]; uvc = np.zeros((H, W, 8), np.uint16)
        if (ftex >= 0).any():
            dist, (iy, ix) = ndimage.distance_transform_edt(ftex < 0, return_indices=True)
            ys, xs = np.nonzero(hs > 0); ty = np.clip(ys // 2 - 1, 0, gH - 1); tx = np.clip(xs // 2, 0, gW - 1)
            near = dist[ty, tx] <= 2.5
            src = np.where(near, iy[ty, tx] * gW + ix[ty, tx], -1)               # the face each wall cell borrows its piece from
            # cells with no real wall face nearby: pick one at random (but always the same one) from the real faces of this
            # map's own wall texture that are about as tall, so the pieces follow the mix the original uses
            fhc = (hs[ys, xs].astype(np.int32) - np.where(ys > 0, hs[np.maximum(ys - 1, 0), xs], 0).astype(np.int32))
            pool = np.where((ftex.reshape(-1) == wall_tex[-1]))[0]
            if len(pool):
                ph = ((mT - mN).reshape(-1)[pool] * 3.2); order = np.argsort(ph); pool, ph = pool[order], ph[order]
                need = np.where((src < 0) & (fhc > 0))[0]
                lo = np.searchsorted(ph, fhc[need] - 12); hi = np.searchsorted(ph, fhc[need] + 12)
                h1 = (tx[need].astype(np.uint64) * np.uint64(92837111)) ^ (ty[need].astype(np.uint64) * np.uint64(689287499)) ^ (xs[need].astype(np.uint64) // 2 * np.uint64(0))
                h1 = (h1 ^ (h1 >> np.uint64(13))) * np.uint64(0x9E3779B1) & np.uint64(0xFFFFFFFF)
                cnt = hi - lo; pick = np.where(cnt > 0, lo + (h1 % np.maximum(cnt, 1).astype(np.uint64)).astype(np.int64), np.clip(lo, 0, len(pool) - 1))
                src[need] = pool[pick]
            have = src >= 0
            tid = src[have]; wt[ys[have], xs[have]] = ftex.reshape(-1)[tid] + 1
            sface = tiles["front"][tid]
            U = surf["u"][sface].astype(np.float64); V = surf["v"][sface].astype(np.float64)
            altT = tiles["alt"][tid]; nid = np.minimum(tid // gW + 1, gH - 1) * gW + tid % gW; altN = tiles["alt"][nid]
            nb_higher = altN[:, :2].mean(1) < altT[:, 2:].mean(1)        # the north neighbour is higher: this face rises to the north, vertices 2,3 are its top
            bl = np.where(nb_higher, 0, 2); br = bl + 1; tl = np.where(nb_higher, 2, 0); tr = tl + 1
            ar = np.arange(len(tid)); par = (xs[have] % 2) / 2.0
            def lerp(a, b, f): return a + (b - a) * f
            cell = []
            for (c0, c1) in ((bl, br), (tl, tr)):
                for f in (par, par + 0.5):
                    cell.append((lerp(U[ar, c0], U[ar, c1], f), lerp(V[ar, c0], V[ar, c1], f)))
            (uBL, vBL), (uBR, vBR), (uTL, vTL), (uTR, vTR) = cell        # left/right at the bottom, then at the top
            q = lambda a: np.clip(np.round(a * 65535), 0, 65535).astype(np.uint16)
            uvc[ys[have], xs[have]] = np.stack([q(uBL), q(vBL), q(uBR), q(vBR), q(uTL), q(vTL), q(uTR), q(vTR)], 1)
        wt[pill] = 0; uvc[pill] = 0                              # the stand-in pillars keep the map's wall texture
        wtx = wt[::-1].astype(np.uint8)
        open(os.path.join(out, m + ".wtx"), "wb").write(wtx.tobytes())
        open(os.path.join(out, m + ".wuv"), "wb").write(uvc[::-1].astype('<u2').tobytes())
        used = np.unique(wtx[wtx > 0]) - 1
        print(f"      {m}.wtx: {int((wtx > 0).sum())} of {int((h > 0).sum())} wall cells have their own texture, {len(used)} different textures")
        print(f"{m}: {W}x{H}  wall cells {int((h > 0).sum())}  pillars {npil} (skipped {skipped}: a real model stands there)  tallest {h.max()} px  wall texture #{wall_tex[-1]} ({cand[0]})")
    print("wallTex dd " + ",".join(map(str, wall_tex)))
main()
