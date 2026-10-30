#!/usr/bin/env python3
"""
gat_to_map.py - turn a Ragnarok .gat walkability file into the .map file game.asm loads.

  python gat_to_map.py ecl_fild01.gat ecl_fild01.map [exit_map_number]

Output: width*height characters, row after row, north row first, NO line breaks.
  '.' walkable   '#' not walkable   one digit = exit to that map (the return door)
RO stores GAT rows starting at the SOUTH edge, so the rows are flipped here.
The return door is placed on a walkable cell of the biggest walkable area, near its
southern edge (cells around it are all open, so you arrive on solid ground).
"""
import struct, sys
from collections import deque
src, dst = sys.argv[1], sys.argv[2]
door = sys.argv[3] if len(sys.argv) > 3 else "7"
d = open(src, "rb").read()
assert d[:4] == b"GRAT", "not a GAT file"
w, h = struct.unpack("<ii", d[6:14])
walk = [[False]*w for _ in range(h)]               # walk[y][x], y=0 is the SOUTH row in the file
for y in range(h):
    for x in range(w):
        t = struct.unpack("<I", d[14 + (y*w + x)*20 + 16: 14 + (y*w + x)*20 + 20])[0]
        walk[y][x] = t in (0, 3, 4, 6)             # walkable cell types (0 ground, 3 water, 4/6 walkable variants)
# flip so row 0 is the north edge
grid = [[walk[h-1-r][c] for c in range(w)] for r in range(h)]
# biggest walkable area (4-connected)
seen = [[False]*w for _ in range(h)]; best = []
for r in range(h):
    for c in range(w):
        if grid[r][c] and not seen[r][c]:
            comp = []; q = deque([(r, c)]); seen[r][c] = True
            while q:
                a, b = q.popleft(); comp.append((a, b))
                for da, db in ((1,0),(-1,0),(0,1),(0,-1)):
                    na, nb = a+da, b+db
                    if 0 <= na < h and 0 <= nb < w and grid[na][nb] and not seen[na][nb]:
                        seen[na][nb] = True; q.append((na, nb))
            if len(comp) > len(best): best = comp
def open_around(r, c):
    return all(0 <= r+dr < h and 0 <= c+dc < w and grid[r+dr][c+dc] for dr in (-1,0,1) for dc in (-1,0,1))
cands = [(r, c) for r, c in best if open_around(r, c)]
er, ec = max(cands, key=lambda p: (p[0], -abs(p[1] - w//2)))   # southernmost, nearest the middle
rows = []
for r in range(h):
    rows.append("".join(door if (r, c) == (er, ec) else ("." if grid[r][c] else "#") for c in range(w)))
open(dst, "w", newline="").write("".join(rows))
print(f"{w}x{h}: {sum(map(sum, grid))} walkable cells, biggest area {len(best)}; door '{door}' at x={ec}, y={er}")
