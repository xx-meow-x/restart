"""Draw a region of a map roughly as the game will: flat ground colours, wall faces from .hgt, then the baked props, in row order."""
import sys, struct, numpy as np
from PIL import Image
TW, TH = 40, 26
def load_prp(path):
    d = open(path, 'rb').read(); ns, npr, H, maxh, below, nfl = struct.unpack('<IIIIII', d[4:28]); o = 28
    tab = [struct.unpack('<IIIii', d[o + i * 20:o + (i + 1) * 20]) for i in range(ns)]; o += ns * 20
    rows = np.frombuffer(d, '<u4', H + 1, o); o += (H + 1) * 4
    props = [struct.unpack('<Iii', d[o + i * 12:o + (i + 1) * 12]) for i in range(npr)]; o += npr * 12
    pix = np.frombuffer(d, '<u4', offset=o); return tab, rows, props, pix, H, maxh, nfl
def sprite_img(pix, e):
    off, w, h, ax, ay = e; a = pix[off:off + w * h].reshape(h, w)
    return np.dstack([(a >> 16) & 255, (a >> 8) & 255, a & 255, a >> 24]).astype(np.uint8)
ATLAS = None
WALLTEX = {'ctf1': 6, 'ctf2': 6, 'ctf3': 18, 'ctf4': 13, 'ctb1': 2, 'ctb2': 2, 'ctb3': 2, 'ctb4': 25}
def wall_face(fh, cx, tex_index):
    """the pixels of one wall face exactly as DrawWallRow samples them (u: world x * 409 >> 8, v: (row - height) * 409 >> 8, darker below the top edge)"""
    global ATLAS
    if ATLAS is None: ATLAS = np.frombuffer(open('/home/claude/maps/maps/ground.tex', 'rb').read(), np.uint8).reshape(-1, 256, 256, 4)
    py = np.arange(fh)[:, None]; px = np.arange(TW)[None, :]
    v = (((py - fh) * 409) >> 8) & 255; u = (((cx * TW + px) * 409) >> 8) & 255
    t = ATLAS[tex_index][v, u][..., [2, 1, 0]].astype(np.int32)
    k = np.where(py < 6, 128, 100)[..., None]
    return np.dstack([np.clip(t * k >> 7, 0, 255), np.full((fh, TW), 255)]).astype(np.uint8)
