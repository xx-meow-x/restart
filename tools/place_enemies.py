#!/usr/bin/env python3
"""
place_enemies.py - decide where the enemies stand on every floor and where the campfire safe zones are.

  python place_enemies.py  <game.asm>  <maps folder>  <output folder>  [seed]

Enemy 1 is the weakest, enemy 4 the strongest (the stats live in game.asm: monHP, monAtk, ...).
  Lower floors (ctb1 to ctb4 and ctf1):  enemy 1 and enemy 2, spread all over the floor.
  Upper floors (ctf2 to ctf4):           enemy 3 and enemy 4, spread all over the floor.
Enemies keep away from where you arrive (the floor's start and every warp), stand only on floor you can reach from the
start, and keep a minimum distance from each other so they are really spread out.

Campfire safe zones: one on the starting floor (ctf1) and two on every other floor. Each is a small open square of floor
(the green box on enemy_map.png) with a wider ring around it where no enemy ever stands. They are written to campfires.inc
as characters of kind 6 (the middle of each green box): game.asm includes them, draws the fire sprite there and lets the
hero rest at it once.

The bosses (BOSSES below) each stand on one floor: the mini boss (the Tower Keeper, monster type 4) on ctf2 and the final boss
(the Obsidian Knight, monster type 5) on ctf4, as far from the start as the floor allows, in open ground, away from warps, campfire
zones and other enemies. They are added after all the other enemies, so changing a boss never moves them.

Writes <output folder>/enemies.inc, campfires.inc and enemy_map.png (an overview of where everything stands).
Needs: pip install numpy pillow
"""
import re, sys, os, math, random
import numpy as np
from PIL import Image, ImageDraw

# ---------------------------------------------------------------------------------------------- settings you may edit
MAPS = ['ctf1', 'ctf2', 'ctf3', 'ctf4', 'ctb1', 'ctb2', 'ctb3', 'ctb4']        # map numbers 0 to 7, as in game.asm
COUNT = {'ctf1': 40, 'ctf2': 30, 'ctf3': 28, 'ctf4': 24, 'ctb1': 30, 'ctb2': 30, 'ctb3': 30, 'ctb4': 30}   # enemies per floor
MIX = {'ctf1': (50, 50, 0, 0), 'ctb1': (50, 50, 0, 0), 'ctb2': (50, 50, 0, 0), 'ctb3': (50, 50, 0, 0), 'ctb4': (50, 50, 0, 0),
       'ctf2': (0, 0, 50, 50), 'ctf3': (0, 0, 50, 50), 'ctf4': (0, 0, 50, 50)}   # percent chance of enemy 1, 2, 3, 4 on each floor
TIER_TYPE = (0, 1, 2, 3)          # enemy N uses monster type TIER_TYPE[N-1]: an index into the stat tables in game.asm (0 to 15)
SAFE_SPAWN = 16                   # cells around the floor's start with no enemies
SAFE_WARP = 8                     # cells around every warp with no enemies
FIRES = {'ctf1': 1, 'ctf2': 2, 'ctf3': 2, 'ctf4': 2, 'ctb1': 2, 'ctb2': 2, 'ctb3': 2, 'ctb4': 2}   # campfire safe zones per floor
FIRE_BOX = 3                      # the green box is (2 x this + 1) cells wide: 3 gives 7 x 7. It is all open floor.
SAFE_FIRE = 10                    # no enemy within this many cells of the middle of a campfire (the ring around the box)
FIRE_FROM_START = 25              # a campfire is at least this far from the floor's start,
FIRE_FROM_WARP = 12               # from every warp,
FIRE_APART = 45                   # and (aimed for) from the other campfire of the same floor
BOSSES = [{'floor': 'ctf2', 'type': 4, 'label': 'MINI BOSS'},         # the Tower Keeper
          {'floor': 'ctf4', 'type': 5, 'label': 'FINAL BOSS'}]        # the Obsidian Knight. One boss per floor; the floor name is one of MAPS; [] = no bosses
BOSS_FROM_WARP = 15               # a boss keeps at least this many cells from every warp,
BOSS_FROM_FIRE = SAFE_FIRE + 6    # from the middle of every campfire zone,
BOSS_FROM_ENEMY = 12              # and from every other enemy
# ---------------------------------------------------------------------------------------------------------------------
KIND_ENEMY = 4
KIND_FIRE = 6
COL = {1: (90, 200, 90), 2: (230, 220, 60), 3: (240, 140, 40), 4: (230, 50, 50)}

def table(src, name):
    """the numbers of a 'name dd 1,2,3' table that may continue on the following lines"""
    m = re.search(rf'^{name}\s+dd\s+(.*?)(?=^\S|\Z)', src, re.M | re.S)
    nums = []
    for ln in m.group(0).split('\n'):
        ln = ln.split(';')[0]
        ln = re.sub(rf'^{name}\s+dd', '', ln).replace('dd', '')
        nums += [int(x) for x in re.findall(r'-?\d+', ln)]
    return nums

