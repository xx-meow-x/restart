#!/usr/bin/env python3
"""
make_icon_sheet.py - pack your item icons into icons.bmp for game.exe.

  python make_icon_sheet.py  <folder with your icons>  [icons.bmp]

Put one PNG per item in the folder, named:
    greenwarish  spike  spike_plus1  longsword  longsword_plus1
    chainmail  heavy_armor  scroll_sharpness  scroll_binding        (.png)
Any size or shape: each is scaled to fit 64 x 64 (keeping its proportions) and centred.
An icon that is missing gets the same coloured placeholder square the game uses.
Put the resulting icons.bmp next to game.exe.  Without it the game draws placeholders.

Sheet layout (what the game reads): 10 icons of 64 x 64 in one row = 640 x 64 (one more per item you add to NAMES), 32-bit with
alpha, top-down. Icon number = the item id (0 is unused): 1 Greenwarish, 2 Spike, 3 Spike +1,
4 Longsword, 5 Longsword +1, 6 Chainmail, 7 Heavy Armor, 8 Scroll of Sharpness, 9 Scroll of Binding.
Needs: pip install pillow
"""
import os, struct, sys
from PIL import Image, ImageDraw

NAMES = [None, "greenwarish", "spike", "spike_plus1", "longsword", "longsword_plus1",
         "chainmail", "heavy_armor", "scroll_sharpness", "scroll_binding"]
COLORS = [None, 0x3CC060, 0xB4BCCC, 0x6CD8FF, 0x8C94A4, 0xFFD060, 0x6E7888, 0x4C4660, 0xE8D8A0, 0xA070E0]
LABELS = [None, "Gw", "Sp", "S+", "Ls", "L+", "Ch", "Ha", "Sh", "Bi"]
SZ = 64

def main():
    folder = sys.argv[1]; out = sys.argv[2] if len(sys.argv) > 2 else "icons.bmp"
    files = {f.lower(): f for f in os.listdir(folder)}
    N = len(NAMES)                                           # icons in the sheet (item 0 is unused)
    sheet = Image.new("RGBA", (SZ * N, SZ), (0, 0, 0, 0))
    for i in range(1, N):
        key = NAMES[i] + ".png"
        if key in files:
            im = Image.open(os.path.join(folder, files[key])).convert("RGBA")
            im.thumbnail((SZ, SZ), Image.LANCZOS)
            sheet.alpha_composite(im, (i * SZ + (SZ - im.width) // 2, (SZ - im.height) // 2))
            print(f"  {i}: {files[key]}")
        else:
            c = COLORS[i]; d = ImageDraw.Draw(sheet)
            d.rectangle([i * SZ, 0, i * SZ + SZ - 1, SZ - 1], fill=(16, 16, 16, 255))
            d.rectangle([i * SZ + 2, 2, i * SZ + SZ - 3, SZ - 3], fill=((c >> 16) & 255, (c >> 8) & 255, c & 255, 255))
            d.text((i * SZ + 24, 26), LABELS[i], fill=(255, 255, 255, 255))
            print(f"  {i}: {NAMES[i]}.png not found - placeholder")
    raw = sheet.tobytes("raw", "BGRA")
    with open(out, "wb") as f:
        f.write(b"BM" + struct.pack("<IHHI", 54 + len(raw), 0, 0, 54) +
                struct.pack("<IiiHHIIiiII", 40, SZ * N, -SZ, 1, 32, 0, len(raw), 2835, 2835, 0, 0) + raw)
    print("wrote", out, f"({SZ*N}x{SZ})")
main()
