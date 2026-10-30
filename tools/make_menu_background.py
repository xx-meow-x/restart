#!/usr/bin/env python3
"""
make_menu_background.py - turn any picture into menu_bg.bmp, the picture behind the main menu.

  python make_menu_background.py  <your picture (png, jpg, ...)>  [menu_bg.bmp]  [--darken 30]

The picture is scaled to cover 1280 x 720 (the window) and the extra is cut off evenly at the sides or the top and bottom.
--darken N   makes it N percent darker (0 to 100, default 25) so the title and the buttons stay easy to read. 0 leaves it as it is.
Put menu_bg.bmp next to game.exe. Delete it to get the plain dark gradient back. (A picture of any other size is ignored by the game.)
The same script makes the picture of the ending: python make_menu_background.py your_picture.jpg ending.bmp --darken 0
(ending.bmp is shown when the final boss has been defeated; without it the menu picture, or a plain gradient, is used).
Needs: pip install pillow
"""
import struct, sys
from PIL import Image

W, H = 1280, 720

def main():
    args = sys.argv[1:]
    darken = 25
    if "--darken" in args:
        i = args.index("--darken"); darken = int(args[i + 1]); del args[i:i + 2]
    if not args:
        print(__doc__); sys.exit(1)
    src = args[0]; out = args[1] if len(args) > 1 else "menu_bg.bmp"
    im = Image.open(src).convert("RGBA")
    k = max(W / im.width, H / im.height)                        # scale so that it covers the window
    im = im.resize((max(W, round(im.width * k)), max(H, round(im.height * k))), Image.LANCZOS)
    x, y = (im.width - W) // 2, (im.height - H) // 2
    im = im.crop((x, y, x + W, y + H))
    if darken:
        black = Image.new("RGBA", (W, H), (0, 0, 0, 255))
        im = Image.blend(im, black, max(0, min(100, darken)) / 100.0)
    im.putalpha(255)
    raw = im.tobytes("raw", "BGRA")
    with open(out, "wb") as f:
        f.write(b"BM" + struct.pack("<IHHI", 54 + len(raw), 0, 0, 54) +
                struct.pack("<IiiHHIIiiII", 40, W, -H, 1, 32, 0, len(raw), 2835, 2835, 0, 0) + raw)
    print(f"wrote {out} ({W}x{H}, {darken}% darker). Put it next to game.exe.")
main()
