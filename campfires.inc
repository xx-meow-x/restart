; campfires.inc - written by place_enemies.py, included by game.asm inside the entities table.
; one row per campfire: map, x, y, kind 6, then the same 16 numbers as an enemy (state 0 = burning, 1 = burnt out).
; the green box is 7 x 7 cells (FIRE_BOX in game.asm must match); no enemy stands within 10 cells of the middle
         dd 0,233,99,6, 0,0,0,0, 0,0,0,0, 233,99,0,0, 233,99,0,0   ; ctf1 campfire
         dd 1,193,129,6, 0,0,0,0, 0,0,0,0, 193,129,0,0, 193,129,0,0   ; ctf2 campfire
         dd 1,253,218,6, 0,0,0,0, 0,0,0,0, 253,218,0,0, 253,218,0,0   ; ctf2 campfire
         dd 2,55,178,6, 0,0,0,0, 0,0,0,0, 55,178,0,0, 55,178,0,0   ; ctf3 campfire
         dd 2,50,13,6, 0,0,0,0, 0,0,0,0, 50,13,0,0, 50,13,0,0   ; ctf3 campfire
         dd 3,170,32,6, 0,0,0,0, 0,0,0,0, 170,32,0,0, 170,32,0,0   ; ctf4 campfire
         dd 3,183,87,6, 0,0,0,0, 0,0,0,0, 183,87,0,0, 183,87,0,0   ; ctf4 campfire
         dd 4,95,286,6, 0,0,0,0, 0,0,0,0, 95,286,0,0, 95,286,0,0   ; ctb1 campfire
         dd 4,196,174,6, 0,0,0,0, 0,0,0,0, 196,174,0,0, 196,174,0,0   ; ctb1 campfire
         dd 5,55,113,6, 0,0,0,0, 0,0,0,0, 55,113,0,0, 55,113,0,0   ; ctb2 campfire
         dd 5,220,47,6, 0,0,0,0, 0,0,0,0, 220,47,0,0, 220,47,0,0   ; ctb2 campfire
         dd 6,118,142,6, 0,0,0,0, 0,0,0,0, 118,142,0,0, 118,142,0,0   ; ctb3 campfire
         dd 6,138,248,6, 0,0,0,0, 0,0,0,0, 138,248,0,0, 138,248,0,0   ; ctb3 campfire
         dd 7,164,42,6, 0,0,0,0, 0,0,0,0, 164,42,0,0, 164,42,0,0   ; ctb4 campfire
         dd 7,237,181,6, 0,0,0,0, 0,0,0,0, 237,181,0,0, 237,181,0,0   ; ctb4 campfire
