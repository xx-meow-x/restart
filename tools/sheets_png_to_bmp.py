#!/usr/bin/env python3
"""
sheets_png_to_bmp.py - convert a sprite sheet you drew (PNG) into the BMP the game loads, and check that its layout is right.

  python sheets_png_to_bmp.py  <kind>  <your sheet.png>  [output.bmp]  [--key RRGGBB]  [--pad]
  python sheets_png_to_bmp.py  check  <a .bmp from the game folder>

kind (the name the game looks for)    sheet size      grid
  body     player_body.bmp            1035 x 5445     9 columns x 45 rows of 115 x 121     row = action * 5 + view
  head     player_head.bmp            1035 x 5445     the same grid as the body
  weapon   player_weapon.bmp          1323 x 2760     9 columns x 30 rows of 147 x 92      row = (class * 3 + block) * 5 + view
  icons    icons.bmp                   832 x 64       13 icons of 64 x 64 in one row       icon number = item id
  monster  monster.bmp (also monster1..4)  768 x 1040   6 columns x 10 rows of 128 x 104     row = action * 2 + view
  menuicon menu_icon.bmp                64 x 64       one picture: the marker beside the selected menu button
  blacksmith blacksmith.bmp            480 x 104      5 pictures of 96 x 104: the hammering (see convert_npc.py)
  cursors  cursors.bmp                 800 x 32       25 frames of 32 x 32 in one row
  campfire campfire.bmp                448 x 64       7 pictures of 64 x 64: 0-5 burning, 6 burnt out

The sheet must be exactly the size above: the game finds every picture by its place in the grid, so one pixel too wide
shifts everything. If your sheet is not the right size the tool says so and stops. Options:
  --key RRGGBB   a plain background colour in your PNG (for example FF00FF) to make transparent
  --pad          put a too-small or too-large sheet in the top-left corner of a transparent sheet of the right size
                 (use this only when you know your pictures already sit on the grid)
The output is a 32-bit top-down BMP with transparency, the format game.exe reads. Put it next to game.exe.
Needs: pip install pillow
"""
import struct, sys
from PIL import Image

KINDS = {  # kind: (file the game loads, width, height, columns, rows, cell width, cell height)
    "body":    ("player_body.bmp",   1035, 5445, 9, 45, 115, 121),
    "head":    ("player_head.bmp",   1035, 5445, 9, 45, 115, 121),
    "weapon":  ("player_weapon.bmp", 1323, 2760, 9, 30, 147, 92),
    "icons":   ("icons.bmp",          832,   64, 13, 1, 64, 64),
    "monster": ("monster.bmp",        768, 1040, 6, 10, 128, 104),
    "menuicon": ("menu_icon.bmp",      64,   64, 1, 1, 64, 64),
    "blacksmith": ("blacksmith.bmp",  480,  104, 5, 1, 96, 104),
    "cursors": ("cursors.bmp",        800,   32, 25, 1, 32, 32),
    "campfire": ("campfire.bmp",      448,   64, 7, 1, 64, 64),
}

def write_bmp(path, im):
    raw = im.tobytes("raw", "BGRA")
    with open(path, "wb") as f:
        f.write(b"BM" + struct.pack("<IHHI", 54 + len(raw), 0, 0, 54) +
                struct.pack("<IiiHHIIiiII", 40, im.width, -im.height, 1, 32, 0, len(raw), 2835, 2835, 0, 0) + raw)

def check(path):
    d = open(path, "rb").read(54)
    w, h = struct.unpack("<ii", d[18:26]); bpp = struct.unpack("<H", d[28:30])[0]
    print(f"{path}: {w} x {abs(h)}, {bpp} bit, {'top-down' if h < 0 else 'BOTTOM-UP (the game wants top-down)'}")
    for k, (name, W, H, c, r, cw, ch) in KINDS.items():
        if path.replace("\\", "/").split("/")[-1].lower() == name:
            ok = (w == W and abs(h) == H and bpp == 32 and h < 0)
            print(f"  this is the {k} sheet: expected {W} x {H}, 32 bit, top-down  ->  {'OK' if ok else 'WRONG'}")

def main():
    a = sys.argv[1:]
    if len(a) >= 2 and a[0] == "check":
        check(a[1]); return
    key = None; pad = False
    if "--key" in a:
        i = a.index("--key"); key = a[i + 1]; del a[i:i + 2]
    if "--pad" in a:
        a.remove("--pad"); pad = True
    if len(a) < 2 or a[0] not in KINDS:
        print(__doc__); sys.exit(1)
    kind, src = a[0], a[1]
    name, W, H, cols, rows, cw, ch = KINDS[kind]
    out = a[2] if len(a) > 2 else name
    im = Image.open(src).convert("RGBA")
    if key:
        r, g, b = int(key[0:2], 16), int(key[2:4], 16), int(key[4:6], 16)
        px = im.load()
        for y in range(im.height):
            for x in range(im.width):
                p = px[x, y]
                if p[0] == r and p[1] == g and p[2] == b: px[x, y] = (0, 0, 0, 0)
    if im.size != (W, H):
        print(f"Your sheet is {im.width} x {im.height}, but the {kind} sheet must be {W} x {H}")
        print(f"({cols} column{'s' if cols > 1 else ''} x {rows} row{'s' if rows > 1 else ''} of {cw} x {ch}).")
        if im.width % cw == 0 and im.height % ch == 0:
            print(f"Your sheet is {im.width // cw} columns x {im.height // ch} rows of {cw} x {ch}: the grid has to be {cols} x {rows}.")
        if not pad:
            print("Nothing was written. Fix the size, or use --pad if your pictures already sit on the right grid."); sys.exit(2)
        canvas = Image.new("RGBA", (W, H), (0, 0, 0, 0)); canvas.paste(im.crop((0, 0, min(W, im.width), min(H, im.height))), (0, 0)); im = canvas
        print("--pad: placed in the top-left corner of a sheet of the right size.")
    write_bmp(out, im)
    print(f"wrote {out}: {W} x {H} = {cols} x {rows} cells of {cw} x {ch}, 32-bit top-down with transparency. Put it next to game.exe.")
main()
