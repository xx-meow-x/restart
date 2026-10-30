#!/usr/bin/env python3
"""
bake_props.py - bake the 3D models standing on the Clock Tower maps into 2D sprites for game.asm.

  python bake_props.py  <ragnarok map folder>  <models folder (.rsm)>  <texture folder(s), ';'-separated>  <output folder>  ctb4 ctb2 ...

For every map it writes <map>.prp.  Each placed model (position, rotation, scale from the .rsw) is drawn once with the
game's own view projection (east 8 px/unit, north-south 5.2 px/unit, height 3.2 px/unit); models that share the same
rotation and scale share one sprite.
.prp layout (all little-endian 32-bit unless noted):
   'PRP1', nSprites, nProps, mapHeightInRows, maxSpriteHeightPx, maxPixelsHangingBelowTheBase, nFloorProps
   nSprites x { pixelOffset (in dwords from the start of the pixel block), width, height, anchorX, anchorY }   (the anchor is where the model's origin sits in the sprite)
   (mapHeightInRows + 1) x { first prop of that row }                    the first nFloorProps props are flat ones (floor grates, gears lying on the floor): drawn right after the ground, before
                                                                          any wall or character.  The rest are sorted by the map row of their base and drawn row by row.
   nProps x { sprite, worldPixelX, worldPixelY }                          world pixels = cell * 40 / cell * 26; Y already has the lift above the floor taken off
   pixel block: the sprites one after another, each width*height dwords 0xAARRGGBB (alpha 0 = transparent)
Needs: pip install numpy pillow scipy
"""
import os, sys, re, json, struct, time
import numpy as np
from scipy import ndimage
from rsm import read_rsm
from mesh import build, center_model, Textures, dec, add_lid, LID_MODELS
from raster import place, render, mips, PX_H

TW, TH = 40, 26
FLAT_PX, FLAT_LIFT = 14, 24       # a prop at most this many px tall that sits within this many px of the floor counts as flat
WALK = (0, 3, 4, 6)

def base(n): return n.replace('\\\\', '/').replace('\\', '/').split('/')[-1].lower()

def read_rsw(path):
    """model placements from a .rsw: [(name, pos, rot, scale)] ; only version 2.x header layouts used by these maps"""
    d = open(path, 'rb').read(); maj, mi = d[4], d[5]; ver = maj + mi / 10
    o = 6 + 40 * 4                                       # ini, gnd, gat, src file names
    if ver >= 1.4: o += 40                              # (scr/gat order differs by version; names are 40 bytes each)
    return d, ver

