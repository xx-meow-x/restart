"""Build a static triangle mesh from a parsed .rsm (see rsm.py) and load textures."""
import numpy as np, os, re
from PIL import Image
from rsm import read_rsm

def dec(n): return re.sub(r'#U([0-9a-fA-F]{4})', lambda m: chr(int(m.group(1), 16)), n)

def axis_angle(axis, ang):
    n = np.linalg.norm(axis)
    if n < 1e-9 or abs(ang) < 1e-9: return np.eye(3)
    x, y, z = axis / n; c, s = np.cos(ang), np.sin(ang); t = 1 - c
    return np.array([[t*x*x + c, t*x*y - s*z, t*x*z + s*y], [t*x*y + s*z, t*y*y + c, t*y*z - s*x], [t*x*z - s*y, t*y*z + s*x, t*z*z + c]])

def quat_matrix(q):
    x, y, z, w = q; n = np.sqrt(x*x + y*y + z*z + w*w) or 1; x, y, z, w = x/n, y/n, z/n, w/n
    return np.array([[1-2*(y*y+z*z), 2*(x*y-z*w), 2*(x*z+y*w)], [2*(x*y+z*w), 1-2*(x*x+z*z), 2*(y*z-x*w)], [2*(x*z-y*w), 2*(y*z+x*w), 1-2*(x*x+y*y)]])

def build(m, use_pos_for_root=True):
    """-> dict(tris=(N,3,3) xyz, uv=(N,3,2), tex=(N,) texture index into m['textures'], two=(N,))  in model space, y down."""
    nodes = {n.name: n for n in m['nodes']}; cache = {}
    def world(n):
        if n.name in cache: return cache[n.name]
        R = axis_angle(n.rotaxis, n.rotangle)
        if n.rotkeys is not None and len(n.rotkeys):
            k = n.rotkeys[np.argmin(n.rotkeys['f'])]; R = quat_matrix(k['q'])
        L = np.eye(4); L[:3, :3] = R @ np.diag(n.scale)
        if n.parent in nodes and n.parent != n.name or use_pos_for_root: L[:3, 3] = n.pos
        W = world(nodes[n.parent]) @ L if (n.parent in nodes and n.parent != n.name) else L
        cache[n.name] = W; return W
    T, UV, TX, TW = [], [], [], []
    for n in m['nodes']:
        W = world(n)
        v = (n.verts @ n.mat3.T) + n.offset                       # node's own vertices -> node space
        v = (np.c_[v, np.ones(len(v))] @ W.T)[:, :3]              # node space -> model space
        f = n.faces
        T.append(v[f['v']]); UV.append(n.uv[f['t']])
        gt = np.array(n.tex, dtype=np.int64)
        TX.append(gt[f['tex']] if len(gt) else np.zeros(len(f), int)); TW.append(f['two'] != 0)
    return dict(tris=np.concatenate(T), uv=np.concatenate(UV), tex=np.concatenate(TX), two=np.concatenate(TW))

def center_model(tris):
    """Ragnarok puts a model's centre (x,z) on its position and its lowest point (max y, since y is down) on the ground."""
    lo, hi = tris.reshape(-1, 3).min(0), tris.reshape(-1, 3).max(0)
    off = np.array([-(lo[0] + hi[0]) / 2, -hi[1], -(lo[2] + hi[2]) / 2])
    return tris + off, off

class Textures:
    def __init__(self, dirs):
        self.files = {}
        for d in dirs:
            for f in os.listdir(d): self.files[dec(f).lower()] = os.path.join(d, f)
        self.cache = {}
    def get(self, name):
        key = name.replace('\\', '/').split('/')[-1].lower() if isinstance(name, str) else name.decode('latin-1').replace('\\', '/').split('/')[-1].lower()
        if key not in self.cache:
            p = self.files.get(key)
            if p is None: self.cache[key] = None
            else:
                im = Image.open(p).convert('RGBA'); a = np.array(im)
                a[(a[:, :, 0] > 240) & (a[:, :, 1] < 16) & (a[:, :, 2] > 240), 3] = 0         # magenta = transparent
                self.cache[key] = a
        return self.cache[key]


LID_MODELS = ['나무상자01', '나무상자02', '술통01', '드럼통1', '책장02', '가구3', '옷장2', '찬장1', '무기장1']   # crates, barrels, drums, cabinets: the original models have no top face

def add_lid(g, c):
    """Close a box-like model: copy its bottom face(s) up to the top with the winding reversed so they face up.
       g = the mesh dict from build(), c = the centred triangles (y down, the bottom at y = 0).  Returns (g, c) with the lid added."""
    q = np.stack([c[..., 0], c[..., 2], -c[..., 1]], -1)                       # (east, north, up)
    nr = np.cross(q[:, 1] - q[:, 0], q[:, 2] - q[:, 0]); ln = np.linalg.norm(nr, axis=1); ln[ln == 0] = 1; nr = nr / ln[:, None]
    bottom = np.where(nr[:, 2] < -0.7)[0]
    if len(bottom) == 0: return g, c
    H = q[..., 2].max() - q[..., 2].min()
    lid = c[bottom].copy(); lid[..., 1] -= H                                   # y down: up is negative
    lid = lid[:, [0, 2, 1], :]
    g2 = dict(g); g2['tris'] = np.concatenate([g['tris'], g['tris'][bottom][:, [0, 2, 1], :]])
    g2['uv'] = np.concatenate([g['uv'], g['uv'][bottom][:, [0, 2, 1], :]])
    g2['tex'] = np.concatenate([g['tex'], g['tex'][bottom]]); g2['two'] = np.concatenate([g['two'], np.zeros(len(bottom), bool)])
    return g2, np.concatenate([c, lid])
