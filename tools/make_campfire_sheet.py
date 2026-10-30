#!/usr/bin/env python3
"""
make_campfire_sheet.py - draws placeholder campfire art and writes campfire.bmp (the sheet the game loads).

  python make_campfire_sheet.py  [campfire.bmp]  [preview.png]

campfire.bmp is 7 pictures of 64 x 64 in one row (448 x 64): pictures 0 to 5 are the burning fire (they play in a loop,
one picture every 110 ms, CF_FRAME_MS in game.asm), picture 6 is the burnt-out fire. The fire stands on the bottom of the
picture, in the middle (the game puts the bottom of the picture on the floor of the campfire's cell).
This is only a stand-in: draw your own pictures in the same grid, save them as one PNG and convert it with
  python sheets_png_to_bmp.py campfire  your_fire.png
Needs: pip install pillow
"""
import math, struct, sys
from PIL import Image, ImageDraw

W = H = 64; N = 7
STONE = (112, 112, 122, 255); STONE_D = (62, 62, 72, 255); STONE_L = (160, 160, 170, 255)
LOG = (112, 70, 38, 255); LOG_D = (66, 40, 22, 255); LOG_L = (156, 108, 62, 255); LOG_END = (190, 140, 84, 255)
CHAR = (44, 36, 34, 255); CHAR_L = (74, 62, 58, 255); ASH = (100, 100, 108, 255); ASH_L = (138, 138, 146, 255)
RED = (205, 52, 22, 255); ORANGE = (244, 134, 32, 255); YELLOW = (255, 212, 72, 255); CORE = (255, 246, 196, 255)

def flame(d, f, cx, base, height, width, sway, phase, colour):
    t = 2 * math.pi * f / 6 + phase
    tip_x = cx + sway * math.sin(t); tip_y = base - height * (0.9 + 0.1 * math.sin(t * 2 + phase))
    pts = []
    for k in range(0, 9):                                   # left side up to the tip
        u = k / 8; x = cx - width * (1 - u) ** 0.8 + (tip_x - cx) * u ** 1.6 + 1.5 * math.sin(t + u * 3) * u
        pts.append((x, base - (base - tip_y) * u ** 0.85))
    for k in range(8, -1, -1):                              # and down the right side
        u = k / 8; x = cx + width * (1 - u) ** 0.8 + (tip_x - cx) * u ** 1.6 + 1.5 * math.sin(t + 2 + u * 3) * u
        pts.append((x, base - (base - tip_y) * u ** 0.85))
    d.polygon(pts, fill=colour)

def stones(d):
    for (x, y, w, h) in [(8, 50, 11, 7), (19, 54, 10, 6), (33, 54, 10, 6), (44, 50, 11, 7), (14, 46, 8, 6), (42, 46, 8, 6)]:
        d.ellipse([x, y, x + w, y + h], fill=STONE, outline=STONE_D); d.line([(x + 2, y + 1), (x + w - 3, y + 1)], fill=STONE_L)

def log(d, x0, y0, x1, y1, thick, colour=LOG):
    d.line([(x0, y0), (x1, y1)], fill=LOG_D, width=thick + 2); d.line([(x0, y0), (x1, y1)], fill=colour, width=thick)
    d.line([(x0, y0 - 1), (x1, y1 - 1)], fill=LOG_L, width=1)
    d.ellipse([x1 - thick // 2, y1 - thick // 2, x1 + thick // 2, y1 + thick // 2], fill=LOG_END, outline=LOG_D)

def burning(f):
    im = Image.new('RGBA', (W, H), (0, 0, 0, 0)); d = ImageDraw.Draw(im)
    d.ellipse([10, 52, 54, 62], fill=(0, 0, 0, 0))
    log(d, 14, 52, 46, 44, 5)                                # the back log
    flame(d, f, 32, 50, 38, 14, 4, 0.0, RED); flame(d, f, 32, 50, 30, 10, 4, 1.1, ORANGE)
    flame(d, f, 32, 50, 21, 6, 3, 2.3, YELLOW); flame(d, f, 32, 50, 12, 3, 2, 3.2, CORE)
    for k, ph in enumerate((0.0, 2.1, 4.2)):                  # sparks that drift up
        u = ((f + k * 2) % 6) / 6.0; x = 32 + 12 * math.sin(ph + u * 5) + (k - 1) * 6; y = 22 - 14 * u
        d.rectangle([x, y, x + 1, y + 1], fill=YELLOW if u < 0.6 else ORANGE)
    log(d, 50, 53, 18, 45, 5); log(d, 20, 57, 46, 56, 4)       # the front logs
    stones(d)
    return im

def burnt():
    im = Image.new('RGBA', (W, H), (0, 0, 0, 0)); d = ImageDraw.Draw(im)
    d.ellipse([14, 48, 50, 60], fill=ASH, outline=STONE_D); d.ellipse([20, 50, 44, 57], fill=ASH_L)
    log(d, 15, 53, 44, 49, 4, CHAR); log(d, 48, 54, 20, 50, 4, CHAR); d.line([(17, 51), (43, 47)], fill=CHAR_L)
    stones(d)
    for (x, y) in ((30, 44), (33, 40), (31, 35)):                 # a thin wisp of smoke
        d.rectangle([x, y, x + 1, y + 1], fill=(150, 150, 158, 200))
    return im

def main():
    out = sys.argv[1] if len(sys.argv) > 1 else "campfire.bmp"; prev = sys.argv[2] if len(sys.argv) > 2 else None
    sheet = Image.new('RGBA', (W * N, H), (0, 0, 0, 0))
    for f in range(6): sheet.paste(burning(f), (f * W, 0))
    sheet.paste(burnt(), (6 * W, 0))
    raw = sheet.tobytes("raw", "BGRA")
    with open(out, "wb") as fh:
        fh.write(b"BM" + struct.pack("<IHHI", 54 + len(raw), 0, 0, 54) + struct.pack("<IiiHHIIiiII", 40, W * N, -H, 1, 32, 0, len(raw), 2835, 2835, 0, 0) + raw)
    print(f"wrote {out}: {W * N} x {H}, {N} pictures of {W} x {H} (0-5 burning, 6 burnt out)")
    if prev:
        bg = Image.new('RGBA', sheet.size, (44, 60, 52, 255)); bg.alpha_composite(sheet); bg.resize((sheet.width * 3, sheet.height * 3), Image.NEAREST).save(prev)
main()
