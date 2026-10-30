"""Minimal Ragnarok .rsm (model) reader, version 1.x.  Returns textures and nodes with their static mesh."""
import struct, numpy as np

class Node:  pass

def read_rsm(path):
    d = open(path, 'rb').read(); o = 0
    assert d[:4] == b'GRSM'; maj, mi = d[4], d[5]; ver = maj + mi / 10; o = 6
    assert maj == 1, "only version 1.x"
    anim, shade = struct.unpack('<ii', d[o:o + 8]); o += 8
    alpha = 255
    if ver >= 1.4: alpha = d[o]; o += 1
    o += 16
    tc = struct.unpack('<i', d[o:o + 4])[0]; o += 4
    textures = [d[o + i * 40:o + (i + 1) * 40].split(b'\0')[0] for i in range(tc)]; o += tc * 40
    main = d[o:o + 40].split(b'\0')[0]; o += 40
    nn = struct.unpack('<i', d[o:o + 4])[0]; o += 4
    nodes = []
    for _ in range(nn):
        n = Node()
        n.name = d[o:o + 40].split(b'\0')[0]; n.parent = d[o + 40:o + 80].split(b'\0')[0]; o += 80
        k = struct.unpack('<i', d[o:o + 4])[0]; o += 4
        n.tex = list(struct.unpack(f'<{k}i', d[o:o + 4 * k])); o += 4 * k
        n.mat3 = np.array(struct.unpack('<9f', d[o:o + 36]), np.float64).reshape(3, 3); o += 36     # offset matrix (rows)
        n.offset = np.array(struct.unpack('<3f', d[o:o + 12]), np.float64); o += 12
        n.pos = np.array(struct.unpack('<3f', d[o:o + 12]), np.float64); o += 12
        n.rotangle = struct.unpack('<f', d[o:o + 4])[0]; o += 4
        n.rotaxis = np.array(struct.unpack('<3f', d[o:o + 12]), np.float64); o += 12
        n.scale = np.array(struct.unpack('<3f', d[o:o + 12]), np.float64); o += 12
        vc = struct.unpack('<i', d[o:o + 4])[0]; o += 4
        n.verts = np.frombuffer(d, '<f4', vc * 3, o).reshape(vc, 3).astype(np.float64); o += vc * 12
        tv = struct.unpack('<i', d[o:o + 4])[0]; o += 4
        if ver >= 1.2:
            a = np.frombuffer(d, np.dtype([('c', '<u4'), ('u', '<f4'), ('v', '<f4')]), tv, o); o += tv * 12
            n.uv = np.stack([a['u'], a['v']], 1).astype(np.float64)
        else:
            n.uv = np.frombuffer(d, '<f4', tv * 2, o).reshape(tv, 2).astype(np.float64); o += tv * 8
        fc = struct.unpack('<i', d[o:o + 4])[0]; o += 4
        fsz = 24 if ver >= 1.2 else 20
        fdt = np.dtype([('v', '<u2', 3), ('t', '<u2', 3), ('tex', '<u2'), ('pad', '<u2'), ('two', '<i4')] + ([('smooth', '<i4')] if ver >= 1.2 else []))
        n.faces = np.frombuffer(d, fdt, fc, o); o += fc * fsz
        if ver >= 1.5:                                   # scale keyframes (not in 1.4)
            sk = struct.unpack('<i', d[o:o + 4])[0]; o += 4 + sk * 16
        rk = struct.unpack('<i', d[o:o + 4])[0]; o += 4
        n.rotkeys = np.frombuffer(d, np.dtype([('f', '<i4'), ('q', '<f4', 4)]), rk, o) if rk else None; o += rk * 20
        if ver >= 1.5:
            pk = struct.unpack('<i', d[o:o + 4])[0]; o += 4 + pk * 16
        nodes.append(n)
    return dict(ver=ver, textures=textures, main=main, nodes=nodes, anim=anim, shade=shade, rest=len(d) - o, size=len(d))