def idiv(a, b): return int(a / b)
def wall_face_uv(fh, uvc, tex_index):
    """a wall face showing the cell's own piece of the texture sheet: the corner coordinates are interpolated (the same integer steps the game uses)"""
    global ATLAS
    if ATLAS is None: ATLAS = np.frombuffer(open('/home/claude/maps/maps/ground.tex', 'rb').read(), np.uint8).reshape(-1, 256, 256, 4)
    uBL, vBL, uBR, vBR, uTL, vTL, uTR, vTR = [int(x) for x in uvc]
    out = np.zeros((fh, TW, 4), np.uint8); out[..., 3] = 255
    for py in range(fh):
        t = ((((fh - py) * 2 - 1) << 14) // fh)
        uL = uBL + (((uTL - uBL) * t) >> 15); uR = uBR + (((uTR - uBR) * t) >> 15)
        vL = vBL + (((vTL - vBL) * t) >> 15); vR = vBR + (((vTR - vBR) * t) >> 15)
        dU = idiv((uR - uL) << 8, TW); dV = idiv((vR - vL) << 8, TW)
        U = (uL << 8) + (dU >> 1); V = (vL << 8) + (dV >> 1)
        k = np.arange(TW)
        u = ((U + dU * k) >> 16) & 255; v = ((V + dV * k) >> 16) & 255
        t_ = ATLAS[tex_index][v, u][:, [2, 1, 0]].astype(np.int32); lit = 128 if py < 6 else 100
        out[py, :, :3] = np.clip(t_ * lit >> 7, 0, 255)
    return out
def preview(mapname, mapdir, prpdir, x0c, y0c, wc, hc, with_props=True, with_walls=True, wall_mode='flat'):
    """region in cells: x0c,y0c = first column/row (row from the north), wc x hc cells"""
    W = np.frombuffer(open(f'{mapdir}/{mapname}.col', 'rb').read(), np.uint8)
    mp = open(f'{mapdir}/{mapname}.map', 'rb').read().split(b'\n') if False else None
    hgt = np.frombuffer(open(f'{mapdir}/{mapname}.hgt', 'rb').read(), np.uint8)
    import os; wtx = np.frombuffer(open(f'{mapdir}/{mapname}.wtx', 'rb').read(), np.uint8) if os.path.exists(f'{mapdir}/{mapname}.wtx') else None
    wuv = np.fromfile(f'{mapdir}/{mapname}.wuv', '<u2').reshape(-1, 8) if os.path.exists(f'{mapdir}/{mapname}.wuv') else None
    prp = load_prp(f'{prpdir}/{mapname}.prp'); tab, rows, props, pix, MH, maxh, nfl = prp
    # map width from file size: cells = len(col)/4 = W*MH
    cells = len(W) // 4; MW = cells // MH
    col = W.reshape(MH, MW, 4); hg = hgt.reshape(MH, MW)
    X0, Y0 = x0c * TW, y0c * TH; PW, PH = wc * TW, hc * TH
    img = Image.new('RGBA', (PW, PH), (0, 0, 0, 255)); arr = np.array(img)
    for r in range(y0c, min(MH, y0c + hc)):
        for c in range(x0c, min(MW, x0c + wc)):
            b, g, rr, _ = col[r, c]; arr[(r - y0c) * TH:(r - y0c + 1) * TH, (c - x0c) * TW:(c - x0c + 1) * TW, :3] = (rr, g, b)
    img = Image.fromarray(arr)
    def paste(im, x, y):
        img.alpha_composite(Image.fromarray(im), (x, y)) if x >= 0 and y >= 0 and x + im.shape[1] <= PW and y + im.shape[0] <= PH else None
        # clipped paste
        sx0, sy0 = max(0, -x), max(0, -y); sx1, sy1 = min(im.shape[1], PW - x), min(im.shape[0], PH - y)
        if sx1 > sx0 and sy1 > sy0 and not (x >= 0 and y >= 0 and x + im.shape[1] <= PW and y + im.shape[0] <= PH):
            img.alpha_composite(Image.fromarray(im[sy0:sy1, sx0:sx1]), (x + sx0, y + sy0))
    if with_props:
        for i in range(nfl):
            s, px, py = props[i]; off, w, h, ax, ay = tab[s]; paste(sprite_img(pix, tab[s]), px - ax - X0, py - ay - Y0)
    extra = int(np.ceil(maxh / TH)) + 2
    for r in range(y0c, min(MH, y0c + hc + extra)):
        if with_walls:
            for c in range(x0c, min(MW, x0c + wc)):
                h = int(hg[r, c])
                if not h: continue
                hs = int(hg[r + 1, c]) if r + 1 < MH else 0
                if h <= hs: continue
                fh = h - hs; top = (r + 1) * TH - hs - fh - Y0; x = c * TW - X0
                if wall_mode == 'flat':
                    wall = np.zeros((fh, TW, 4), np.uint8); wall[...] = (92, 84, 78, 255); wall[:3] = (150, 142, 130, 255)
                else:
                    ti = WALLTEX[mapname]
                    if wall_mode in ('percell', 'uv') and wtx is not None and wtx[r * MW + c] > 0: ti = int(wtx[r * MW + c]) - 1
                    if wall_mode == 'uv' and wtx is not None and wtx[r * MW + c] > 0 and wuv is not None:
                        wall = wall_face_uv(fh, wuv[r * MW + c], int(wtx[r * MW + c]) - 1)
                    else:
                        wall = wall_face(fh, c, ti)
                paste(wall, x, top)
        if with_props:
            for i in range(rows[r], rows[r + 1]):
                s, px, py = props[i]; off, w, h, ax, ay = tab[s]
                paste(sprite_img(pix, tab[s]), px - ax - X0, py - ay - Y0)
    return img
if __name__ == '__main__':
    m, x0, y0, w, h, out = sys.argv[1], *map(int, sys.argv[2:6]), sys.argv[6]
    preview(m, '/home/claude/maps' if len(sys.argv) < 8 else sys.argv[7], '/home/claude/props/out', x0, y0, w, h).convert('RGB').save(out)