def main():
    asm, mapdir, out = sys.argv[1:4]; seed = int(sys.argv[4]) if len(sys.argv) > 4 else 7
    src = open(asm, encoding='utf-8', errors='replace').read()
    Ws, Hs, SX, SY = (table(src, n) for n in ('mapWs', 'mapHs', 'mapSpawnX', 'mapSpawnY'))
    wl = table(src, 'warps'); warps = [wl[i:i + 6] for i in range(0, len(wl) - 5, 6)]
    os.makedirs(out, exist_ok=True)
    rows = []; fire_rows = []; boss_rows = []
    sheet = Image.new('RGB', (4 * 330, 2 * 350), (20, 20, 24)); dr = ImageDraw.Draw(sheet)
    for mi, name in enumerate(MAPS):
        W, H = Ws[mi], Hs[mi]
        raw = open(os.path.join(mapdir, name + '.map'), 'rb').read().replace(b'\n', b'').replace(b'\r', b'')
        walk = (np.frombuffer(raw[:W * H], np.uint8).reshape(H, W) == ord('.'))
        # floor you can walk to from the start (8 directions)
        seen = np.zeros_like(walk); st = [(SY[mi], SX[mi])]
        if not walk[st[0]]:                                        # the start is not floor: take the nearest floor cell
            ys, xs = np.nonzero(walk); k = np.argmin((ys - SY[mi]) ** 2 + (xs - SX[mi]) ** 2); st = [(ys[k], xs[k])]
        seen[st[0]] = True
        while st:
            y, x = st.pop()
            for dy in (-1, 0, 1):
                for dx in (-1, 0, 1):
                    ny, nx = y + dy, x + dx
                    if 0 <= ny < H and 0 <= nx < W and walk[ny, nx] and not seen[ny, nx]: seen[ny, nx] = True; st.append((ny, nx))
        yy, xx = np.mgrid[0:H, 0:W]
        rng = random.Random(seed * 100 + mi)
        # ---- campfire safe zones: open squares of reachable floor, away from the start, the warps and each other ----
        fb = FIRE_BOX; reach = walk & seen; openbox = np.ones((H, W), bool)
        for dy in range(-fb, fb + 1):
            for dx in range(-fb, fb + 1):
                sh = np.zeros((H, W), bool)
                sh[max(0, -dy):min(H, H - dy), max(0, -dx):min(W, W - dx)] = reach[max(0, dy):min(H, H + dy), max(0, dx):min(W, W + dx)]
                openbox &= sh
        fok = openbox & (np.maximum(abs(yy - SY[mi]), abs(xx - SX[mi])) > FIRE_FROM_START)
        for w in warps:
            if w[0] == mi: fok &= (np.maximum(abs(yy - w[2]), abs(xx - w[1])) > FIRE_FROM_WARP)
        fcand = np.argwhere(fok); gap = FIRE_APART; fires = []
        while gap >= 8 and len(fires) < FIRES[name]:
            fires = []
            for k in rng.sample(range(len(fcand)), min(len(fcand), 5000)):
                y, x = fcand[k]
                if all(max(abs(y - cy), abs(x - cx)) >= gap for cy, cx in fires): fires.append((int(y), int(x)))
                if len(fires) == FIRES[name]: break
            if len(fires) < FIRES[name]: gap -= 4
        for (fy, fx) in fires: fire_rows.append((mi, name, fx, fy))
        # ---- enemies ----
        ok = seen.copy()
        pad = np.pad(walk, 1).astype(int); nb = sum(pad[1 + dy:1 + dy + H, 1 + dx:1 + dx + W] for dy in (-1, 0, 1) for dx in (-1, 0, 1)) - 1
        ok &= nb >= 6                                              # plenty of floor around (not stuck in a corner)
        ok &= (np.maximum(abs(yy - SY[mi]), abs(xx - SX[mi])) > SAFE_SPAWN)
        for w in warps:
            if w[0] == mi: ok &= (np.maximum(abs(yy - w[2]), abs(xx - w[1])) > SAFE_WARP)
        for (fy, fx) in fires: ok &= (np.maximum(abs(yy - fy), abs(xx - fx)) > SAFE_FIRE)
        cand = np.argwhere(ok); n = COUNT[name]
        spacing = max(6, int(math.sqrt(len(cand) / max(n, 1)) * 0.8)); chosen = []
        while spacing >= 3 and len(chosen) < n:
            chosen = []
            for k in rng.sample(range(len(cand)), min(len(cand), 20000)):
                y, x = cand[k]
                if all(max(abs(y - cy), abs(x - cx)) >= spacing for cy, cx in chosen): chosen.append((y, x))
                if len(chosen) == n: break
            if len(chosen) < n: spacing -= 1
        mix = MIX[name]; tot = sum(mix); counts = [0, 0, 0, 0]
        img = Image.fromarray(np.where(walk, 90, 20).astype(np.uint8)).convert('RGB'); d2 = ImageDraw.Draw(img)
        for (fy, fx) in fires:
            d2.rectangle([fx - SAFE_FIRE, fy - SAFE_FIRE, fx + SAFE_FIRE, fy + SAFE_FIRE], outline=(40, 110, 40))      # the enemy-free ring
        for (y, x) in chosen:
            r = rng.random() * tot; t = 0
            while t < 3 and r >= mix[t]: r -= mix[t]; t += 1
            counts[t] += 1; rows.append((mi, name, int(x), int(y), t + 1, TIER_TYPE[t]))
            d2.ellipse([x - 3, y - 3, x + 3, y + 3], fill=COL[t + 1])
        for B in [b for b in BOSSES if b['floor'] == name]:                  # a boss: open ground, as far from the start as possible
            okb = seen & (nb >= 8)
            for w in warps:
                if w[0] == mi: okb &= (np.maximum(abs(yy - w[2]), abs(xx - w[1])) > BOSS_FROM_WARP)
            for (fy, fx) in fires: okb &= (np.maximum(abs(yy - fy), abs(xx - fx)) > BOSS_FROM_FIRE)
            for (ey, ex) in chosen: okb &= (np.maximum(abs(yy - ey), abs(xx - ex)) > BOSS_FROM_ENEMY)
            bc = np.argwhere(okb)
            if len(bc):
                far = np.maximum(abs(bc[:, 0] - SY[mi]), abs(bc[:, 1] - SX[mi])); top = bc[np.argsort(-far)[:30]]
                by, bx = top[rng.randrange(len(top))]; boss_rows.append((mi, name, int(bx), int(by), B['type'], B['label']))
                d2.ellipse([bx - 7, by - 7, bx + 7, by + 7], fill=(255, 60, 255), outline=(255, 255, 255))
                print(f"{name}: {B['label']} (type {B['type']}) at ({bx}, {by}), {int(max(abs(bx - SX[mi]), abs(by - SY[mi])))} cells from the start")
            else: print(f"{name}: no room found for the {B['label']}")
        d2.rectangle([SX[mi] - 2, SY[mi] - 2, SX[mi] + 2, SY[mi] + 2], outline=(80, 160, 255))
        for w in warps:
            if w[0] == mi: d2.rectangle([w[1] - 3, w[2] - 3, w[1] + 3, w[2] + 3], outline=(255, 140, 0))
        for (fy, fx) in fires: d2.rectangle([fx - fb, fy - fb, fx + fb, fy + fb], outline=(60, 255, 60), width=2)       # the green box
        img = img.resize((320, int(320 * H / W)), Image.NEAREST)
        sheet.paste(img, ((mi % 4) * 330, (mi // 4) * 350 + 20))
        dr.text(((mi % 4) * 330 + 4, (mi // 4) * 350 + 4), f"{name}: {len(fires)} fire(s), {len(chosen)} enemies  1:{counts[0]} 2:{counts[1]} 3:{counts[2]} 4:{counts[3]}", fill=(255, 255, 255))
        print(f"{name}: {len(fires)}/{FIRES[name]} campfires {fires}; {len(chosen)}/{n} enemies (1:{counts[0]} 2:{counts[1]} 3:{counts[2]} 4:{counts[3]}), min distance {spacing}")
    sheet.save(os.path.join(out, 'enemy_map.png'))
    with open(os.path.join(out, 'enemies.inc'), 'w') as f:
        f.write("; enemies.inc - written by place_enemies.py, included by game.asm inside the entities table.\n")
        f.write("; one row per enemy: map, x, y, kind 4, hp, maxhp (filled in from monHP at start), state, stateStart, facing, type,\n")
        f.write(";   nextMove, lastAct, fromX, fromY, 0, 0, homeX, homeY, frozenUntil, spare\n")
        for (mi, name, x, y, tier, ty) in rows:
            f.write(f"         dd {mi},{x},{y},{KIND_ENEMY}, 0,0,0,0, 0,{ty},0,0, {x},{y},0,0, {x},{y},0,0   ; {name} enemy {tier}\n")
    with open(os.path.join(out, 'enemies.inc'), 'a') as f:
        for (mi, name, x, y, ty, label) in boss_rows:
            f.write(f"         dd {mi},{x},{y},{KIND_ENEMY}, 0,0,0,0, 0,{ty},0,0, {x},{y},0,0, {x},{y},0,0   ; {name} {label} (monster type {ty}: it does not respawn)\n")
    with open(os.path.join(out, 'campfires.inc'), 'w') as f:
        f.write("; campfires.inc - written by place_enemies.py, included by game.asm inside the entities table.\n")
        f.write(f"; one row per campfire: map, x, y, kind 6, then the same 16 numbers as an enemy (state 0 = burning, 1 = burnt out).\n")
        f.write(f"; the green box is {2 * FIRE_BOX + 1} x {2 * FIRE_BOX + 1} cells (FIRE_BOX in game.asm must match); no enemy stands within {SAFE_FIRE} cells of the middle\n")
        for (mi, name, x, y) in fire_rows: f.write(f"         dd {mi},{x},{y},{KIND_FIRE}, 0,0,0,0, 0,0,0,0, {x},{y},0,0, {x},{y},0,0   ; {name} campfire\n")
    print("wrote", len(rows), "enemies and", len(fire_rows), "campfires")
main()
