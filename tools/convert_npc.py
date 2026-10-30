#!/usr/bin/env python3
"""
convert_npc.py - turn a row of animation frames (one PNG, the frames side by side) into a game sheet for an NPC.

  python convert_npc.py  <frames.png>  <number of frames>  <height in pixels>  <output.bmp>  [cell width] [cell height]

The frames are found by the gaps between the figures. Every frame is scaled by the same amount so that the figure is the given
height (the median height of the frames), and placed in a cell of cell width x cell height (default 96 x 104) with the middle of
its base (the lowest part of the picture) at the middle of the cell and the base on row (cell height - 4). After shrinking, a
pixel is opaque or transparent (the game has no half-transparency). The sheet is the frames side by side.
Example (the Blacksmith):  python convert_npc.py blacksmith_a.png 5 92 blacksmith.bmp
Needs: pip install pillow numpy
"""
import struct, sys
import numpy as np
from PIL import Image

def main():
    src, nf, height, out = sys.argv[1], int(sys.argv[2]), float(sys.argv[3]), sys.argv[4]
    cw = int(sys.argv[5]) if len(sys.argv) > 5 else 96; ch = int(sys.argv[6]) if len(sys.argv) > 6 else 104
    im = Image.open(src).convert("RGBA"); a = np.array(im); al = a[:, :, 3] > 0
    idx = np.nonzero(al.any(axis=0))[0]; runs = None
    for gap in (60, 40, 25, 15, 8):
        r = []; st = last = idx[0]
        for x in idx[1:]:
            if x - last > gap: r.append((st, last)); st = x
            last = x
        r.append((st, last))
        if len(r) == nf: runs = r; break
    if runs is None: sys.exit(f"could not find {nf} frames in {src}")
    info = []
    for (x0, x1) in runs:
        ys, xs = np.nonzero(al[:, x0:x1 + 1]); low = ys > ys.max() - max(3, int(0.08 * (ys.max() - ys.min())))
        info.append((ys.min(), ys.max(), xs[low].mean()))                    # top, bottom, x of the middle of the base
    s = height / float(np.median([i[1] - i[0] + 1 for i in info])); sheet = np.zeros((ch, nf * cw, 4), np.uint8)
    for f, ((x0, x1), (top, bot, fx)) in enumerate(zip(runs, info)):
        frame = im.crop((x0, top, x1 + 1, bot + 1)); w, h = max(1, round(frame.width * s)), max(1, round(frame.height * s))
        sm = np.array(frame.resize((w, h), Image.LANCZOS)); op = sm[:, :, 3] >= 110; sm[:, :, 3] = np.where(op, 255, 0); sm[~op, :3] = 0
        oy = ch - 4 - h; ox = int(round(cw / 2 - fx * s))                      # fx is already measured from the start of the cropped frame
        ys, xs = np.nonzero(sm[:, :, 3] > 0)
        for y, x in zip(ys, xs):
            X, Y = ox + x, oy + y
            if 0 <= X < cw and 0 <= Y < ch: sheet[Y, f * cw + X] = sm[y, x]
    raw = sheet[:, :, [2, 1, 0, 3]].tobytes()
    open(out, "wb").write(b"BM" + struct.pack("<IHHI", 54 + len(raw), 0, 0, 54) + struct.pack("<IiiHHIIiiII", 40, nf * cw, -ch, 1, 32, 0, len(raw), 2835, 2835, 0, 0) + raw)
    print(f"wrote {out}: {nf} frames of {cw} x {ch} (scale {s:.3f})")
main()
