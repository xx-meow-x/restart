"""Render a placed model into an RGBA sprite using the game's oblique projection (x 8 px/unit, north-south 5.2 px/unit, height 3.2 px/unit)."""
import numpy as np
from PIL import Image

PX_X, PX_Z, PX_H = 8.0, 5.2, 3.2            # screen pixels per world unit: east, north-south, height

def rot_x(a): c, s = np.cos(a), np.sin(a); return np.array([[1, 0, 0], [0, c, -s], [0, s, c]])
def rot_y(a): c, s = np.cos(a), np.sin(a); return np.array([[c, 0, s], [0, 1, 0], [-s, 0, c]])
def rot_z(a): c, s = np.cos(a), np.sin(a); return np.array([[c, -s, 0], [s, c, 0], [0, 0, 1]])

def place(tris_centered, rot_deg, scale):
    """Model (centred, y down) -> placed around its own origin, still y down: Rz * Rx * Ry * S, as Ragnarok's client does."""
    r = np.radians(rot_deg)
    M = rot_z(r[2]) @ rot_x(r[0]) @ rot_y(r[1]) @ np.diag(scale)
    return tris_centered @ M.T

def mips(tex):
    out = [tex]; im = Image.fromarray(tex)
    while im.width > 1 and im.height > 1 and len(out) < 6:
        # premultiply by alpha so transparent magenta does not bleed into the edges
        a = np.array(im).astype(np.float32); al = a[:, :, 3:4] / 255.0; pm = np.concatenate([a[:, :, :3] * al, a[:, :, 3:4]], 2)
        sm = Image.fromarray(pm.astype(np.uint8), 'RGBA').resize((max(1, im.width // 2), max(1, im.height // 2)), Image.BOX)
        s = np.array(sm).astype(np.float32); al2 = np.maximum(s[:, :, 3:4] / 255.0, 1e-6)
        im = Image.fromarray(np.concatenate([np.clip(s[:, :, :3] / al2, 0, 255), s[:, :, 3:4]], 2).astype(np.uint8), 'RGBA'); out.append(np.array(im))
    return out

LIGHT = np.array([-0.35, -0.55, 0.75]); LIGHT /= np.linalg.norm(LIGHT)       # (east, north, up): from the upper left, in front

def render(tris, uv, texidx, two, texlist, ambient=0.55, cull=False):
    """tris: (N,3,3) placed model, columns = (east, down, north).  texlist: per model texture index -> list of mip arrays or None.
       Returns (RGBA uint8 array, anchor_x, anchor_y) where the anchor is where the model origin lands in the sprite."""
    E, D, N = tris[..., 0], tris[..., 1], tris[..., 2]
    Hup = -D; Zs = -N                                   # height up, south
    sx = E * PX_X; sy = Zs * PX_Z - Hup * PX_H; near = 3.2 * Zs + 5.2 * Hup
    minx, maxx, miny, maxy = np.floor(sx.min()) - 1, np.ceil(sx.max()) + 1, np.floor(sy.min()) - 1, np.ceil(sy.max()) + 1
    W, H = int(maxx - minx), int(maxy - miny)
    img = np.zeros((H, W, 4), np.uint8); zbuf = np.full((H, W), -1e9, np.float32)
    ax, ay = -minx, -miny
    # face normals in (east, north, up) space for lighting and culling
    p = np.stack([E, N, Hup], -1); nrm = np.cross(p[:, 1] - p[:, 0], p[:, 2] - p[:, 0]); ln = np.linalg.norm(nrm, axis=1); ln[ln == 0] = 1; nrm = nrm / ln[:, None]
    view = np.array([0.0, -3.2, 5.2]); view /= np.linalg.norm(view)           # from the surface towards the camera (south and up), in (east, north, up)
    for i in range(len(tris)):
        t = texlist[texidx[i]] if 0 <= texidx[i] < len(texlist) else None
        n = nrm[i]; facing = float(n @ view)
        if facing < 0:
            if cull and not two[i]: continue
            n = -n
        x0, y0 = sx[i] - minx, sy[i] - miny; z = near[i]
        bx0, bx1 = int(max(0, np.floor(x0.min()))), int(min(W - 1, np.ceil(x0.max())))
        by0, by1 = int(max(0, np.floor(y0.min()))), int(min(H - 1, np.ceil(y0.max())))
        if bx1 < bx0 or by1 < by0: continue
        den = (y0[1] - y0[2]) * (x0[0] - x0[2]) + (x0[2] - x0[1]) * (y0[0] - y0[2])
        if abs(den) < 1e-9: continue
        gx, gy = np.meshgrid(np.arange(bx0, bx1 + 1) + 0.5, np.arange(by0, by1 + 1) + 0.5)
        w0 = ((y0[1] - y0[2]) * (gx - x0[2]) + (x0[2] - x0[1]) * (gy - y0[2])) / den
        w1 = ((y0[2] - y0[0]) * (gx - x0[2]) + (x0[0] - x0[2]) * (gy - y0[2])) / den
        w2 = 1 - w0 - w1; inside = (w0 >= -1e-6) & (w1 >= -1e-6) & (w2 >= -1e-6)
        if not inside.any(): continue
        depth = w0 * z[0] + w1 * z[1] + w2 * z[2]
        sub = zbuf[by0:by1 + 1, bx0:bx1 + 1]; ok = inside & (depth > sub)
        if not ok.any(): continue
        light = ambient + (1 - ambient) * max(0.0, float(n @ LIGHT)); 
        if t is None: col = np.zeros(ok.shape + (4,), np.uint8); col[...] = (150, 150, 150, 255)
        else:
            u = (w0 * uv[i, 0, 0] + w1 * uv[i, 1, 0] + w2 * uv[i, 2, 0]); v = (w0 * uv[i, 0, 1] + w1 * uv[i, 1, 1] + w2 * uv[i, 2, 1])
            th, tw = t[0].shape[:2]
            uva = abs((uv[i, 1, 0] - uv[i, 0, 0]) * (uv[i, 2, 1] - uv[i, 0, 1]) - (uv[i, 2, 0] - uv[i, 0, 0]) * (uv[i, 1, 1] - uv[i, 0, 1])) * tw * th
            sca = abs(den) / 2
            lvl = int(np.clip(round(0.5 * np.log2(max(uva, 1e-6) / max(sca, 1e-6))), 0, len(t) - 1))
            m = t[lvl]; mh, mw = m.shape[:2]
            tx = np.floor((u % 1.0) * mw).astype(int) % mw; ty = np.floor((v % 1.0) * mh).astype(int) % mh
            col = m[ty, tx].copy()
        col[..., :3] = np.clip(col[..., :3].astype(np.float32) * light, 0, 255).astype(np.uint8)
        vis = ok & (col[..., 3] > 127)
        if not vis.any(): continue
        reg = img[by0:by1 + 1, bx0:bx1 + 1]; reg[vis] = col[vis]; reg[vis, 3] = 255; sub[vis] = depth[vis]
    return img, int(ax), int(ay)