def main():
    ragdir, rsmdir, texdirs, out = sys.argv[1:5]; maps = sys.argv[5:]
    os.makedirs(out, exist_ok=True)
    models = {}
    for f in os.listdir(rsmdir): models[dec(f).encode('latin-1').decode('cp949', 'replace').lower()] = os.path.join(rsmdir, f)
    T = Textures(texdirs.split(';')); cache_mesh = {}
    placements = json.load(open(os.path.join(ragdir, 'rsw_models.json')))
    for m in maps:
        t0 = time.time()
        g = open(os.path.join(ragdir, f'1@{m}.gat'), 'rb').read(); W, H = struct.unpack('<ii', g[6:14])
        a = np.frombuffer(g, np.dtype([('f', '<f4', 4), ('t', '<u4')]), W * H, 14)
        alt = a['f'].mean(axis=1).reshape(H, W); walk = np.isin(a['t'], WALK).reshape(H, W)
        _, (iy, ix) = ndimage.distance_transform_edt(~walk, return_indices=True)
        alt_floor = alt[iy, ix]                                   # altitude of the nearest walkable floor (what the flat game ground stands for)
        sprites = {}; sprite_list = []; props = []; flat = {}
        for name, pos, rot, sc in placements[m]:
            b = base(name)
            key = (b, tuple(round(r, 1) for r in rot), tuple(round(s, 2) for s in sc))
            if key not in sprites:
                if b not in cache_mesh:
                    mm = read_rsm(models[b]); gm = build(mm); c, _ = center_model(gm['tris'])
                    if b.replace('.rsm', '') in LID_MODELS: gm, c = add_lid(gm, c)       # these models have no top in the original data
                    cache_mesh[b] = (mm, gm, c, [None if T.get(tn) is None else mips(T.get(tn)) for tn in mm['textures']])
                mm, gm, c, tl = cache_mesh[b]
                pl = place(c, key[1], key[2]); uvs = gm['uv']
                if key[2][0] * key[2][1] * key[2][2] < 0:                 # a mirrored placement (negative scale) turns every face inside out:
                    pl = pl[:, [0, 2, 1], :]; uvs = uvs[:, [0, 2, 1], :]    # swap two corners of each triangle so front faces stay front faces
                img, ax, ay = render(pl, uvs, gm['tex'], gm['two'], tl)
                sprites[key] = len(sprite_list); sprite_list.append((img, ax, ay)); flat[sprites[key]] = (-pl[..., 1]).max() - (-pl[..., 1]).min()   # height range in units
            cx = pos[0] / 5 + W / 2; cz = pos[2] / 5 + H / 2          # cells east, cells north (from the south edge)
            ci, cj = min(max(int(cx), 0), W - 1), min(max(int(cz), 0), H - 1)
            lift = (alt_floor[cj, ci] - pos[1]) * PX_H                # pixels above the nearest floor
            gy = H - cz                                               # rows from the north edge
            is_floor = flat[sprites[key]] * PX_H <= FLAT_PX and abs(lift) <= FLAT_LIFT
            props.append((-1 if is_floor else min(max(int(gy), 0), H - 1), sprites[key], int(round(cx * TW)), int(round(gy * TH - lift)), int(gy)))
        props.sort(key=lambda p: (p[0] if p[0] >= 0 else -1, p[4], p[3], p[2]))
        nfloor = sum(1 for p in props if p[0] < 0)
        cnt = np.bincount([p[0] for p in props if p[0] >= 0], minlength=H); rowstart = np.zeros(H + 1, np.uint32); rowstart[0] = nfloor; rowstart[1:] = nfloor + np.cumsum(cnt)
        # pixel block
        px = []; table = []; off = 0; maxh = 0; maxbelow = 0
        for img, ax, ay in sprite_list:
            h, w = img.shape[:2]; maxh = max(maxh, h); maxbelow = max(maxbelow, h - ay)
            argb = (img[..., 3].astype(np.uint32) << 24) | (img[..., 0].astype(np.uint32) << 16) | (img[..., 1].astype(np.uint32) << 8) | img[..., 2].astype(np.uint32)
            px.append(argb.ravel()); table.append((off, w, h, ax, ay)); off += w * h
        blob = b'PRP1' + struct.pack('<IIIIII', len(sprite_list), len(props), H, maxh, max(maxbelow, 0), nfloor)
        blob += b''.join(struct.pack('<IIIii', *t) for t in table) + rowstart.tobytes()
        blob += b''.join(struct.pack('<Iii', p[1], p[2], p[3]) for p in props) + np.concatenate(px).astype('<u4').tobytes()
        open(os.path.join(out, m + '.prp'), 'wb').write(blob)
        print(f"{m}: {len(props)} props, {len(sprite_list)} sprites, {nfloor} flat, tallest {maxh}px, hangs {maxbelow}px below the base, file {len(blob)/1e6:.1f} MB, {time.time()-t0:.0f}s")
        pass
        json.dump([(s[1], s[2], s[0].shape[1], s[0].shape[0]) for s in sprite_list], open(os.path.join(out, m + '_sprites.json'), 'w'))
        # keep the sprite pixels for the preview renderer
        np.savez_compressed(os.path.join(out, m + '_sprites.npz'), *[s[0] for s in sprite_list])
main()
