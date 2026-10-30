option casemap:none

extrn GetModuleHandleA:PROC
extrn LoadCursorA:PROC
extrn RegisterClassExA:PROC
extrn CreateWindowExA:PROC
extrn PeekMessageA:PROC
extrn TranslateMessage:PROC
extrn DispatchMessageA:PROC
extrn DefWindowProcA:PROC
extrn PostQuitMessage:PROC
extrn GetTickCount64:PROC
extrn GetAsyncKeyState:PROC
extrn GetForegroundWindow:PROC
extrn GetDC:PROC
extrn ReleaseDC:PROC
extrn StretchDIBits:PROC
extrn SetBkMode:PROC
extrn CreateFontA:PROC
extrn GetTextExtentPoint32A:PROC
extrn SelectObject:PROC
extrn SetTextColor:PROC
extrn TextOutA:PROC
extrn Sleep:PROC
extrn ExitProcess:PROC
extrn CreateFileA:PROC
extrn LoadCursorFromFileA:PROC
extrn TrackMouseEvent:PROC
extrn GetCursorPos:PROC
extrn ScreenToClient:PROC
extrn SetCursor:PROC
extrn ReadFile:PROC
extrn CloseHandle:PROC

SCRW     equ 1280
SCRH     equ 720
MAPW     equ 20
MAPH     equ 12
MAPSIZE  equ 240
TW       equ 40
TH       equ 26
OFFY     equ 40
STEP_MS  equ 150
STEP_DIAG equ 210
WALK_FRAME_MS equ 50
CELLW    equ 115
CELLH    equ 121
CELLOX   equ 57
CELLOY   equ 94
WCELLW   equ 147
WCELLH   equ 92
WCELLOX  equ 73
WCELLOY  equ 83
WSHEETW  equ 1323
PSHEETW  equ 1035
ORIGLIFT equ 9
BAGN     equ 8
BAG_X    equ 300
BAG_Y    equ 90
BAG_W    equ 680
BAG_H    equ 420
SLOT_PX  equ 76
SLOT_GAP equ 16
SLOT_ROWGAP equ 36
GRID_X   equ BAG_X+28
GRID_Y   equ BAG_Y+56
ICON_SZ  equ 64
QB_X     equ 880
QB_Y     equ 676
QB_SZ    equ 36
QB_STEP  equ 44
STX      equ BAG_X+424
STV      equ BAG_X+524
SKILL_MS equ 900
CAST_MS  equ 800
HURT_MS  equ 300
DEAD_MS  equ 1800
READY_MS equ 5000
READY_FRAME_MS equ 100
ASPD     equ 600
WARPN    equ 21
WARP_R   equ 1
MAXHP    equ 300
CURCELL  equ 32
CUR_FRAME_MS equ 110
TILEBYTES equ 17679744
ATLASBYTES equ 7077888
MENU_BTN_W equ 360
MENU_BTN_H equ 56
MENU_BTN_X equ (SCRW-MENU_BTN_W)/2
MENU_BTN_Y equ 340
MENU_BTN_STEP equ 76
MENU_BACK_Y equ 610
MENU_FADE_MS equ 1100
ML_X      equ 120
ML_Y      equ 430
ML_STEP   equ 46
ML_H      equ 40
ML_W      equ 512
ML_TEXT_X equ ML_X+34
C_MLBAR   equ 2F7FEFh
C_MLLINE_L equ 707070h
C_MLLINE_D equ 9AA0C0h
MENU_PIC_LIGHT equ 1
ML_DESC_X equ 128
ML_DESC_Y equ 652
ML_DESC_W equ 1024
ML_DESC_H equ 30
C_MLDESC  equ 3860B8h
FLY_ID   equ 10
BOSS_SWORD equ 11
BOSS_AXE   equ 12
FLY_CHANCE equ 4
CF_W      equ 64
CF_H      equ 64
CF_BURNT  equ 6
CF_FRAME_MS equ 110
FIRE_BOX  equ 3
REST_MS   equ 3000
C_FIREBOX equ 40E060h
C_FIREOUT equ 2A7A3Ch
BS_W      equ 96
BS_H      equ 104
BS_BASE   equ 100
BS_FRAME_MS equ 170
BS_STEPS  equ 8
C_MMBOSS  equ 0F0C040h
C_MMBOSSBDR equ 604818h
END_FADE_MS equ 1600
END_MS1   equ 75
END_MS2   equ 55
END_MS3   equ 110
END_IMG_MS equ 3200
MENU_ICON_ITEM equ 2
MI_SZ     equ 64
FIRE_FADE_MS equ 1500
DEATH_FADE_DELAY equ 300
DEATH_FADE_MS equ 1700
DEATH_ALPHA equ 150
DEATH_TINT equ 200608h
DEATH_TEXT_AT equ 900
DEATH_INPUT_MS equ 2200
PROP_BYTES equ 31000000
PROP_MAGIC equ 31505250h
WALL_EXTRA equ 7
ENTSZ    equ 80
MCELLW   equ 128
MCELLH   equ 104
MON_SHEETS equ 6
MON_SHEET_BYTES equ 3300000
BOSS_TYPE equ 4
FINAL_BOSS_TYPE equ 5
ST_IDLE  equ 0
ST_CHASE equ 1
ST_ATTACK equ 2
ST_HURT  equ 3
ST_DYING equ 4
ST_DEAD  equ 5
RESPAWN_MS equ 15000
LEASH_EXTRA equ 6
MON_WALK_MS equ 90
MON_STAND_MS equ 150
PLAYER_HP equ 100
ATK_ANIM_MS equ 500
PICK_MS  equ 600
IDLE_FRAME_MS equ 150
DROP_POP_MS equ 500
DROP_ARC4 equ 144
C_MMDROP equ 40E0E0h
C_MMFIRE equ 40E060h
C_MMFIREOUT equ 2A7A3Ch
NMAPS    equ 8
MAPTOTAL equ 736656
MAXCELLS equ 160000
DLG_RANGE equ 6
DEV_KEYS equ 0
VIEWH    equ 616
MM_X     equ 1070
MM_Y     equ 458
MM_W     equ 200
MM_H     equ 190
C_MMBDR  equ 8C8C8Ch
C_MMBG   equ 101018h
C_MMWALK equ 0D8D8C8h
C_MMWALL equ 2A2A32h
C_MMEXIT equ 0E0A040h
C_MMNPC  equ 0F0D040h
C_MMENEMY equ 0D94141h
C_MMPLAYER equ 1040FFh
C_MMVIEW equ 1FA0A0h
FONT_H   equ 0
FONT_WEIGHT equ 400
DEBUG_MOUSE equ 0

C_BG     equ 1E1C19h
C_LINE   equ 8C8C8Ch
C_FLOOR  equ 0DCDCDCh
C_WALL   equ 404040h
C_EXIT   equ 0E0A040h
C_SHADOW equ 6E6E6Eh
C_BODY   equ 2B7BD1h
C_HEAD   equ 0D6453Ah
C_SMITH  equ 0B5651Dh
C_SAGE   equ 7A4FB5h
C_SKIN   equ 0E8C9A8h
C_WOOD   equ 8A5A2Bh
C_STRAW  equ 0C9A24Ah
C_HPBG   equ 202020h
C_HPFG   equ 0D94141h

.data
className   db "AsmRpgWnd",0
windowTitle db "RE:START",0
fontName    db "Consolas",0
hFont       dq 0
sheetName   db "player_body.bmp",0
curSheetName db "cursors.bmp",0
curNormalName db "cursor.cur",0
curHoverName  db "cursor_hover.cur",0

curMap      dd 0
curBase     dq 0
curW        dd 20
curH        dd 12
camX        dd 0
camY        dd 0
pFeetX      dd 0
pFeetY      dd 0
pMoving     dd 0
clipT       dd 0
clipB       dd SCRH
curColors   dq 0
playerX     dd 9
playerY     dd 5
weapon      dd 0
giveCount   dd 0
dummyHP     dd MAXHP
rng         dd 12345
nextSlot    dd 0
stepStart   dq 0
animBase    dq 0
sheetPixels dq 0
stepDur     dd STEP_MS
stepFromX   dd 9
stepFromY   dd 5
facing      dd 0
sheetW      dd 0
pathLen     dd 0
pathPos     dd 0
pendingEnt  dq 0
pathTarget  dq 0
curPixels   dq 0
hoverEnt    dq 0
curSheetW   dd 0
mouseIn     dd 0
tme         db 24 dup(0)
clickPending dd 0
prevLB      dd 0
mousePt     dd 0,0
hArrow      dq 0
hHand       dq 0
curCursor   dq 0
bytesRead   dd 0
lastAct     dq 0
nowTick     dq 0
hInst       dq 0
hWnd        dq 0
hDC         dq 0
playerHP    dd PLAYER_HP
pAct        dd 0
pActStart   dd 0
pAtkKind    dd 0
lootCount   dd 0
headPixels  dq 0
headW       dd 0
gHDx        dd 0
gHDy        dd 0
gHSx        dd 0
gHSy        dd 0
gHMir       dd 0
gSavePix    dq 0
weapPixels  dq 0
weapW       dd 0
pReadyUntil dq 0
gPAct       dd 0
gPView      dd 0
gPFrame     dd 0
sprCW       dd CELLW
sprCH       dd CELLH
bag         dd 8 dup(0)
bagQty      dd 8 dup(0)
eqWpn       dd -1
eqArm       dd -1
heldSlot    dd -1
dragPress   dd 0
bagOpen     dd 0
fkPrev      dd 0
releasePending dd 0
armorId     dd 0
curDef      dd 0
curCd       dd ASPD
atkMul      dd 100
sharpPct    dd 0
bindOn      dd 0
iconPixels  dq 0
iconW       dd 0
gSaveW      dd 0
monPixels   dq 0
monW        dd MCELLW*6
monSheetPix dq 6 dup(0)
curMonPix   dq 0
dlgPtr      dq 0
dlgEnt      dq 0
fkHeld      dd 0
msgPtr      dq OFFSET msgWelcome

mapWs     dd 400,300,260,216,320,300,300,300
mapHs     dd 400,300,260,216,320,300,300,300
mapSpawnX dd 200,161,144,101,160,150,150,147
mapSpawnY dd 200,150,130,107,160,141,150,162
mapBases  dq OFFSET mapData, OFFSET mapData+160000, OFFSET mapData+250000, OFFSET mapData+317600
          dq OFFSET mapData+364256, OFFSET mapData+466656, OFFSET mapData+556656, OFFSET mapData+646656
colBases  dq OFFSET colData, OFFSET colData+160000*4, OFFSET colData+250000*4, OFFSET colData+317600*4
          dq OFFSET colData+364256*4, OFFSET colData+466656*4, OFFSET colData+556656*4, OFFSET colData+646656*4
mapLoaded dd 8 dup(0)
colLoaded dd 8 dup(0)
mapFiles  dq OFFSET mf0, OFFSET mf1, OFFSET mf2, OFFSET mf3, OFFSET mf4, OFFSET mf5, OFFSET mf6, OFFSET mf7
colFiles  dq OFFSET cf0, OFFSET cf1, OFFSET cf2, OFFSET cf3, OFFSET cf4, OFFSET cf5, OFFSET cf6, OFFSET cf7
mf0 db "maps\ctf1.map",0
mf1 db "maps\ctf2.map",0
mf2 db "maps\ctf3.map",0
mf3 db "maps\ctf4.map",0
mf4 db "maps\ctb1.map",0
mf5 db "maps\ctb2.map",0
mf6 db "maps\ctb3.map",0
mf7 db "maps\ctb4.map",0
cf0 db "maps\ctf1.col",0
cf1 db "maps\ctf2.col",0
cf2 db "maps\ctf3.col",0
cf3 db "maps\ctf4.col",0
cf4 db "maps\ctb1.col",0
cf5 db "maps\ctb2.col",0
cf6 db "maps\ctb3.col",0
cf7 db "maps\ctb4.col",0

warps dd 0,123,377,4,297,294
      dd 0,235,173,1,268,273
      dd 1,24,275,6,277,121
      dd 1,273,273,0,235,176
      dd 1,142,16,2,65,112
      dd 2,7,220,4,171,161
      dd 2,42,218,5,127,130
      dd 2,212,100,6,276,246
      dd 2,146,251,0,235,176
      dd 2,60,112,1,148,16
      dd 4,292,13,5,43,275
      dd 4,302,294,0,125,377
      dd 4,167,161,1,148,16
      dd 5,43,279,4,292,19
      dd 5,279,49,6,18,32
      dd 5,122,130,2,47,218
      dd 5,187,65,2,65,112
      dd 6,12,32,5,273,49
      dd 6,276,251,0,235,176
      dd 6,277,116,1,27,272
      dd 6,191,268,2,217,100

tileBases dq OFFSET tileData, OFFSET tileData+3840000, OFFSET tileData+6000000, OFFSET tileData+7622400
          dq OFFSET tileData+8742144, OFFSET tileData+11199744, OFFSET tileData+13359744, OFFSET tileData+15519744
tileLoaded dd 8 dup(0)
atlasLoaded dd 0
curTiles  dq 0
grdFiles  dq OFFSET gf0, OFFSET gf1, OFFSET gf2, OFFSET gf3, OFFSET gf4, OFFSET gf5, OFFSET gf6, OFFSET gf7
gf0 db "maps\ctf1.grd",0
gf1 db "maps\ctf2.grd",0
gf2 db "maps\ctf3.grd",0
gf3 db "maps\ctf4.grd",0
gf4 db "maps\ctb1.grd",0
gf5 db "maps\ctb2.grd",0
gf6 db "maps\ctb3.grd",0
gf7 db "maps\ctb4.grd",0
atlasName db "maps\ground.tex",0
lmxTab db 0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1
    db 2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3
    db 4,4,4,4,4,4,4,4,4,4,5,5,5,5,5,5,5,5,5,5
    db 6,6,6,6,6,6,6,6,6,6,7,7,7,7,7,7,7,7,7,7
lmyTab db 0,0,0,0,0,0,0,1,1,1,1,1,1,2,2,2,2,2,2,2
    db 3,3,3,3,3,3,4,4,4,4,4,4,4,5,5,5,5,5,5,6
    db 6,6,6,6,6,6,7,7,7,7,7,7
gC0 dd 0
gC1 dd 0
gR0 dd 0
gR1 dd 0
gRow dd 0
gCol dd 0
gSX dd 0
gSY dd 0
gPX0 dd 0
gPX1 dd 0
gPY0 dd 0
gPY1 dd 0
gPY dd 0
gOX dd 0
gOY dd 0
dimShift dd 0

hgtBases  dq OFFSET hgtData, OFFSET hgtData+160000, OFFSET hgtData+250000, OFFSET hgtData+317600
          dq OFFSET hgtData+364256, OFFSET hgtData+466656, OFFSET hgtData+556656, OFFSET hgtData+646656
hgtLoaded dd 8 dup(0)
wtxBases  dq OFFSET wtxData, OFFSET wtxData+160000, OFFSET wtxData+250000, OFFSET wtxData+317600
          dq OFFSET wtxData+364256, OFFSET wtxData+466656, OFFSET wtxData+556656, OFFSET wtxData+646656
wtxLoaded dd 8 dup(0)
wuvBases  dq OFFSET wuvData, OFFSET wuvData+2560000, OFFSET wuvData+4000000, OFFSET wuvData+5081600
          dq OFFSET wuvData+5828096, OFFSET wuvData+7466496, OFFSET wuvData+8906496, OFFSET wuvData+10346496
wuvLoaded dd 8 dup(0)
wuvFiles  dq OFFSET uu0, OFFSET uu1, OFFSET uu2, OFFSET uu3, OFFSET uu4, OFFSET uu5, OFFSET uu6, OFFSET uu7
uu0 db "maps\\ctf1.wuv",0
uu1 db "maps\\ctf2.wuv",0
uu2 db "maps\\ctf3.wuv",0
uu3 db "maps\\ctf4.wuv",0
uu4 db "maps\\ctb1.wuv",0
uu5 db "maps\\ctb2.wuv",0
uu6 db "maps\\ctb3.wuv",0
uu7 db "maps\\ctb4.wuv",0
curWuv    dq 0
wtxFiles  dq OFFSET ww0, OFFSET ww1, OFFSET ww2, OFFSET ww3, OFFSET ww4, OFFSET ww5, OFFSET ww6, OFFSET ww7
ww0 db "maps\ctf1.wtx",0
ww1 db "maps\ctf2.wtx",0
ww2 db "maps\ctf3.wtx",0
ww3 db "maps\ctf4.wtx",0
ww4 db "maps\ctb1.wtx",0
ww5 db "maps\ctb2.wtx",0
ww6 db "maps\ctb3.wtx",0
ww7 db "maps\ctb4.wtx",0
curWtx    dq 0
curHgt    dq 0
curWallTex dd 0
wallTexTab dd 6,6,18,13,2,2,2,25
hgtFiles  dq OFFSET hh0, OFFSET hh1, OFFSET hh2, OFFSET hh3, OFFSET hh4, OFFSET hh5, OFFSET hh6, OFFSET hh7
prpFiles dq OFFSET pp0, OFFSET pp1, OFFSET pp2, OFFSET pp3, OFFSET pp4, OFFSET pp5, OFFSET pp6, OFFSET pp7
pp0 db "maps\ctf1.prp",0
pp1 db "maps\ctf2.prp",0
pp2 db "maps\ctf3.prp",0
pp3 db "maps\ctf4.prp",0
pp4 db "maps\ctb1.prp",0
pp5 db "maps\ctb2.prp",0
pp6 db "maps\ctb3.prp",0
pp7 db "maps\ctb4.prp",0
hh0 db "maps\ctf1.hgt",0
hh1 db "maps\ctf2.hgt",0
hh2 db "maps\ctf3.hgt",0
hh3 db "maps\ctf4.hgt",0
hh4 db "maps\ctb1.hgt",0
hh5 db "maps\ctb2.hgt",0
hh6 db "maps\ctb3.hgt",0
hh7 db "maps\ctb4.hgt",0
ghostMode dd 0
gPrX dd 0
gPrY dd 0
gPrSX0 dd 0
gPrEX dd 0
gPrEY dd 0
curProp dq 0
propTab dq 0
propRows dq 0
propList dq 0
propPix dq 0
curNFloor dd 0
curRowExtra dd WALL_EXTRA
curRowBehind dd 0
gameState dd 0
menuSel dd 0
menuPage dd 0
menuQuit dd 0
menuTick dq 0
hFontTitle dq 0
hFontMenu dq 0
hFontSmall dq 0
hFontD1 dq 0
hFontD2 dq 0
hFontD3 dq 0
menuBgPixels dq 0
pauseSel dd 0
pauseReq dd 0
lastReal dq 0
pauseTotal dq 0
bsPixels dq 0
bsName db "blacksmith.bmp",0
bsSeq db 0,1,2,2,3,4,4,0
endAt dq 0
endStart dq 0
endImgPixels dq 0
endingName db "ending.bmp",0
menuIcoPixels dq 0
menuIcoName db "menu_icon.bmp",0
cfPixels dq 0
cfName db "campfire.bmp",0
restOn dd 0
restStart dq 0
restHP0 dd 0
restLastHP dd 0
restX dd 0
restY dd 0
restEnt dq 0
menuWords dq OFFSET strBegin, OFFSET strControls, OFFSET strQuit
menuDescs dq OFFSET strMenuDesc0, OFFSET strMenuDesc1, OFFSET strMenuDesc2
pauseWords dq OFFSET strResume, OFFSET strRestart, OFFSET strToMenu
fontMenuName db "MS Gothic",0
fontDeathName db "MS Gothic",0
gWUV dd 0
gWuBL dd 0
gWvBL dd 0
gWuBR dd 0
gWvBR dd 0
gWuTL dd 0
gWvTL dd 0
gWuTR dd 0
gWvTR dd 0
gWU dd 0
gWV dd 0
gWdU dd 0
gWdV dd 0
gWR0 dd 0
gWR1 dd 0
gWLoop dd 0
gWRowCur dd 0
gWBase dd 0
gWCol dd 0
gWHf dd 0
gWHs dd 0
gWX0 dd 0
gWYT dd 0
gWWorldX dd 0
gWPY0 dd 0
gWPY1 dd 0
gWPX0 dd 0
gWPX1 dd 0
gWPY dd 0

monNames dq OFFSET tn0, OFFSET tn1, OFFSET tn2, OFFSET tn3, OFFSET tn4, OFFSET tn5, OFFSET tn6, OFFSET tn7, OFFSET tn8, OFFSET tn9, OFFSET tn10, OFFSET tn11, OFFSET tn12, OFFSET tn13, OFFSET tn14, OFFSET tn15
monHP     dd 40,70,140,220,500,1500,150,150,150,150,150,150,150,150,150,150,150
monAtk    dd 4,6,10,14,15,22,8,8,8,8,8,8,8,8,8,8
monAggro  dd 6,7,8,9,8,10,8,8,8,8,8,8,8,8,8,8
monStepMs dd 340,320,300,280,380,300,300,300,300,300,300,300,300,300,300,300
monAtkMs  dd 1200,800,900,1000,1100,1000,1254,600,450,700,450,912,1800,1800,1800,700,1200
monHurtMs dd 350,400,400,400,300,300,646,400,300,300,625,250,700,700,700,400,500
monDieMs  dd 1200,1200,1400,1400,1600,2000,1054,800,1240,1300,800,1300,1800,2500,2500,2500,2100
monCdMs   dd 1900,1500,1600,1700,1800,1500,1954,1300,1150,1400,1150,1612,2500,2500,2500,1400,1900
atkFrames  dd 4,6,7
actFrames  dd 1,8,3,6,5,9,8,3,1
pActAction dd 0,4,2,5,6,7,8
pActMs     dd 0,ATK_ANIM_MS,PICK_MS,SKILL_MS,CAST_MS,HURT_MS,DEAD_MS
dirMapA    db 0,1,2,3,4,83h,82h,81h
dirMapB    db 0,1,3,3,4,83h,81h,81h
wpnClass   dd 0,0,0,0,1,1,0,0,0,0,0,0,1
weapName   db "player_weapon.bmp",0
itemAtkAnim dd 10 dup(0)
dropColors dd 0FFD040h,4090FFh,40E070h
dropMsgs   dq OFFSET msgDrop0, OFFSET msgDrop1, OFFSET msgDrop2
monSheetOf dd 0,1,2,3,4,5,0,0,0,0,0,0,0,0,0,0
monView   db 0,0,0,3,1,1,2,2
tn0 db "Galion",0
tn1 db "Lizard Warrior",0
tn2 db "Dimik",0
tn3 db "Alarm",0
tn4 db "Tower Keeper",0
tn5 db "Obsidian Knight",0
tn6 db "ct_drainliar",0
tn7 db "ct_joker",0
tn8 db "ct_mimic",0
tn9 db "ct_penomena",0
tn10 db "ct_rideword",0
tn11 db "neo_punk",0
tn12 db "owl_marquees",0
tn13 db "owl_viscount",0
tn14 db "time_keeper",0
tn15 db "timeholder",0

entities dd 0,196,200,1, 0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0
         dd 0,204,200,2, 0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0
         include campfires.inc
         include enemies.inc
         dd -1,0,0,5, 0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0
         dd -1,0,0,5, 0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0
         dd -1,0,0,5, 0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0
         dd -1,0,0,5, 0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0
         dd -1,0,0,5, 0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0
         dd -1,0,0,5, 0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0
         dd -1,0,0,5, 0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0
         dd -1,0,0,5, 0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0

ENTN equ ($-entities)/ENTSZ

itemKind  dd 0,1,2,2,2,2,3,3,4,4,5,2,2
itemStack dd 1,3,1,1,1,1,1,1,1,1,1,1,1
itemAtk   dd 0,0,25,30,40,50,0,0,0,0,0,40,60
itemDef   dd 0,0,0,0,0,0,4,8,0,0,0,0,0
itemCd    dd 0,0,450,450,900,900,0,0,0,0,0,450,900
itemColor dd 0,3CC060h,0B4BCCCh,6CD8FFh,8C94A4h,0FFD060h,6E7888h,4C4660h,0E8D8A0h,0A070E0h,0B8E0FFh,0A0F0FFh,0FFB070h
itemShort db "--",0,"Gw",0,"Ls",0,"L+",0,"Ax",0,"A+",0,"Ch",0,"Ha",0,"Sh",0,"Bi",0,"Fw",0,"L3",0,"A3",0
fkeyStr   db "F1",0,"F2",0,"F3",0,"F4",0,"F5",0,"F6",0,"F7",0,"F8",0
itemNames dq OFFSET in0, OFFSET in1, OFFSET in2, OFFSET in3, OFFSET in4, OFFSET in5, OFFSET in6, OFFSET in7, OFFSET in8, OFFSET in9, OFFSET in10, OFFSET in11, OFFSET in12
itemDesc  dq OFFSET id0, OFFSET id1, OFFSET id2, OFFSET id3, OFFSET id4, OFFSET id5, OFFSET id6, OFFSET id7, OFFSET id8, OFFSET id9, OFFSET id10, OFFSET id11, OFFSET id12
pickMsgs  dq OFFSET id0, OFFSET pm1, OFFSET pm2, OFFSET pm3, OFFSET pm4, OFFSET pm5, OFFSET pm6, OFFSET pm7, OFFSET pm8, OFFSET pm9, OFFSET pm10, OFFSET pm11, OFFSET pm12
lootCum   db 40,52,58,68,74,80,84,90,94,100
lootItem  db 1,8,9,6,7,2,3,4,5,1
in0 db "none",0
in1 db "Greenwarish",0
in2 db "Longsword",0
in3 db "Longsword +1",0
in4 db "Axe",0
in5 db "Axe +1",0
in6 db "Chainmail",0
in7 db "Heavy Armor",0
in8 db "Scroll of Sharpness",0
in9 db "Scroll of Binding",0
in10 db "Fly Wing",0
in11 db "Longsword +3",0
in12 db "Axe +3",0
id0 db 0
id1 db "Heals 30% of your max HP. Up to 3 per slot.",0
id2 db "A fast sword. ATK 25.",0
id3 db "A fast sword, enchanted. ATK 30.",0
id4 db "A heavy, slow axe. ATK 40.",0
id5 db "A heavy, slow axe, enchanted. ATK 50.",0
id6 db "Light armor. DEF +4.",0
id7 db "Heavy armor. DEF +8.",0
id8 db "Use: +2% damage with every weapon, for good.",0
id9 db "Use: your hits freeze enemies for 2 seconds, for good.",0
id10 db "Use: fly to a random spot on this floor. Unlimited uses.",0
id11 db "A fast sword, tempered three times. ATK 40.",0
id12 db "A heavy axe, tempered three times. ATK 60.",0
pm1 db "You found a Greenwarish.",0
pm2 db "You found a Longsword.",0
pm3 db "You found a Longsword +1!",0
pm4 db "You found an Axe.",0
pm5 db "You found an Axe +1!",0
pm6 db "You found Chainmail.",0
pm7 db "You found Heavy Armor.",0
pm8 db "You found a Scroll of Sharpness.",0
pm9 db "You found a Scroll of Binding.",0
pm10 db "You found a Fly Wing!",0
pm11 db "The Tower Keeper dropped a Longsword +3!",0
pm12 db "The Tower Keeper dropped an Axe +3!",0

mapNames dq OFFSET mn0, OFFSET mn1, OFFSET mn2, OFFSET mn3
         dq OFFSET mn4, OFFSET mn5, OFFSET mn6, OFFSET mn7
mn0 db "Clock Tower 1F (ctf1)",0
mn1 db "Clock Tower 2F (ctf2)",0
mn2 db "Clock Tower 3F (ctf3)",0
mn3 db "Clock Tower 4F (ctf4)",0
mn4 db "Basement 1 (ctb1)",0
mn5 db "Basement 2 (ctb2)",0
mn6 db "Basement 3 (ctb3)",0
mn7 db "Basement 4 (ctb4)",0

msgWelcome db "Welcome to the Clock Tower. You might want to speak to the Blacksmith first.",0
msgKnife   db "Blacksmith Andre: You're new here, aren't you..? Have a weapon.",0
msgSword   db "Blacksmith Andre: Here, still? Fine. Have another.",0
msgNoMore  db "Blacksmith Andre: Prithee, be careful.",0
msgNeedWpn db "You can't attack without a weapon.. equip one in your bag (B) or talk to the Blacksmith.",0
msgSage    db "Hidden Sage: You found me.",0
msgEmpty   db 0
msgDrop0   db "Picked up some gold.",0
msgDrop1   db "Picked up a blue gem.",0
msgDrop2   db "Picked up a green herb.",0
msgTooFarD db "Get next to the item to pick it up.",0
strLoot    db "Loot:",0
msgOuch    db "An enemy hits you!",0
msgDefeated db "You were defeated and wake up at the start of the floor.",0
msgSlain   db "You killed an enemy.",0
msgTooFarE db "Get next to the enemy to attack it.",0
strHP      db "HP:",0
monName    db "monster.bmp",0
mnf1 db "monster1.bmp",0
mnf2 db "monster2.bmp",0
mnf3 db "monster3.bmp",0
mnf4 db "monster4.bmp",0
mnf5 db "monster5.bmp",0
monNameTab dq OFFSET monName, OFFSET mnf1, OFFSET mnf2, OFFSET mnf3, OFFSET mnf4, OFFSET mnf5
headName   db "player_head.bmp",0
msgTooFar  db "Too far away. Click something within 5 cells.",0
msgNoPath  db "Can not find a way there.",0
msgNoField db "That map file was not found in the maps folder.",0
msgNoMaps  db "Map files not found: put the maps folder next to game.exe.",0
msgHealed  db "Greenwarish: you recover 30% of your HP.",0
msgFullHP  db "Your HP is already full.",0
msgSharp   db "Scroll of Sharpness: +2% damage increase across all weapons",0
msgBind    db "Scroll of Binding: hits bind enemies for 2 seconds.",0
msgAlready db "Your weapon is already bound.",0
msgBagFull db "Your bag is full!",0
msgReborn  db "You are born anew.",0
msgDropped db "You drop it on the floor.",0
msgRest    db "You sit down by the fire and rest...",0
msgRested  db "You feel restored. The fire burns out.",0
msgRestStop db "You get up. The fire is still burning.",0
msgFireOut db "The fire has burnt out.",0
msgNotHurt db "You are not hurt. Save the fire for later.",0
msgNoRoom  db "There is no room on the floor here.",0
msgFly     db "You spread the Fly Wing and land somewhere else on this floor.",0
msgNoSpot  db "The Fly Wing finds no free spot.",0
strPaused  db "PAUSED",0
strEnd1    db "You...... finally did it....!",0
E1LEN      equ $-strEnd1-1
strEnd2a   db "It feels like your work here is done..",0
E2ALEN     equ $-strEnd2a-1
strEnd2b   db "but why do you still feel as if time has not moved?",0
E2BLEN     equ $-strEnd2b-1
strEndTitle db "Demo Complete",0
ETLEN      equ $-strEndTitle-1
strEndHint db "Press Enter to return to the main menu",0
strResume  db "Resume",0
strRestart db "Restart",0
strToMenu  db "Main menu",0
strPauseHint db "Esc: resume",0
menuBgName db "menu_bg.bmp",0
strGameTitle db "RE:START",0
strGameSub db "a dungeon crawl written in x64 assembly",0
strBegin   db "Begin",0
strControls db "Controls",0
strQuit    db "Quit",0
strBack    db "Back",0
strMenuHint db "Arrow keys or mouse, Enter to choose",0
strMenuDesc0 db "Start the game from the beginning.",0
strMenuDesc1 db "Input guide",0
strMenuDesc2 db "Close the game.",0
strDeathTitle db "Be born anew?",0
strDeathPrompt db "Click or press Enter",0
strDeathEsc db "Esc: back to the main menu",0
ck0 db "Arrow keys / WASD",0
ck1 db "Click an enemy",0
ck2 db "Click an item on the floor",0
ck3 db "B or I",0
ck4 db "Click an item, then a slot",0
ck5 db "Click the same item again",0
ck6 db "F1 - F8",0
ck7 db "Orange glowing square",0
ck8 db "Esc",0
cd0 db "Walk",0
cd1 db "Walk next to it and attack (needs an equipped weapon)",0
cd2 db "Walk next to it and pick it up",0
cd3 db "Open or close the bag",0
cd4 db "Swap two items. Drag it out of the back to drop",0
cd5 db "Use or equip it",0
cd6 db "Use the item in that slot",0
cd7 db "Walk into it to take a warp to another floor",0
cd8 db "Close the bag, or pause the game",0
ctlKeys dq OFFSET ck0, OFFSET ck1, OFFSET ck2, OFFSET ck3, OFFSET ck4, OFFSET ck5, OFFSET ck6, OFFSET ck7, OFFSET ck8
ctlDescs dq OFFSET cd0, OFFSET cd1, OFFSET cd2, OFFSET cd3, OFFSET cd4, OFFSET cd5, OFFSET cd6, OFFSET cd7, OFFSET cd8
strBagTitle db "BAG      (B or I to close)",0
strStats   db "STATS",0
strHPl     db "HP",0
strSlash   db "/ 100",0
strAtk     db "ATK",0
strDefl    db "DEF",0
strDelay   db "Delay (ms)",0
strBonus   db "Bonus dmg %",0
strBind    db "Binding",0
strWpnL    db "Weapon",0
strArmL    db "Armor",0
strYes     db "yes",0
strNo      db "no",0
strEq      db "[E]",0
strHelp1   db "Click an item, then a slot, to swap. Drag one out of the window to drop it.",0
strHelp2   db "Click the same item again (or press F1-F8) to use or equip it.",0
iconName   db "icons.bmp",0
msgNoBody  db "player_body.bmp not found next to game.exe: unzip player_sheets.zip into the game folder (not a subfolder)",0
msgNoHead  db "player_head.bmp not found next to game.exe: unzip player_sheets.zip into the game folder (not a subfolder)",0
msgOldSheet db "A player_*.bmp is an old version (wrong size): replace all three from player_sheets.zip",0
msgBadSheet db "player_body / player_head / player_weapon.bmp missing or an old version: copy all three from player_sheets.zip",0
msgHit     db "You strike the dummy.",0
msgMiss    db "You miss.",0
msgReset   db "Dummy HP fully restored!",0
strWeapon  db "Weapon:",0
strMinus   db "-",0
strHand    db "HAND",0
strDummy   db "Dummy HP:",0
strMissNum db "Miss",0
strHint    db "Arrows / WASD to move | Click to interact | B to open bag | F1-F8 to use item | ESC to pause",0
numbuf     db 12 dup(0)

keys dd 25h,-1,0,  27h,1,0,  26h,0,-1,  28h,0,1
     dd 41h,-1,0,  44h,1,0,  57h,0,-1,  53h,0,1
neigh dd 1,0,  -1,0,  0,1,  0,-1
neigh8 dd 1,0,  -1,0,  0,1,  0,-1,  1,1,  -1,1,  1,-1,  -1,-1
dirTab dd 3,4,5,  2,0,6,  1,0,7

slots db 192 dup(0)

bmi  dd 40, SCRW, -SCRH
     dw 1, 32
     dd 0, 0, 0, 0, 0, 0
wc   db 80 dup(0)
msg  db 48 dup(0)

.data?
pixels dd SCRW*SCRH dup(?)
sheetFile db 23000000 dup(?)
curFile   db 262144 dup(?)
iconFile  db 200000 dup(?)
monFile   db MON_SHEETS*MON_SHEET_BYTES dup(?)
headFile  db 23000000 dup(?)
weapFile  db 16000000 dup(?)
hgtData   db MAPTOTAL dup(?)
wuvData   db MAPTOTAL*16 dup(?)
wtxData   db MAPTOTAL dup(?)
menuBgFile db 3700000 dup(?)
cfFile db 120000 dup(?)
menuIcoFile db 20000 dup(?)
bsFile db 210000 dup(?)
endFile db 3700000 dup(?)
endBuf db 160 dup(?)
keyDown   db 256 dup(?)
entInit   db ENTN*ENTSZ dup(?)
propData  db PROP_BYTES dup(?)
tileData  db TILEBYTES dup(?)
atlasData db ATLASBYTES dup(?)
colData   dd MAPTOTAL dup(?)
mapData   db MAPTOTAL dup(?)
miniCol   dd MM_W dup(?)
miniRow   dd MM_H dup(?)
bfsPrev   dd MAXCELLS dup(?)
bfsWalk   db MAXCELLS dup(?)
bfsQ      dd MAXCELLS dup(?)
pathCells dd 8192 dup(?)

.code

WndProc PROC
    sub  rsp, 40
    cmp  edx, 2
    je   wp_destroy
    cmp  edx, 200h
    je   wp_mouse
    cmp  edx, 201h
    je   wp_click
    cmp  edx, 202h
    je   wp_up
    cmp  edx, 2A3h
    je   wp_leave
    cmp  edx, 20h
    jne  wp_default
    movzx eax, r9w
    cmp  eax, 1
    jne  wp_default
    mov  rcx, curCursor
    call SetCursor
    mov  eax, 1
    add  rsp, 40
    ret
wp_default:
    call DefWindowProcA
    add  rsp, 40
    ret
wp_click:
    mov  clickPending, 1
wp_mouse:
    movsx eax, r9w
    mov  dword ptr [mousePt], eax
    mov  rax, r9
    shr  rax, 16
    movsx eax, ax
    mov  dword ptr [mousePt+4], eax
    mov  mouseIn, 1
    mov  dword ptr [tme], 24
    mov  dword ptr [tme+4], 2
    mov  rax, hWnd
    mov  qword ptr [tme+8], rax
    lea  rcx, tme
    call TrackMouseEvent
    mov  ecx, dword ptr [mousePt]
    mov  edx, dword ptr [mousePt+4]
    call EntityAtPixel
    mov  rcx, hArrow
    test rax, rax
    jz   wp_setc
    mov  rcx, hHand
wp_setc:
    cmp  curPixels, 0
    je   wp_setc2
    xor  ecx, ecx
wp_setc2:
    mov  curCursor, rcx
    call SetCursor
    xor  eax, eax
    add  rsp, 40
    ret
wp_up:
    mov  releasePending, 1
    xor  eax, eax
    add  rsp, 40
    ret
wp_leave:
    mov  mouseIn, 0
    mov  dword ptr [mousePt], -1000
    mov  dword ptr [mousePt+4], -1000
    xor  eax, eax
    add  rsp, 40
    ret
wp_destroy:
    xor  ecx, ecx
    call PostQuitMessage
    xor  eax, eax
    add  rsp, 40
    ret
WndProc ENDP

FillRect PROC
    mov  eax, ecx
    add  eax, r8d
    cmp  eax, SCRW
    jle  fr_x1
    mov  eax, SCRW
fr_x1:
    test ecx, ecx
    jns  fr_x0
    xor  ecx, ecx
fr_x0:
    sub  eax, ecx
    jle  fr_exit
    mov  r8d, eax
    mov  eax, edx
    add  eax, r9d
    cmp  eax, clipB
    jle  fr_y1
    mov  eax, clipB
fr_y1:
    cmp  edx, clipT
    jge  fr_y0
    mov  edx, clipT
fr_y0:
    sub  eax, edx
    jle  fr_exit
    mov  r9d, eax
    imul eax, edx, SCRW
    add  eax, ecx
    lea  r11, pixels
    lea  r11, [r11+rax*4]
fr_row:
    mov  rax, r11
    mov  ecx, r8d
fr_col:
    mov  [rax], r10d
    add  rax, 4
    dec  ecx
    jnz  fr_col
    add  r11, SCRW*4
    dec  r9d
    jnz  fr_row
fr_exit:
    ret
FillRect ENDP

Rand PROC
    mov  eax, rng
    mov  ecx, eax
    shl  ecx, 13
    xor  eax, ecx
    mov  ecx, eax
    shr  ecx, 17
    xor  eax, ecx
    mov  ecx, eax
    shl  ecx, 5
    xor  eax, ecx
    mov  rng, eax
    ret
Rand ENDP

U32ToStr PROC
    lea  r10, numbuf+11
    mov  byte ptr [r10], 0
    mov  ecx, 10
u_loop:
    xor  edx, edx
    div  ecx
    add  dl, '0'
    dec  r10
    mov  [r10], dl
    test eax, eax
    jnz  u_loop
    mov  rax, r10
    ret
U32ToStr ENDP

SpawnNum PROC
    mov  eax, nextSlot
    and  eax, 7
    imul eax, eax, 24
    lea  r11, slots
    add  r11, rax
    mov  rax, nowTick
    mov  [r11], rax
    mov  [r11+8], ecx
    mov  [r11+12], edx
    mov  [r11+16], r8d
    mov  [r11+20], r9d
    inc  nextSlot
    ret
SpawnNum ENDP

DoAttack PROC
    call StartAttack
    call Rand
    mov  r8d, eax
    xor  edx, edx
    mov  ecx, 100
    div  ecx
    mov  r9d, edx
    mov  r10d, [rsi+4]
    imul r10d, r10d, TW
    add  r10d, TW/2-10
    mov  r11d, [rsi+8]
    imul r11d, r11d, TH
    add  r11d, OFFY-40
    cmp  r9d, 5
    jb   da_miss
    mov  eax, r8d
    shr  eax, 8
    xor  edx, edx
    mov  ecx, 31
    div  ecx
    add  edx, 85
    mov  eax, weapon
    lea  rcx, itemAtk
    mov  eax, [rcx+rax*4]
    imul eax, atkMul
    imul eax, edx
    xor  edx, edx
    mov  ecx, 10000
    div  ecx
    mov  ecx, 1
    cmp  r9d, 90
    jb   da_apply
    lea  eax, [rax+rax*2]
    shr  eax, 1
    mov  ecx, 2
da_apply:
    sub  dummyHP, eax
    mov  r8d, eax
    mov  r9d, ecx
    mov  ecx, r10d
    mov  edx, r11d
    call SpawnNum
    lea  rax, msgHit
    mov  msgPtr, rax
    cmp  dummyHP, 0
    jg   da_done
    mov  dummyHP, MAXHP
    lea  rax, msgReset
    mov  msgPtr, rax
    ret
da_miss:
    xor  r8d, r8d
    mov  r9d, 3
    mov  ecx, r10d
    mov  edx, r11d
    call SpawnNum
    lea  rax, msgMiss
    mov  msgPtr, rax
da_done:
    ret
DoAttack ENDP

FindEntity PROC
    lea  rax, entities
    mov  ecx, ENTN
fe_loop:
    mov  edx, [rax]
    cmp  edx, curMap
    jne  fe_next
    cmp  [rax+4], esi
    jne  fe_next
    cmp  [rax+8], edi
    jne  fe_next
    cmp  dword ptr [rax+12], 5
    je   fe_next
    cmp  dword ptr [rax+12], 4
    jne  fe_hit
    cmp  dword ptr [rax+24], ST_DEAD
    je   fe_next
fe_hit:
    ret
fe_next:
    add  rax, ENTSZ
    dec  ecx
    jnz  fe_loop
    xor  eax, eax
    ret
FindEntity ENDP

FindPath PROC
    push rbx
    push rsi
    push rdi
    push r12
    push r13
    push r14
    push r15
    mov  rsi, pathTarget
    mov  r12d, curW
    imul r12d, curH
    lea  rdi, bfsPrev
    xor  eax, eax
    mov  ecx, r12d
    rep  stosd
    mov  rdx, curBase
    lea  rdi, bfsWalk
    xor  ecx, ecx
fp_w:
    xor  eax, eax
    cmp  byte ptr [rdx+rcx], '.'
    sete al
    mov  [rdi+rcx], al
    inc  ecx
    cmp  ecx, r12d
    jb   fp_w
    lea  rdx, entities
    mov  ecx, ENTN
fp_e:
    mov  eax, [rdx]
    cmp  eax, curMap
    jne  fp_en
    cmp  dword ptr [rdx+12], 5
    je   fp_en
    cmp  dword ptr [rdx+12], 4
    jne  fp_blk
    cmp  dword ptr [rdx+24], ST_DEAD
    je   fp_en
fp_blk:
    mov  eax, [rdx+8]
    imul eax, curW
    add  eax, [rdx+4]
    mov  byte ptr [rdi+rax], 0
fp_en:
    add  rdx, ENTSZ
    dec  ecx
    jnz  fp_e
    mov  eax, playerY
    imul eax, curW
    add  eax, playerX
    lea  rbx, bfsPrev
    mov  dword ptr [rbx+rax*4], 0FFFFFFFFh
    lea  r13, bfsQ
    mov  [r13], eax
    xor  r14d, r14d
    mov  r15d, 1
fp_loop:
    cmp  r14d, r15d
    jae  fp_fail
    mov  r8d, [r13+r14*4]
    inc  r14d
    mov  eax, r8d
    xor  edx, edx
    mov  ecx, curW
    div  ecx
    mov  r9d, eax
    mov  r10d, edx
    mov  eax, r10d
    sub  eax, [rsi+4]
    inc  eax
    cmp  eax, 2
    ja   fp_expand
    mov  eax, r9d
    sub  eax, [rsi+8]
    inc  eax
    cmp  eax, 2
    ja   fp_expand
    jmp  fp_found
fp_expand:
    lea  r11, neigh8
    mov  ecx, 8
fp_n:
    mov  eax, r10d
    add  eax, [r11]
    cmp  eax, curW
    jae  fp_next
    mov  edx, r9d
    add  edx, [r11+4]
    cmp  edx, curH
    jae  fp_next
    imul edx, curW
    add  edx, eax
    cmp  byte ptr [rdi+rdx], 0
    je   fp_next
    cmp  dword ptr [rbx+rdx*4], 0
    jne  fp_next
    mov  eax, [r11]
    test eax, eax
    jz   fp_ok
    mov  eax, [r11+4]
    test eax, eax
    jz   fp_ok
    mov  eax, r8d
    add  eax, [r11]
    cmp  byte ptr [rdi+rax], 0
    je   fp_next
    mov  eax, [r11+4]
    imul eax, curW
    add  eax, r8d
    cmp  byte ptr [rdi+rax], 0
    je   fp_next
fp_ok:
    lea  eax, [r8+1]
    mov  [rbx+rdx*4], eax
    mov  [r13+r15*4], edx
    inc  r15d
fp_next:
    add  r11, 8
    dec  ecx
    jnz  fp_n
    jmp  fp_loop
fp_found:
    xor  ecx, ecx
    mov  eax, r8d
fp_cnt:
    mov  edx, [rbx+rax*4]
    cmp  edx, 0FFFFFFFFh
    je   fp_fill
    inc  ecx
    lea  eax, [rdx-1]
    jmp  fp_cnt
fp_fill:
    cmp  ecx, 8192
    ja   fp_fail
    mov  pathLen, ecx
    mov  pathPos, 0
    mov  eax, r8d
    lea  r11, pathCells
fp_fl:
    test ecx, ecx
    jz   fp_done
    dec  ecx
    mov  [r11+rcx*4], eax
    mov  edx, [rbx+rax*4]
    lea  eax, [rdx-1]
    jmp  fp_fl
fp_done:
    mov  eax, pathLen
    jmp  fp_exit
fp_fail:
    mov  eax, -1
fp_exit:
    pop  r15
    pop  r14
    pop  r13
    pop  r12
    pop  rdi
    pop  rsi
    pop  rbx
    ret
FindPath ENDP

LoadBmp PROC
    push rbx
    push rsi
    push rdi
    sub  rsp, 64
    mov  rsi, rdx
    mov  edi, r8d
    mov  edx, 80000000h
    mov  r8d, 1
    xor  r9d, r9d
    mov  dword ptr [rsp+32], 3
    mov  dword ptr [rsp+40], 80h
    mov  qword ptr [rsp+48], 0
    call CreateFileA
    cmp  rax, -1
    je   lb_fail
    mov  rbx, rax
    mov  rcx, rbx
    mov  rdx, rsi
    mov  r8d, edi
    lea  r9, bytesRead
    mov  qword ptr [rsp+32], 0
    call ReadFile
    mov  rcx, rbx
    call CloseHandle
    cmp  word ptr [rsi], 4D42h
    jne  lb_fail
    cmp  word ptr [rsi+28], 32
    jne  lb_fail
    cmp  dword ptr [rsi+22], 0
    jge  lb_fail
    mov  edx, [rsi+18]
    mov  eax, [rsi+10]
    add  rax, rsi
    jmp  lb_out
lb_fail:
    xor  eax, eax
    xor  edx, edx
lb_out:
    add  rsp, 64
    pop  rdi
    pop  rsi
    pop  rbx
    ret
LoadBmp ENDP

CursorState PROC
    push rsi
    push rdi
    mov  rax, hoverEnt
    test rax, rax
    jz   cs_cell
    cmp  dword ptr [rax+12], 2
    je   cs_attack
    cmp  dword ptr [rax+12], 4
    je   cs_attack
    cmp  dword ptr [rax+12], 5
    je   cs_pick
    mov  r10d, 16
    mov  r11d, 3
    jmp  cs_center
cs_attack:
    mov  r10d, 19
    mov  r11d, 1
    jmp  cs_center
cs_pick:
    mov  r10d, 20
    mov  r11d, 3
    jmp  cs_center
cs_cell:
    mov  r10d, 0
    mov  r11d, 6
    mov  eax, dword ptr [mousePt]
    sub  eax, MM_X-2
    cmp  eax, MM_W+4
    jae  cs_nomap
    mov  eax, dword ptr [mousePt+4]
    sub  eax, MM_Y-2
    cmp  eax, MM_H+4
    jb   cs_arrow
cs_nomap:
    mov  eax, dword ptr [mousePt]
    cmp  eax, SCRW
    jae  cs_arrow
    mov  eax, dword ptr [mousePt+4]
    sub  eax, OFFY
    cmp  eax, VIEWH
    jae  cs_arrow
    add  eax, camY
    xor  edx, edx
    mov  ecx, TH
    div  ecx
    mov  edi, eax
    mov  eax, dword ptr [mousePt]
    add  eax, camX
    xor  edx, edx
    mov  ecx, TW
    div  ecx
    mov  esi, eax
    call GetCell
    mov  ecx, eax
    lea  r8, warps
    mov  r9d, WARPN
cs_w:
    mov  eax, [r8]
    cmp  eax, curMap
    jne  cs_wn
    mov  eax, esi
    sub  eax, [r8+4]
    add  eax, WARP_R
    cmp  eax, WARP_R*2
    ja   cs_wn
    mov  eax, edi
    sub  eax, [r8+8]
    add  eax, WARP_R
    cmp  eax, WARP_R*2
    ja   cs_wn
    mov  r10d, 11
    mov  r11d, 5
    jmp  cs_center
cs_wn:
    add  r8, 24
    dec  r9d
    jnz  cs_w
    cmp  cl, '#'
    je   cs_block
    jmp  cs_arrow
cs_block:
    mov  r10d, 9
    mov  r11d, 1
    jmp  cs_center
cs_arrow:
    mov  r8d, 16
    mov  r9d, 3
    jmp  cs_out
cs_center:
    mov  r8d, 16
    mov  r9d, 16
cs_out:
    pop  rdi
    pop  rsi
    ret
CursorState ENDP

DrawCursorCell PROC
    push rbx
    push rsi
    push rdi
    push r12
    mov  r12d, ecx
    mov  edi, edx
    imul eax, r8d, CURCELL
    mov  r11, curPixels
    lea  r11, [r11+rax*4]
    mov  ebx, CURCELL
dc_row:
    cmp  edi, SCRH
    jae  dc_next
    xor  esi, esi
dc_col:
    mov  eax, [r11+rsi*4]
    test eax, 0FF000000h
    jz   dc_skip
    lea  edx, [r12+rsi]
    cmp  edx, SCRW
    jae  dc_skip
    imul ecx, edi, SCRW
    add  ecx, edx
    lea  rdx, pixels
    mov  [rdx+rcx*4], eax
dc_skip:
    inc  esi
    cmp  esi, CURCELL
    jb   dc_col
dc_next:
    mov  eax, curSheetW
    lea  r11, [r11+rax*4]
    inc  edi
    dec  ebx
    jnz  dc_row
    pop  r12
    pop  rdi
    pop  rsi
    pop  rbx
    ret
DrawCursorCell ENDP

SetMap PROC
    mov  eax, curMap
    lea  rdx, mapBases
    mov  rdx, [rdx+rax*8]
    mov  curBase, rdx
    lea  rdx, mapWs
    mov  ecx, [rdx+rax*4]
    mov  curW, ecx
    lea  rdx, mapHs
    mov  ecx, [rdx+rax*4]
    mov  curH, ecx
    mov  curColors, 0
    lea  rdx, colLoaded
    cmp  dword ptr [rdx+rax*4], 0
    je   sm_tiles
    lea  rdx, colBases
    mov  rdx, [rdx+rax*8]
    mov  curColors, rdx
sm_tiles:
    mov  curTiles, 0
    cmp  atlasLoaded, 0
    je   sm_done
    lea  rdx, tileLoaded
    cmp  dword ptr [rdx+rax*4], 0
    je   sm_done
    lea  rdx, tileBases
    mov  rdx, [rdx+rax*8]
    mov  curTiles, rdx
sm_done:
    mov  curHgt, 0
    lea  rdx, hgtLoaded
    cmp  dword ptr [rdx+rax*4], 0
    je   sm_nohgt
    lea  rdx, hgtBases
    mov  rdx, [rdx+rax*8]
    mov  curHgt, rdx
sm_nohgt:
    mov  curWtx, 0
    lea  rdx, wtxLoaded
    cmp  dword ptr [rdx+rax*4], 0
    je   sm_nowtx
    lea  rdx, wtxBases
    mov  rdx, [rdx+rax*8]
    mov  curWtx, rdx
sm_nowtx:
    mov  curWuv, 0
    lea  rdx, wuvLoaded
    cmp  dword ptr [rdx+rax*4], 0
    je   sm_nowuv
    lea  rdx, wuvBases
    mov  rdx, [rdx+rax*8]
    mov  curWuv, rdx
sm_nowuv:
    lea  rdx, wallTexTab
    mov  ecx, [rdx+rax*4]
    mov  curWallTex, ecx
    jmp  LoadProps
SetMap ENDP

ReadWhole PROC
    push rbx
    push rsi
    push rdi
    sub  rsp, 64
    mov  rsi, rdx
    mov  edi, r8d
    mov  edx, 80000000h
    mov  r8d, 1
    xor  r9d, r9d
    mov  dword ptr [rsp+32], 3
    mov  dword ptr [rsp+40], 80h
    mov  qword ptr [rsp+48], 0
    call CreateFileA
    cmp  rax, -1
    je   rw_fail
    mov  rbx, rax
    mov  dword ptr bytesRead, 0
    mov  rcx, rbx
    mov  rdx, rsi
    mov  r8d, edi
    lea  r9, bytesRead
    mov  qword ptr [rsp+32], 0
    call ReadFile
    mov  rcx, rbx
    call CloseHandle
    mov  eax, bytesRead
    jmp  rw_out
rw_fail:
    xor  eax, eax
rw_out:
    add  rsp, 64
    pop  rdi
    pop  rsi
    pop  rbx
    ret
ReadWhole ENDP

UpdatePlayerVisual PROC
    mov  rax, nowTick
    sub  rax, stepStart
    mov  ecx, stepDur
    xor  r8d, r8d
    cmp  rax, rcx
    jae  uv_fin
    mov  r8d, 1
    jmp  uv_calc
uv_fin:
    mov  eax, ecx
uv_calc:
    mov  pMoving, r8d
    mov  r9d, eax
    mov  eax, playerX
    sub  eax, stepFromX
    imul eax, eax, TW
    imul eax, r9d
    cdq
    idiv ecx
    mov  r10d, eax
    imul eax, stepFromX, TW
    add  r10d, eax
    add  r10d, TW/2
    mov  eax, playerY
    sub  eax, stepFromY
    imul eax, eax, TH
    imul eax, r9d
    cdq
    idiv ecx
    mov  r11d, eax
    imul eax, stepFromY, TH
    add  r11d, eax
    add  r11d, OFFY+TH-3
    mov  pFeetX, r10d
    mov  pFeetY, r11d
    mov  eax, r10d
    sub  eax, SCRW/2
    mov  ecx, curW
    imul ecx, ecx, TW
    sub  ecx, SCRW
    jge  uv_xmax
    xor  ecx, ecx
uv_xmax:
    cmp  eax, ecx
    jle  uv_xlo
    mov  eax, ecx
uv_xlo:
    test eax, eax
    jns  uv_xok
    xor  eax, eax
uv_xok:
    mov  camX, eax
    mov  eax, r11d
    sub  eax, OFFY+VIEWH/2
    mov  ecx, curH
    imul ecx, ecx, TH
    sub  ecx, VIEWH
    jge  uv_ymax
    xor  ecx, ecx
uv_ymax:
    cmp  eax, ecx
    jle  uv_ylo
    mov  eax, ecx
uv_ylo:
    test eax, eax
    jns  uv_yok
    xor  eax, eax
uv_yok:
    mov  camY, eax
    ret
UpdatePlayerVisual ENDP

MiniDot PROC
    mov  eax, edx
    imul eax, r12d
    mov  edx, r12d
    shr  edx, 1
    add  eax, edx
    shr  eax, 16
    lea  edx, [rbx+rax-1]
    imul ecx, r12d
    mov  eax, r12d
    shr  eax, 1
    add  ecx, eax
    shr  ecx, 16
    add  ecx, r15d
    dec  ecx
    mov  r8d, 3
    mov  r9d, 3
    call FillRect
    ret
MiniDot ENDP

DrawMinimap PROC
    push rbx
    push rsi
    push rdi
    push r12
    push r13
    push r14
    push r15
    mov  clipT, 0
    mov  clipB, SCRH
    mov  ecx, MM_X-2
    mov  edx, MM_Y-2
    mov  r8d, MM_W+4
    mov  r9d, MM_H+4
    mov  r10d, C_MMBDR
    call FillRect
    mov  ecx, MM_X-1
    mov  edx, MM_Y-1
    mov  r8d, MM_W+2
    mov  r9d, MM_H+2
    mov  r10d, C_MMBG
    call FillRect
    mov  eax, MM_W*65536
    xor  edx, edx
    div  curW
    mov  ecx, eax
    mov  eax, MM_H*65536
    xor  edx, edx
    div  curH
    cmp  eax, ecx
    jbe  mm_sc
    mov  eax, ecx
mm_sc:
    mov  r12d, eax
    mov  eax, curW
    imul eax, r12d
    shr  eax, 16
    mov  r13d, eax
    mov  eax, curH
    imul eax, r12d
    shr  eax, 16
    mov  r14d, eax
    mov  eax, MM_W
    sub  eax, r13d
    shr  eax, 1
    add  eax, MM_X
    mov  r15d, eax
    mov  eax, MM_H
    sub  eax, r14d
    shr  eax, 1
    add  eax, MM_Y
    mov  ebx, eax
    xor  edi, edi
mm_c:
    lea  eax, [rdi+rdi+1]
    imul eax, curW
    mov  ecx, r13d
    add  ecx, ecx
    xor  edx, edx
    div  ecx
    lea  r8, miniCol
    mov  [r8+rdi*4], eax
    inc  edi
    cmp  edi, r13d
    jb   mm_c
    xor  edi, edi
mm_r:
    lea  eax, [rdi+rdi+1]
    imul eax, curH
    mov  ecx, r14d
    add  ecx, ecx
    xor  edx, edx
    div  ecx
    lea  r8, miniRow
    mov  [r8+rdi*4], eax
    inc  edi
    cmp  edi, r14d
    jb   mm_r
    mov  r9, curBase
    xor  edi, edi
mm_row:
    lea  r8, miniRow
    mov  eax, [r8+rdi*4]
    imul eax, curW
    mov  r10d, eax
    lea  eax, [rbx+rdi]
    imul eax, SCRW
    add  eax, r15d
    lea  r11, pixels
    lea  r11, [r11+rax*4]
    xor  ecx, ecx
mm_col:
    lea  r8, miniCol
    mov  eax, [r8+rcx*4]
    add  eax, r10d
    movzx eax, byte ptr [r9+rax]
    mov  edx, C_MMWALK
    cmp  al, '.'
    je   mm_put
    mov  edx, C_MMWALL
    cmp  al, '#'
    je   mm_put
    mov  edx, C_MMEXIT
mm_put:
    mov  [r11+rcx*4], edx
    inc  ecx
    cmp  ecx, r13d
    jb   mm_col
    inc  edi
    cmp  edi, r14d
    jb   mm_row

    lea  rdi, warps
    mov  esi, WARPN
mm_wp:
    mov  eax, [rdi]
    cmp  eax, curMap
    jne  mm_wpn
    mov  ecx, [rdi+4]
    mov  edx, [rdi+8]
    mov  r10d, C_MMEXIT
    call MiniMark
mm_wpn:
    add  rdi, 24
    dec  esi
    jnz  mm_wp

    lea  rdi, entities
    mov  esi, ENTN
mm_en:
    mov  eax, [rdi]
    cmp  eax, curMap
    jne  mm_enn
    mov  ecx, [rdi+4]
    mov  edx, [rdi+8]
    mov  r10d, C_MMNPC
    cmp  dword ptr [rdi+12], 2
    je   mm_red
    cmp  dword ptr [rdi+12], 4
    je   mm_en4
    cmp  dword ptr [rdi+12], 5
    je   mm_drop
    cmp  dword ptr [rdi+12], 6
    jne  mm_dot
    mov  r10d, C_MMFIRE
    cmp  dword ptr [rdi+24], 1
    jne  mm_firemark
    mov  r10d, C_MMFIREOUT
mm_firemark:
    call MiniMark
    jmp  mm_enn
mm_drop:
    mov  r10d, C_MMDROP
    jmp  mm_dot
mm_en4:
    cmp  dword ptr [rdi+24], ST_DEAD
    je   mm_enn
    cmp  dword ptr [rdi+36], BOSS_TYPE
    je   mm_boss
    cmp  dword ptr [rdi+36], FINAL_BOSS_TYPE
    je   mm_boss
mm_red:
    mov  r10d, C_MMENEMY
mm_dot:
    call MiniDot
    jmp  mm_enn
mm_boss:
    call MiniBoss
mm_enn:
    add  rdi, ENTSZ
    dec  esi
    jnz  mm_en

    mov  eax, camX
    imul rax, r12
    shr  rax, 16
    xor  edx, edx
    mov  ecx, TW
    div  ecx
    add  eax, r15d
    mov  esi, eax
    mov  eax, camY
    imul rax, r12
    shr  rax, 16
    xor  edx, edx
    mov  ecx, TH
    div  ecx
    add  eax, ebx
    mov  edi, eax
    mov  eax, SCRW/TW
    imul eax, r12d
    shr  eax, 16
    cmp  eax, 2
    jae  mm_vw
    mov  eax, 2
mm_vw:
    mov  r13d, eax
    mov  eax, VIEWH/TH
    imul eax, r12d
    shr  eax, 16
    cmp  eax, 2
    jae  mm_vh
    mov  eax, 2
mm_vh:
    mov  r14d, eax
    mov  ecx, esi
    mov  edx, edi
    mov  r8d, r13d
    mov  r9d, 1
    mov  r10d, C_MMVIEW
    call FillRect
    mov  ecx, esi
    lea  edx, [rdi+r14-1]
    mov  r8d, r13d
    mov  r9d, 1
    call FillRect
    mov  ecx, esi
    mov  edx, edi
    mov  r8d, 1
    mov  r9d, r14d
    call FillRect
    lea  ecx, [rsi+r13-1]
    mov  edx, edi
    mov  r8d, 1
    mov  r9d, r14d
    call FillRect

    mov  ecx, playerX
    mov  edx, playerY
    mov  r10d, C_MMPLAYER
    call MiniDot
    pop  r15
    pop  r14
    pop  r13
    pop  r12
    pop  rdi
    pop  rsi
    pop  rbx
    ret
DrawMinimap ENDP

LoadMaps PROC
    push rbx
    push rsi
    push rdi
    xor  ebx, ebx
lm_loop:
    lea  rax, mapWs
    mov  esi, [rax+rbx*4]
    lea  rax, mapHs
    imul esi, [rax+rbx*4]
    lea  rax, mapFiles
    mov  rcx, [rax+rbx*8]
    lea  rax, mapBases
    mov  rdx, [rax+rbx*8]
    mov  r8d, esi
    call ReadWhole
    cmp  eax, esi
    jne  lm_next
    lea  rax, mapLoaded
    mov  dword ptr [rax+rbx*4], 1
    lea  rax, hgtFiles
    mov  rcx, [rax+rbx*8]
    lea  rax, hgtBases
    mov  rdx, [rax+rbx*8]
    mov  r8d, esi
    call ReadWhole
    cmp  eax, esi
    jne  lm_nohgt
    lea  rax, hgtLoaded
    mov  dword ptr [rax+rbx*4], 1
lm_nohgt:
    lea  rax, wtxFiles
    mov  rcx, [rax+rbx*8]
    lea  rax, wtxBases
    mov  rdx, [rax+rbx*8]
    mov  r8d, esi
    call ReadWhole
    cmp  eax, esi
    jne  lm_nowtx
    lea  rax, wtxLoaded
    mov  dword ptr [rax+rbx*4], 1
lm_nowtx:
    lea  rax, wuvFiles
    mov  rcx, [rax+rbx*8]
    lea  rax, wuvBases
    mov  rdx, [rax+rbx*8]
    mov  r8d, esi
    shl  r8d, 4
    call ReadWhole
    mov  ecx, esi
    shl  ecx, 4
    cmp  eax, ecx
    jne  lm_nowuv
    lea  rax, wuvLoaded
    mov  dword ptr [rax+rbx*4], 1
lm_nowuv:
    lea  rax, colFiles
    mov  rcx, [rax+rbx*8]
    lea  rax, colBases
    mov  rdx, [rax+rbx*8]
    shl  esi, 2
    mov  r8d, esi
    call ReadWhole
    cmp  eax, esi
    jne  lm_next
    lea  rax, colLoaded
    mov  dword ptr [rax+rbx*4], 1
lm_next:
    inc  ebx
    cmp  ebx, NMAPS
    jb   lm_loop
    pop  rdi
    pop  rsi
    pop  rbx
    ret
LoadMaps ENDP

PlaceAtSpawn PROC
    mov  eax, curMap
    lea  rdx, mapSpawnX
    mov  ecx, [rdx+rax*4]
    mov  playerX, ecx
    mov  stepFromX, ecx
    lea  rdx, mapSpawnY
    mov  ecx, [rdx+rax*4]
    mov  playerY, ecx
    mov  stepFromY, ecx
    mov  stepStart, 0
    mov  pathLen, 0
    mov  pathPos, 0
    mov  pendingEnt, 0
    mov  dlgEnt, 0
    mov  dlgPtr, 0
    lea  rax, msgEmpty
    mov  msgPtr, rax
    ret
PlaceAtSpawn ENDP

JumpToMap PROC
    cmp  eax, NMAPS
    jae  jm_ret
    lea  rdx, mapLoaded
    cmp  dword ptr [rdx+rax*4], 0
    je   jm_ret
    mov  curMap, eax
    call SetMap
    call PlaceAtSpawn
jm_ret:
    ret
JumpToMap ENDP

DrawDialogue PROC
    push rbx
    push rsi
    push rdi
    mov  rax, dlgEnt
    test rax, rax
    jz   dd_exit
    mov  rsi, dlgPtr
    test rsi, rsi
    jz   dd_exit
    imul ebx, dword ptr [rax+4], TW
    add  ebx, TW/2
    sub  ebx, camX
    imul edi, dword ptr [rax+8], TH
    add  edi, OFFY+TH-3-62
    sub  edi, camY
    xor  ecx, ecx
dd_len:
    cmp  byte ptr [rsi+rcx], 0
    je   dd_got
    inc  ecx
    jmp  dd_len
dd_got:
    shl  ecx, 2
    sub  ebx, ecx
    lea  ecx, [rbx+1]
    lea  edx, [rdi+1]
    mov  r8, rsi
    xor  r9d, r9d
    call TextAt
    mov  ecx, ebx
    mov  edx, edi
    mov  r8, rsi
    mov  r9d, 0A0F0FFh
    call TextAt
dd_exit:
    pop  rdi
    pop  rsi
    pop  rbx
    ret
DrawDialogue ENDP

WarpTo PROC
    mov  curMap, eax
    mov  playerX, ecx
    mov  playerY, edx
    mov  stepFromX, ecx
    mov  stepFromY, edx
    mov  stepStart, 0
    mov  pathLen, 0
    mov  pathPos, 0
    mov  pendingEnt, 0
    mov  dlgEnt, 0
    mov  dlgPtr, 0
    call SetMap
    lea  rax, msgEmpty
    mov  msgPtr, rax
    ret
WarpTo ENDP

CheckWarp PROC
    lea  r8, warps
    mov  r9d, WARPN
cw_loop:
    mov  eax, [r8]
    cmp  eax, curMap
    jne  cw_next
    mov  eax, playerX
    sub  eax, [r8+4]
    add  eax, WARP_R
    cmp  eax, WARP_R*2
    ja   cw_next
    mov  eax, playerY
    sub  eax, [r8+8]
    add  eax, WARP_R
    cmp  eax, WARP_R*2
    ja   cw_next
    mov  eax, [r8+12]
    mov  ecx, [r8+16]
    mov  edx, [r8+20]
    call WarpTo
    ret
cw_next:
    add  r8, 24
    dec  r9d
    jnz  cw_loop
    ret
CheckWarp ENDP

LoadGround PROC
    push rbx
    push rsi
    push rdi
    xor  ebx, ebx
lg_loop:
    lea  rax, mapWs
    mov  esi, [rax+rbx*4]
    lea  rax, mapHs
    imul esi, [rax+rbx*4]
    imul esi, esi, 24
    lea  rax, grdFiles
    mov  rcx, [rax+rbx*8]
    lea  rax, tileBases
    mov  rdx, [rax+rbx*8]
    mov  r8d, esi
    call ReadWhole
    cmp  eax, esi
    jne  lg_next
    lea  rax, tileLoaded
    mov  dword ptr [rax+rbx*4], 1
lg_next:
    inc  ebx
    cmp  ebx, NMAPS
    jb   lg_loop
    lea  rcx, atlasName
    lea  rdx, atlasData
    mov  r8d, ATLASBYTES
    call ReadWhole
    cmp  eax, ATLASBYTES
    jne  lg_done
    mov  atlasLoaded, 1
lg_done:
    pop  rdi
    pop  rsi
    pop  rbx
    ret
LoadGround ENDP

DrawGround PROC
    push rbx
    push rsi
    push rdi
    push rbp
    push r12
    push r13
    push r14
    push r15
    mov  eax, gR0
    mov  gRow, eax
dg_row:
    mov  eax, gC0
    mov  gCol, eax
dg_col:
    mov  eax, gCol
    imul eax, eax, TW
    sub  eax, camX
    mov  gSX, eax
    mov  eax, gRow
    imul eax, eax, TH
    add  eax, OFFY
    sub  eax, camY
    mov  gSY, eax
    mov  eax, gSX
    neg  eax
    xor  edx, edx
    test eax, eax
    jle  dg_x0
    mov  edx, eax
dg_x0:
    mov  gPX0, edx
    mov  eax, SCRW
    sub  eax, gSX
    cmp  eax, TW
    jle  dg_x1
    mov  eax, TW
dg_x1:
    mov  gPX1, eax
    mov  eax, clipT
    sub  eax, gSY
    xor  edx, edx
    test eax, eax
    jle  dg_y0
    mov  edx, eax
dg_y0:
    mov  gPY0, edx
    mov  eax, clipB
    sub  eax, gSY
    cmp  eax, TH
    jle  dg_y1
    mov  eax, TH
dg_y1:
    mov  gPY1, eax
    mov  eax, gPX1
    cmp  eax, gPX0
    jle  dg_next
    mov  eax, gPY1
    cmp  eax, gPY0
    jle  dg_next
    mov  eax, gRow
    shr  eax, 1
    mov  ecx, curW
    shr  ecx, 1
    imul eax, ecx
    mov  edx, gCol
    shr  edx, 1
    add  eax, edx
    imul eax, eax, 96
    mov  rbp, curTiles
    add  rbp, rax
    mov  eax, gCol
    and  eax, 1
    imul eax, eax, TW
    mov  gOX, eax
    mov  eax, gRow
    and  eax, 1
    imul eax, eax, TH
    mov  gOY, eax
    mov  eax, gRow
    imul eax, curW
    add  eax, gCol
    mov  rdx, curBase
    movzx eax, byte ptr [rdx+rax]
    xor  ecx, ecx
    cmp  al, '.'
    je   dg_lit
    mov  ecx, 1
dg_lit:
    mov  dimShift, ecx
    mov  eax, [rbp]
    test eax, eax
    jns  dg_have
    mov  ecx, gSX
    mov  edx, gSY
    mov  r8d, TW
    mov  r9d, TH
    mov  r10d, C_WALL
    call FillRect
    jmp  dg_next
dg_have:
    shl  eax, 18
    lea  r10, atlasData
    add  r10, rax
    mov  eax, gPY0
    mov  gPY, eax
dg_line:
    mov  eax, gOY
    add  eax, gPY
    lea  rdx, lmyTab
    movzx r12d, byte ptr [rdx+rax]
    shl  r12d, 3
    mov  eax, gOX
    add  eax, gPX0
    mov  r14d, eax
    mov  ecx, gOY
    add  ecx, gPY
    mov  esi, [rbp+12]
    imul esi, eax
    mov  edx, [rbp+20]
    imul edx, ecx
    add  esi, edx
    add  esi, [rbp+4]
    mov  edi, [rbp+16]
    imul edi, eax
    mov  edx, [rbp+24]
    imul edx, ecx
    add  edi, edx
    add  edi, [rbp+8]
    mov  r8d, [rbp+12]
    mov  r9d, [rbp+16]
    lea  r13, [rbp+32]
    lea  r15, lmxTab
    mov  eax, gSY
    add  eax, gPY
    imul eax, eax, SCRW
    add  eax, gSX
    add  eax, gPX0
    lea  r11, pixels
    lea  r11, [r11+rax*4]
    mov  ebx, gPX1
    sub  ebx, gPX0
dg_px:
    movzx eax, byte ptr [r15+r14]
    add  eax, r12d
    movzx edx, byte ptr [r13+rax]
    mov  cl, byte ptr [dimShift]
    shr  edx, cl
    mov  eax, edi
    shr  eax, 8
    movzx eax, al
    shl  eax, 8
    mov  ecx, esi
    shr  ecx, 8
    movzx ecx, cl
    or   eax, ecx
    mov  eax, [r10+rax*4]
    mov  ecx, eax
    and  ecx, 00FF00FFh
    imul ecx, edx
    shr  ecx, 7
    and  ecx, 00FF00FFh
    and  eax, 0000FF00h
    imul eax, edx
    shr  eax, 7
    and  eax, 0000FF00h
    or   eax, ecx
    mov  [r11], eax
    add  r11, 4
    add  esi, r8d
    add  edi, r9d
    inc  r14d
    dec  ebx
    jnz  dg_px
    inc  gPY
    mov  eax, gPY
    cmp  eax, gPY1
    jl   dg_line
dg_next:
    inc  gCol
    mov  eax, gCol
    cmp  eax, gC1
    jl   dg_col
    inc  gRow
    mov  eax, gRow
    cmp  eax, gR1
    jl   dg_row
    pop  r15
    pop  r14
    pop  r13
    pop  r12
    pop  rbp
    pop  rdi
    pop  rsi
    pop  rbx
    ret
DrawGround ENDP

TintRect PROC
    mov  eax, ecx
    add  eax, r8d
    cmp  eax, SCRW
    jle  tr_x1
    mov  eax, SCRW
tr_x1:
    test ecx, ecx
    jns  tr_x0
    xor  ecx, ecx
tr_x0:
    sub  eax, ecx
    jle  tr_exit
    mov  r8d, eax
    mov  eax, edx
    add  eax, r9d
    cmp  eax, clipB
    jle  tr_y1
    mov  eax, clipB
tr_y1:
    cmp  edx, clipT
    jge  tr_y0
    mov  edx, clipT
tr_y0:
    sub  eax, edx
    jle  tr_exit
    mov  r9d, eax
    imul eax, edx, SCRW
    add  eax, ecx
    lea  r11, pixels
    lea  r11, [r11+rax*4]
tr_row:
    mov  rax, r11
    mov  ecx, r8d
tr_col:
    mov  edx, [rax]
    shr  edx, 1
    and  edx, 7F7F7Fh
    add  edx, r10d
    mov  [rax], edx
    add  rax, 4
    dec  ecx
    jnz  tr_col
    add  r11, SCRW*4
    dec  r9d
    jnz  tr_row
tr_exit:
    ret
TintRect ENDP

MiniMark PROC
    push r10
    mov  eax, edx
    imul eax, r12d
    mov  edx, r12d
    shr  edx, 1
    add  eax, edx
    shr  eax, 16
    lea  edx, [rbx+rax-4]
    imul ecx, r12d
    mov  eax, r12d
    shr  eax, 1
    add  ecx, eax
    shr  ecx, 16
    add  ecx, r15d
    sub  ecx, 4
    push rcx
    push rdx
    mov  r8d, 9
    mov  r9d, 9
    xor  r10d, r10d
    call FillRect
    pop  rdx
    pop  rcx
    pop  r10
    inc  ecx
    inc  edx
    mov  r8d, 7
    mov  r9d, 7
    call FillRect
    ret
MiniMark ENDP

DrawEntRow PROC
    push r13
    push r14
    push r15
    mov  r15d, ecx
    lea  r13, entities
    mov  r14d, ENTN
er_loop:
    mov  eax, [r13]
    cmp  eax, curMap
    jne  er_next
    mov  eax, [r13+8]
    cmp  eax, r15d
    jne  er_next
    call DrawEntity
er_next:
    add  r13, ENTSZ
    dec  r14d
    jnz  er_loop
    pop  r15
    pop  r14
    pop  r13
    ret
DrawEntRow ENDP

DrawPlayerWeapon PROC
    mov  eax, gPAct
    sub  eax, 3
    cmp  eax, 2
    ja   dw_ret
    mov  r11d, eax
    cmp  weapPixels, 0
    je   dw_ret
    mov  eax, weapon
    test eax, eax
    jz   dw_ret
    lea  rdx, wpnClass
    mov  eax, [rdx+rax*4]
    lea  eax, [rax+rax*2]
    add  eax, r11d
    lea  eax, [rax+rax*4]
    add  eax, gPView
    imul r9d, eax, WCELLH
    imul r8d, gPFrame, WCELLW
    mov  rax, sheetPixels
    mov  gSavePix, rax
    mov  eax, sheetW
    mov  gSaveW, eax
    mov  rax, weapPixels
    mov  sheetPixels, rax
    mov  eax, weapW
    mov  sheetW, eax
    mov  sprCW, WCELLW
    mov  sprCH, WCELLH
    lea  ecx, [rsi-WCELLOX]
    lea  edx, [rdi-WCELLOY-ORIGLIFT]
    mov  r10d, gHMir
    call DrawSprite
    mov  sprCW, CELLW
    mov  sprCH, CELLH
    mov  rax, gSavePix
    mov  sheetPixels, rax
    mov  eax, gSaveW
    mov  sheetW, eax
dw_ret:
    ret
DrawPlayerWeapon ENDP

DrawPlayer PROC
    push r12
    push r13
    push r14
    mov  esi, pFeetX
    sub  esi, camX
    mov  edi, pFeetY
    sub  edi, camY
    mov  r13d, pMoving

    cmp  ghostMode, 0
    jne  pl_noshadow
    lea  ecx, [rsi-14]
    lea  edx, [rdi-3]
    mov  r8d, 28
    mov  r9d, 7
    mov  r10d, C_SHADOW
    call FillRect
pl_noshadow:

    cmp  sheetPixels, 0
    je   pl_placeholder

    mov  eax, pAct
    test eax, eax
    jnz  sp_oneshot
    test r13d, r13d
    jnz  sp_walk
    cmp  weapon, 0
    jne  sp_ready
    mov  rax, nowTick
    cmp  rax, pReadyUntil
    jb   sp_ready
    xor  r14d, r14d
    xor  r12d, r12d
    jmp  sp_map
sp_ready:
    mov  eax, dword ptr [nowTick]
    xor  edx, edx
    mov  ecx, READY_FRAME_MS
    div  ecx
    xor  edx, edx
    mov  ecx, 6
    div  ecx
    mov  r14d, edx
    mov  r12d, 3
    jmp  sp_map
sp_walk:
    mov  rax, nowTick
    sub  rax, animBase
    xor  edx, edx
    mov  ecx, WALK_FRAME_MS
    div  ecx
    and  eax, 7
    mov  r14d, eax
    mov  r12d, 1
    jmp  sp_map
sp_oneshot:
    mov  ecx, eax
    lea  rdx, pActAction
    mov  r12d, [rdx+rcx*4]
    lea  rdx, actFrames
    mov  r8d, [rdx+r12*4]
    lea  rdx, pActMs
    mov  r9d, [rdx+rcx*4]
    mov  eax, dword ptr [nowTick]
    sub  eax, pActStart
    imul eax, r8d
    xor  edx, edx
    div  r9d
    dec  r8d
    cmp  eax, r8d
    jbe  sp_of
    mov  eax, r8d
sp_of:
    mov  r14d, eax

sp_map:
    mov  eax, facing
    lea  rdx, dirMapA
    cmp  r12d, 1
    jbe  sp_dm
    lea  rdx, dirMapB
sp_dm:
    movzx eax, byte ptr [rdx+rax]
    mov  r10d, eax
    shr  r10d, 7
    and  eax, 7Fh
    mov  gPView, eax
    mov  gPFrame, r14d
    mov  gPAct, r12d
    lea  r9d, [r12+r12*4]
    add  r9d, eax
    imul r9d, r9d, CELLH
    imul r8d, r14d, CELLW
    lea  ecx, [rsi-CELLOX]
    lea  edx, [rdi-CELLOY-ORIGLIFT]
    mov  gHDx, ecx
    mov  gHDy, edx
    mov  gHSx, r8d
    mov  gHSy, r9d
    mov  gHMir, r10d
    cmp  gPView, 2
    jb   pl_nback
    call DrawPlayerWeapon
pl_nback:
    mov  ecx, gHDx
    mov  edx, gHDy
    mov  r8d, gHSx
    mov  r9d, gHSy
    mov  r10d, gHMir
    call DrawSprite
    cmp  headPixels, 0
    je   pl_weapon
    mov  rax, sheetPixels
    mov  gSavePix, rax
    mov  eax, sheetW
    mov  gSaveW, eax
    mov  rax, headPixels
    mov  sheetPixels, rax
    mov  eax, headW
    mov  sheetW, eax
    mov  ecx, gHDx
    mov  edx, gHDy
    mov  r8d, gHSx
    mov  r9d, gHSy
    mov  r10d, gHMir
    call DrawSprite
    mov  rax, gSavePix
    mov  sheetPixels, rax
    mov  eax, gSaveW
    mov  sheetW, eax
pl_weapon:
    cmp  gPView, 2
    jae  pl_done
    call DrawPlayerWeapon
    jmp  pl_done

pl_placeholder:
    lea  ecx, [rsi-6]
    lea  edx, [rdi-22]
    mov  r8d, 12
    mov  r9d, 20
    mov  r10d, C_BODY
    call FillRect
    lea  ecx, [rsi-5]
    lea  edx, [rdi-31]
    mov  r8d, 10
    mov  r9d, 9
    mov  r10d, C_HEAD
    call FillRect

pl_done:
    cmp  ghostMode, 0
    jne  pl_nobar
    lea  ecx, [rsi-21]
    lea  edx, [rdi+6]
    mov  r8d, 42
    mov  r9d, 7
    xor  r10d, r10d
    call FillRect
    lea  ecx, [rsi-20]
    lea  edx, [rdi+7]
    mov  r8d, 40
    mov  r9d, 5
    mov  r10d, 601818h
    call FillRect
    mov  eax, playerHP
    test eax, eax
    jle  pl_nobar
    imul eax, eax, 40
    xor  edx, edx
    mov  ecx, PLAYER_HP
    div  ecx
    mov  r8d, eax
    lea  ecx, [rsi-20]
    lea  edx, [rdi+7]
    mov  r9d, 5
    mov  r10d, 40D060h
    call FillRect
pl_nobar:
    pop  r14
    pop  r13
    pop  r12
    ret
DrawPlayer ENDP

DrawWallRow PROC
    push rbx
    push rsi
    push rdi
    push r12
    push r13
    mov  gWRowCur, ecx
    cmp  curHgt, 0
    je   wr_exit
    mov  eax, ecx
    imul eax, curW
    mov  gWBase, eax
    mov  eax, gC0
    mov  gWCol, eax
wr_col:
    mov  eax, gWBase
    add  eax, gWCol
    mov  rdx, curHgt
    movzx ecx, byte ptr [rdx+rax]
    test ecx, ecx
    jz   wr_next
    xor  esi, esi
    mov  r8d, gWRowCur
    inc  r8d
    cmp  r8d, curH
    jae  wr_south
    add  eax, curW
    movzx esi, byte ptr [rdx+rax]
wr_south:
    cmp  ecx, esi
    jle  wr_next
    sub  ecx, esi
    mov  gWHf, ecx
    mov  gWHs, esi
    mov  eax, gWCol
    imul eax, eax, TW
    mov  gWWorldX, eax
    sub  eax, camX
    mov  gWX0, eax
    mov  eax, gWRowCur
    inc  eax
    imul eax, eax, TH
    add  eax, OFFY
    sub  eax, camY
    sub  eax, gWHs
    sub  eax, gWHf
    mov  gWYT, eax
    mov  eax, clipT
    sub  eax, gWYT
    xor  edx, edx
    test eax, eax
    jle  wr_y0
    mov  edx, eax
wr_y0:
    mov  gWPY0, edx
    mov  eax, clipB
    sub  eax, gWYT
    cmp  eax, gWHf
    jle  wr_y1
    mov  eax, gWHf
wr_y1:
    mov  gWPY1, eax
    mov  eax, gWX0
    neg  eax
    xor  edx, edx
    test eax, eax
    jle  wr_x0
    mov  edx, eax
wr_x0:
    mov  gWPX0, edx
    mov  eax, SCRW
    sub  eax, gWX0
    cmp  eax, TW
    jle  wr_x1
    mov  eax, TW
wr_x1:
    mov  gWPX1, eax
    mov  eax, gWPX1
    cmp  eax, gWPX0
    jle  wr_next
    mov  eax, gWPY1
    cmp  eax, gWPY0
    jle  wr_next
    cmp  curTiles, 0
    je   wr_flat
    mov  gWUV, 0
    mov  eax, curWallTex
    mov  rdx, curWtx
    test rdx, rdx
    jz   wr_gt
    mov  ecx, gWBase
    add  ecx, gWCol
    movzx ecx, byte ptr [rdx+rcx]
    test ecx, ecx
    jz   wr_gt
    lea  eax, [rcx-1]
    cmp  curWuv, 0
    je   wr_gt
    mov  gWUV, 1
wr_gt:
    shl  eax, 18
    lea  r10, atlasData
    add  r10, rax
    mov  eax, gWPY0
    mov  gWPY, eax
    cmp  gWUV, 0
    jne  wr_uv
wr_line:
    mov  eax, gWPY
    sub  eax, gWHf
    imul eax, eax, 409
    shr  eax, 8
    movzx eax, al
    shl  eax, 8
    mov  r12d, eax
    mov  r13d, 100
    cmp  gWPY, 6
    jge  wr_lit
    mov  r13d, 128
wr_lit:
    mov  eax, gWWorldX
    add  eax, gWPX0
    imul esi, eax, 409
    mov  eax, gWYT
    add  eax, gWPY
    imul eax, eax, SCRW
    add  eax, gWX0
    add  eax, gWPX0
    lea  r11, pixels
    lea  r11, [r11+rax*4]
    mov  ebx, gWPX1
    sub  ebx, gWPX0
wr_px:
    mov  eax, esi
    shr  eax, 8
    movzx eax, al
    or   eax, r12d
    mov  eax, [r10+rax*4]
    mov  ecx, eax
    and  ecx, 00FF00FFh
    imul ecx, r13d
    shr  ecx, 7
    and  ecx, 00FF00FFh
    and  eax, 0000FF00h
    imul eax, r13d
    shr  eax, 7
    and  eax, 0000FF00h
    or   eax, ecx
    mov  [r11], eax
    add  r11, 4
    add  esi, 409
    dec  ebx
    jnz  wr_px
    inc  gWPY
    mov  eax, gWPY
    cmp  eax, gWPY1
    jl   wr_line
    jmp  wr_next
wr_uv:
    mov  rdx, curWuv
    mov  eax, gWBase
    add  eax, gWCol
    shl  eax, 4
    add  rdx, rax
    movzx eax, word ptr [rdx]
    mov  gWuBL, eax
    movzx eax, word ptr [rdx+2]
    mov  gWvBL, eax
    movzx eax, word ptr [rdx+4]
    mov  gWuBR, eax
    movzx eax, word ptr [rdx+6]
    mov  gWvBR, eax
    movzx eax, word ptr [rdx+8]
    mov  gWuTL, eax
    movzx eax, word ptr [rdx+10]
    mov  gWvTL, eax
    movzx eax, word ptr [rdx+12]
    mov  gWuTR, eax
    movzx eax, word ptr [rdx+14]
    mov  gWvTR, eax
wr_uvline:
    mov  eax, gWHf
    sub  eax, gWPY
    add  eax, eax
    dec  eax
    shl  eax, 14
    xor  edx, edx
    mov  ecx, gWHf
    div  ecx
    mov  r8d, eax
    mov  eax, gWuTL
    sub  eax, gWuBL
    imul eax, r8d
    sar  eax, 15
    add  eax, gWuBL
    mov  r9d, eax
    mov  eax, gWuTR
    sub  eax, gWuBR
    imul eax, r8d
    sar  eax, 15
    add  eax, gWuBR
    sub  eax, r9d
    shl  eax, 8
    cdq
    mov  ecx, TW
    idiv ecx
    mov  gWdU, eax
    shl  r9d, 8
    sar  eax, 1
    add  r9d, eax
    mov  gWU, r9d
    mov  eax, gWvTL
    sub  eax, gWvBL
    imul eax, r8d
    sar  eax, 15
    add  eax, gWvBL
    mov  r9d, eax
    mov  eax, gWvTR
    sub  eax, gWvBR
    imul eax, r8d
    sar  eax, 15
    add  eax, gWvBR
    sub  eax, r9d
    shl  eax, 8
    cdq
    idiv ecx
    mov  gWdV, eax
    shl  r9d, 8
    sar  eax, 1
    add  r9d, eax
    mov  gWV, r9d
    mov  eax, gWdU
    imul eax, gWPX0
    add  gWU, eax
    mov  eax, gWdV
    imul eax, gWPX0
    add  gWV, eax
    mov  r13d, 100
    cmp  gWPY, 6
    jge  wr_ulit
    mov  r13d, 128
wr_ulit:
    mov  eax, gWYT
    add  eax, gWPY
    imul eax, eax, SCRW
    add  eax, gWX0
    add  eax, gWPX0
    lea  r11, pixels
    lea  r11, [r11+rax*4]
    mov  ebx, gWPX1
    sub  ebx, gWPX0
wr_upx:
    mov  eax, gWU
    shr  eax, 16
    movzx eax, al
    mov  edx, gWV
    shr  edx, 16
    movzx edx, dl
    shl  edx, 8
    or   eax, edx
    mov  eax, [r10+rax*4]
    mov  ecx, eax
    and  ecx, 00FF00FFh
    imul ecx, r13d
    shr  ecx, 7
    and  ecx, 00FF00FFh
    and  eax, 0000FF00h
    imul eax, r13d
    shr  eax, 7
    and  eax, 0000FF00h
    or   eax, ecx
    mov  [r11], eax
    add  r11, 4
    mov  eax, gWdU
    add  gWU, eax
    mov  eax, gWdV
    add  gWV, eax
    dec  ebx
    jnz  wr_upx
    inc  gWPY
    mov  eax, gWPY
    cmp  eax, gWPY1
    jl   wr_uvline
    jmp  wr_next
wr_flat:
    mov  ecx, gWX0
    mov  edx, gWYT
    mov  r8d, TW
    mov  r9d, gWHf
    mov  r10d, 6E6878h
    call FillRect
    mov  ecx, gWX0
    mov  edx, gWYT
    mov  r8d, TW
    mov  r9d, 6
    mov  r10d, 9A94A8h
    call FillRect
wr_next:
    inc  gWCol
    mov  eax, gWCol
    cmp  eax, gC1
    jl   wr_col
wr_exit:
    pop  r13
    pop  r12
    pop  rdi
    pop  rsi
    pop  rbx
    ret
DrawWallRow ENDP

HurtPlayer PROC
    cmp  pAct, 6
    je   hp_ok
    sub  eax, curDef
    jg   hp_dmg
    mov  eax, 1
hp_dmg:
    sub  playerHP, eax
    mov  r8d, eax
    mov  r9d, 4
    mov  ecx, pFeetX
    sub  ecx, 10
    mov  edx, pFeetY
    sub  edx, 100
    call SpawnNum
    lea  rax, msgOuch
    mov  msgPtr, rax
    mov  rax, nowTick
    add  rax, READY_MS
    mov  pReadyUntil, rax
    cmp  playerHP, 0
    jg   hp_flinch
    mov  playerHP, 0
    mov  pAct, 6
    mov  eax, dword ptr [nowTick]
    mov  pActStart, eax
    mov  pathLen, 0
    mov  pendingEnt, 0
    lea  rax, msgDefeated
    mov  msgPtr, rax
    jmp  hp_ok
hp_flinch:
    cmp  pAct, 0
    jne  hp_ok
    mov  pAct, 5
    mov  eax, dword ptr [nowTick]
    mov  pActStart, eax
hp_ok:
    ret
HurtPlayer ENDP

DoAttackEnemy PROC
    cmp  dword ptr [rsi+24], ST_DYING
    jae  dae_done
    call StartAttack
    call Rand
    mov  r8d, eax
    xor  edx, edx
    mov  ecx, 100
    div  ecx
    mov  r9d, edx
    mov  r10d, [rsi+4]
    imul r10d, r10d, TW
    add  r10d, TW/2-10
    mov  r11d, [rsi+8]
    imul r11d, r11d, TH
    add  r11d, OFFY-75
    cmp  r9d, 5
    jb   dae_miss
    mov  eax, r8d
    shr  eax, 8
    xor  edx, edx
    mov  ecx, 31
    div  ecx
    add  edx, 85
    mov  eax, weapon
    lea  rcx, itemAtk
    mov  eax, [rcx+rax*4]
    imul eax, atkMul
    imul eax, edx
    xor  edx, edx
    mov  ecx, 10000
    div  ecx
    mov  ecx, 1
    cmp  r9d, 90
    jb   dae_apply
    lea  eax, [rax+rax*2]
    shr  eax, 1
    mov  ecx, 2
dae_apply:
    sub  [rsi+16], eax
    mov  r8d, eax
    mov  r9d, ecx
    mov  ecx, r10d
    mov  edx, r11d
    call SpawnNum
    mov  eax, dword ptr [nowTick]
    mov  [rsi+28], eax
    cmp  bindOn, 0
    je   dae_nobind
    add  eax, 2000
    mov  [rsi+72], eax
dae_nobind:
    lea  rax, msgHit
    mov  msgPtr, rax
    cmp  dword ptr [rsi+16], 0
    jg   dae_hurt
    mov  dword ptr [rsi+16], 0
    mov  dword ptr [rsi+24], ST_DYING
    mov  dword ptr [rsi+72], 0
    lea  rax, msgSlain
    mov  msgPtr, rax
    cmp  dword ptr [rsi+36], FINAL_BOSS_TYPE
    jne  dae_notfinal
    mov  rax, nowTick
    add  rax, 2400
    mov  endAt, rax
dae_notfinal:
    call SpawnDrop
    ret
dae_hurt:
    mov  dword ptr [rsi+24], ST_HURT
    ret
dae_miss:
    xor  r8d, r8d
    mov  r9d, 3
    mov  ecx, r10d
    mov  edx, r11d
    call SpawnNum
    lea  rax, msgMiss
    mov  msgPtr, rax
dae_done:
    ret
DoAttackEnemy ENDP

CellFree PROC
    call GetCell
    cmp  al, '.'
    jne  cf_no
    mov  eax, playerX
    cmp  eax, esi
    jne  cf_ent
    mov  eax, playerY
    cmp  eax, edi
    je   cf_no
cf_ent:
    call FindEntity
    test rax, rax
    jnz  cf_no
    mov  eax, 1
    ret
cf_no:
    xor  eax, eax
    ret
CellFree ENDP

SignToPlayer PROC
    mov  eax, playerX
    sub  eax, [r14+4]
    mov  ecx, eax
    sar  ecx, 31
    neg  eax
    shr  eax, 31
    add  eax, ecx
    mov  edx, playerY
    sub  edx, [r14+8]
    mov  ecx, edx
    sar  ecx, 31
    neg  edx
    shr  edx, 31
    add  edx, ecx
    ret
SignToPlayer ENDP

EnemyFace PROC
    call SignToPlayer
    lea  ecx, [rdx+1]
    imul ecx, ecx, 3
    lea  eax, [rax+rcx+1]
    lea  rdx, dirTab
    mov  eax, [rdx+rax*4]
    mov  [r14+32], eax
    ret
EnemyFace ENDP

TryStep PROC
    test r10d, r10d
    jz   ts_target
    test r11d, r11d
    jz   ts_target
    mov  esi, [r14+4]
    add  esi, r10d
    mov  edi, [r14+8]
    call GetCell
    cmp  al, '#'
    je   ts_no
    mov  esi, [r14+4]
    mov  edi, [r14+8]
    add  edi, r11d
    call GetCell
    cmp  al, '#'
    je   ts_no
ts_target:
    mov  esi, [r14+4]
    add  esi, r10d
    mov  edi, [r14+8]
    add  edi, r11d
    call CellFree
    test eax, eax
    jz   ts_no
    mov  eax, [r14+4]
    mov  [r14+48], eax
    mov  eax, [r14+8]
    mov  [r14+52], eax
    mov  [r14+4], esi
    mov  [r14+8], edi
    mov  eax, dword ptr [nowTick]
    mov  [r14+56], eax
    lea  rdx, monStepMs
    add  eax, [rdx+rbx*4]
    mov  [r14+40], eax
    lea  ecx, [r11+1]
    imul ecx, ecx, 3
    lea  eax, [r10+rcx+1]
    lea  rdx, dirTab
    mov  eax, [rdx+rax*4]
    mov  [r14+32], eax
    mov  eax, 1
    ret
ts_no:
    xor  eax, eax
    ret
TryStep ENDP

EnemyStep PROC
    call SignToPlayer
    mov  r8d, eax
    mov  r9d, edx
    mov  r10d, r8d
    mov  r11d, r9d
    call TryStep
    test eax, eax
    jnz  es_done
    mov  r10d, r8d
    xor  r11d, r11d
    test r8d, r8d
    jnz  es_c2
    mov  r10d, 1
    mov  r11d, r9d
es_c2:
    call TryStep
    test eax, eax
    jnz  es_done
    xor  r10d, r10d
    mov  r11d, r9d
    test r9d, r9d
    jnz  es_c3
    mov  r10d, r8d
    mov  r11d, 1
es_c3:
    call TryStep
es_done:
    ret
EnemyStep ENDP

UpdateEnemies PROC
    push rbx
    push rsi
    push rdi
    push r12
    push r13
    push r14
    push r15
    mov  r12d, dword ptr [nowTick]
    lea  r14, entities
    mov  r15d, ENTN
ue_loop:
    cmp  dword ptr [r14+12], 4
    jne  ue_next
    mov  eax, [r14]
    cmp  eax, curMap
    jne  ue_next
    mov  eax, [r14+72]
    sub  eax, r12d
    jg   ue_next
    mov  ebx, [r14+36]
    mov  r13d, r12d
    sub  r13d, [r14+28]
    mov  eax, [r14+24]
    cmp  eax, ST_DEAD
    je   ue_dead
    cmp  eax, ST_DYING
    je   ue_dying
    cmp  eax, ST_HURT
    je   ue_hurt
    cmp  eax, ST_ATTACK
    je   ue_attack
    mov  eax, playerX
    sub  eax, [r14+4]
    mov  ecx, eax
    sar  ecx, 31
    xor  eax, ecx
    sub  eax, ecx
    mov  edx, playerY
    sub  edx, [r14+8]
    mov  ecx, edx
    sar  ecx, 31
    xor  edx, ecx
    sub  edx, ecx
    cmp  eax, edx
    jge  ue_d
    mov  eax, edx
ue_d:
    lea  rdx, monAggro
    mov  ecx, [rdx+rbx*4]
    cmp  dword ptr [r14+24], ST_CHASE
    je   ue_chase
    cmp  eax, ecx
    jg   ue_next
    mov  dword ptr [r14+24], ST_CHASE
    mov  [r14+28], r12d
    jmp  ue_next
ue_chase:
    add  ecx, LEASH_EXTRA
    cmp  eax, ecx
    jle  ue_near
    mov  dword ptr [r14+24], ST_IDLE
    mov  [r14+28], r12d
    jmp  ue_next
ue_near:
    cmp  eax, 1
    jg   ue_move
    call EnemyFace
    mov  eax, r12d
    sub  eax, [r14+44]
    lea  rdx, monCdMs
    cmp  eax, [rdx+rbx*4]
    jb   ue_next
    mov  dword ptr [r14+24], ST_ATTACK
    mov  [r14+28], r12d
    mov  [r14+44], r12d
    lea  rdx, monAtk
    mov  eax, [rdx+rbx*4]
    call HurtPlayer
    jmp  ue_next
ue_move:
    mov  ecx, r12d
    sub  ecx, [r14+40]
    js   ue_next
    call EnemyStep
    jmp  ue_next
ue_dead:
    cmp  ebx, BOSS_TYPE
    je   ue_next
    cmp  ebx, FINAL_BOSS_TYPE
    je   ue_next
    cmp  r13d, RESPAWN_MS
    jb   ue_next
    mov  eax, [r14+20]
    mov  [r14+16], eax
    mov  eax, [r14+64]
    mov  [r14+4], eax
    mov  [r14+48], eax
    mov  eax, [r14+68]
    mov  [r14+8], eax
    mov  [r14+52], eax
    mov  dword ptr [r14+24], ST_IDLE
    mov  [r14+28], r12d
    jmp  ue_next
ue_dying:
    lea  rdx, monDieMs
    cmp  r13d, [rdx+rbx*4]
    jb   ue_next
    mov  dword ptr [r14+24], ST_DEAD
    mov  [r14+28], r12d
    jmp  ue_next
ue_hurt:
    lea  rdx, monHurtMs
    cmp  r13d, [rdx+rbx*4]
    jb   ue_next
    mov  dword ptr [r14+24], ST_CHASE
    mov  [r14+28], r12d
    jmp  ue_next
ue_attack:
    lea  rdx, monAtkMs
    cmp  r13d, [rdx+rbx*4]
    jb   ue_next
    mov  dword ptr [r14+24], ST_CHASE
    mov  [r14+28], r12d
ue_next:
    add  r14, ENTSZ
    dec  r15d
    jnz  ue_loop
    pop  r15
    pop  r14
    pop  r13
    pop  r12
    pop  rdi
    pop  rsi
    pop  rbx
    ret
UpdateEnemies ENDP

DrawMonsterCell PROC
    push rbx
    push rsi
    push rdi
    push r12
    push r13
    mov  r12d, ecx
    mov  edi, edx
    mov  r13d, r10d
    mov  eax, r9d
    imul eax, monW
    add  eax, r8d
    mov  r11, curMonPix
    lea  r11, [r11+rax*4]
    mov  ebx, MCELLH
mc_row:
    cmp  edi, SCRH
    jae  mc_next
    xor  esi, esi
mc_col:
    mov  eax, esi
    test r13d, r13d
    jz   mc_pix
    mov  eax, MCELLW-1
    sub  eax, esi
mc_pix:
    mov  eax, [r11+rax*4]
    test eax, 0FF000000h
    jz   mc_skip
    lea  edx, [r12+rsi]
    cmp  edx, SCRW
    jae  mc_skip
    imul ecx, edi, SCRW
    add  ecx, edx
    lea  rdx, pixels
    mov  [rdx+rcx*4], eax
mc_skip:
    inc  esi
    cmp  esi, MCELLW
    jb   mc_col
mc_next:
    mov  eax, monW
    lea  r11, [r11+rax*4]
    inc  edi
    dec  ebx
    jnz  mc_row
    pop  r13
    pop  r12
    pop  rdi
    pop  rsi
    pop  rbx
    ret
DrawMonsterCell ENDP

DrawEnemy PROC
    push rbx
    push r12
    push r14
    cmp  dword ptr [r13+24], ST_DEAD
    je   dm_exit
    mov  ebx, [r13+36]
    lea  rdx, monStepMs
    mov  ecx, [rdx+rbx*4]
    mov  eax, dword ptr [nowTick]
    sub  eax, [r13+56]
    cmp  eax, ecx
    jb   dm_t
    mov  eax, ecx
dm_t:
    mov  r12d, eax
    mov  eax, [r13+4]
    sub  eax, [r13+48]
    imul eax, eax, TW
    imul eax, r12d
    cdq
    idiv ecx
    mov  esi, eax
    imul eax, dword ptr [r13+48], TW
    add  esi, eax
    add  esi, TW/2
    sub  esi, camX
    mov  eax, [r13+8]
    sub  eax, [r13+52]
    imul eax, eax, TH
    imul eax, r12d
    cdq
    idiv ecx
    mov  edi, eax
    imul eax, dword ptr [r13+52], TH
    add  edi, eax
    add  edi, OFFY+TH-3
    sub  edi, camY
    lea  ecx, [rsi-24]
    lea  edx, [rdi-4]
    mov  r8d, 48
    mov  r9d, 8
    mov  r10d, C_SHADOW
    call FillRect
    lea  rdx, monSheetOf
    mov  eax, [rdx+rbx*4]
    lea  rdx, monSheetPix
    mov  rax, [rdx+rax*8]
    test rax, rax
    jnz  dm_have
    mov  rax, [rdx]
dm_have:
    mov  curMonPix, rax
    test rax, rax
    jz   dm_block
    mov  eax, [r13+24]
    xor  r14d, r14d
    cmp  eax, ST_ATTACK
    je   dm_atk
    cmp  eax, ST_HURT
    je   dm_hurt
    cmp  eax, ST_DYING
    je   dm_die
    mov  eax, dword ptr [nowTick]
    sub  eax, [r13+56]
    lea  rdx, monStepMs
    cmp  eax, [rdx+rbx*4]
    jae  dm_stand
    mov  r14d, 1
    mov  eax, dword ptr [nowTick]
    xor  edx, edx
    mov  ecx, MON_WALK_MS
    div  ecx
    jmp  dm_loop
dm_stand:
    mov  eax, dword ptr [nowTick]
    xor  edx, edx
    mov  ecx, MON_STAND_MS
    div  ecx
dm_loop:
    xor  edx, edx
    mov  ecx, 6
    div  ecx
    mov  r12d, edx
    jmp  dm_pick
dm_atk:
    mov  r14d, 2
    lea  rdx, monAtkMs
    mov  ecx, [rdx+rbx*4]
    mov  r8d, 5
    jmp  dm_prog
dm_hurt:
    mov  r14d, 3
    lea  rdx, monHurtMs
    mov  ecx, [rdx+rbx*4]
    mov  r8d, 2
    jmp  dm_prog
dm_die:
    mov  r14d, 4
    lea  rdx, monDieMs
    mov  ecx, [rdx+rbx*4]
    mov  r8d, 2
dm_prog:
    mov  eax, dword ptr [nowTick]
    sub  eax, [r13+28]
    imul eax, r8d
    xor  edx, edx
    div  ecx
    dec  r8d
    cmp  eax, r8d
    jbe  dm_f
    mov  eax, r8d
dm_f:
    mov  r12d, eax
dm_pick:
    mov  eax, [r13+32]
    lea  rdx, monView
    movzx ecx, byte ptr [rdx+rax]
    mov  r10d, ecx
    shr  r10d, 1
    and  ecx, 1
    lea  eax, [r14+r14]
    add  eax, ecx
    imul eax, eax, MCELLH
    mov  r9d, eax
    imul r8d, r12d, MCELLW
    lea  ecx, [rsi-MCELLW/2]
    lea  edx, [rdi-MCELLH]
    call DrawMonsterCell
    jmp  dm_bar
dm_block:
    lea  ecx, [rsi-14]
    lea  edx, [rdi-36]
    mov  r8d, 28
    mov  r9d, 36
    mov  r10d, C_MMENEMY
    call FillRect
dm_bar:
    mov  eax, [r13+16]
    cmp  eax, [r13+20]
    jge  dm_exit
    cmp  dword ptr [r13+24], ST_DYING
    jae  dm_exit
    lea  ecx, [rsi-20]
    lea  edx, [rdi+4]
    mov  r8d, 40
    mov  r9d, 4
    mov  r10d, C_HPBG
    call FillRect
    mov  eax, [r13+16]
    imul eax, eax, 38
    xor  edx, edx
    mov  ecx, [r13+20]
    div  ecx
    test eax, eax
    jz   dm_exit
    mov  r8d, eax
    lea  ecx, [rsi-19]
    lea  edx, [rdi+5]
    mov  r9d, 2
    mov  r10d, C_HPFG
    call FillRect
dm_exit:
    pop  r14
    pop  r12
    pop  rbx
    ret
DrawEnemy ENDP

UpdatePlayerAct PROC
    mov  eax, pAct
    test eax, eax
    jz   upa_done
    mov  ecx, dword ptr [nowTick]
    sub  ecx, pActStart
    lea  rdx, pActMs
    cmp  ecx, [rdx+rax*4]
    jb   upa_done
    cmp  eax, 6
    je   upa_done
    mov  pAct, 0
upa_done:
    ret
UpdatePlayerAct ENDP

FaceTarget PROC
    mov  eax, [rsi+4]
    sub  eax, playerX
    mov  ecx, eax
    sar  ecx, 31
    neg  eax
    shr  eax, 31
    add  eax, ecx
    mov  r8d, eax
    mov  eax, [rsi+8]
    sub  eax, playerY
    mov  ecx, eax
    sar  ecx, 31
    neg  eax
    shr  eax, 31
    add  eax, ecx
    mov  edx, eax
    mov  eax, r8d
    or   eax, edx
    jz   ft_done
    lea  ecx, [rdx+1]
    imul ecx, ecx, 3
    lea  eax, [r8+rcx+1]
    lea  rdx, dirTab
    mov  eax, [rdx+rax*4]
    mov  facing, eax
ft_done:
    ret
FaceTarget ENDP

StartAttack PROC
    call FaceTarget
    mov  eax, weapon
    lea  rdx, itemAtkAnim
    mov  eax, [rdx+rax*4]
    mov  pAtkKind, eax
    mov  pAct, 1
    mov  eax, dword ptr [nowTick]
    mov  pActStart, eax
    mov  rax, nowTick
    add  rax, READY_MS
    mov  pReadyUntil, rax
    ret
StartAttack ENDP

StartPickup PROC
    call FaceTarget
    mov  pAct, 2
    mov  eax, dword ptr [nowTick]
    mov  pActStart, eax
    ret
StartPickup ENDP

SpawnDrop PROC
    cmp  dword ptr [rsi+36], BOSS_TYPE
    je   sd_boss
    call Rand
    mov  r9d, eax
    mov  eax, r9d
    shr  eax, 24
    xor  edx, edx
    mov  ecx, FLY_CHANCE
    div  ecx
    test edx, edx
    jnz  sd_table
    mov  ecx, FLY_ID
    call HaveItem
    test eax, eax
    jnz  sd_table
    mov  ecx, FLY_ID
    jmp  sd_place
sd_table:
    mov  eax, r9d
    shr  eax, 16
    xor  edx, edx
    mov  ecx, 100
    div  ecx
    lea  r10, lootCum
    lea  r11, lootItem
    xor  ecx, ecx
sd_roll:
    cmp  dl, [r10+rcx]
    jb   sd_got
    inc  ecx
    cmp  ecx, 9
    jb   sd_roll
sd_got:
    movzx ecx, byte ptr [r11+rcx]
sd_place:
    mov  edx, [rsi+4]
    mov  r8d, [rsi+8]
    mov  r9d, [rsi]
    jmp  SpawnItemAt
SpawnDrop ENDP

sd_boss:
    call Rand
    mov  ecx, BOSS_SWORD
    test eax, 100h
    jz   sb_a
    mov  ecx, BOSS_AXE
sb_a:
    mov  edx, [rsi+4]
    mov  r8d, [rsi+8]
    mov  r9d, [rsi]
    call SpawnItemAt
    mov  ecx, 8
    mov  edx, [rsi+4]
    mov  r8d, [rsi+8]
    mov  r9d, [rsi]
    call SpawnItemAt
    mov  ecx, 9
    mov  edx, [rsi+4]
    mov  r8d, [rsi+8]
    mov  r9d, [rsi]
    jmp  SpawnItemAt

DrawDrop PROC
    push rbx
    push r12
    mov  eax, dword ptr [nowTick]
    sub  eax, [r13+28]
    mov  ebx, eax
    cmp  ebx, DROP_POP_MS
    jb   dd_t
    mov  ebx, DROP_POP_MS
dd_t:
    mov  eax, [r13+4]
    sub  eax, [r13+48]
    imul eax, eax, TW
    imul eax, ebx
    cdq
    mov  ecx, DROP_POP_MS
    idiv ecx
    mov  esi, eax
    imul eax, dword ptr [r13+48], TW
    add  esi, eax
    add  esi, TW/2
    sub  esi, camX
    mov  eax, [r13+8]
    sub  eax, [r13+52]
    imul eax, eax, TH
    imul eax, ebx
    cdq
    idiv ecx
    mov  edi, eax
    imul eax, dword ptr [r13+52], TH
    add  edi, eax
    add  edi, OFFY+TH-3
    sub  edi, camY
    mov  eax, dword ptr [nowTick]
    sub  eax, [r13+28]
    cmp  eax, DROP_POP_MS
    jae  dd_bob
    mov  ecx, DROP_POP_MS
    sub  ecx, eax
    imul eax, ecx
    imul eax, eax, DROP_ARC4
    xor  edx, edx
    mov  ecx, DROP_POP_MS*DROP_POP_MS
    div  ecx
    mov  r12d, eax
    jmp  dd_draw
dd_bob:
    sub  eax, DROP_POP_MS
    xor  edx, edx
    mov  ecx, 40
    div  ecx
    xor  edx, edx
    mov  ecx, 24
    div  ecx
    mov  eax, edx
    cmp  eax, 12
    jb   dd_up
    mov  ecx, 24
    sub  ecx, eax
    mov  eax, ecx
dd_up:
    shr  eax, 1
    mov  r12d, eax
dd_draw:
    lea  ecx, [rsi-10]
    lea  edx, [rdi-2]
    mov  r8d, 20
    mov  r9d, 5
    mov  r10d, C_SHADOW
    call FillRect
    lea  ecx, [rsi-9]
    mov  edx, edi
    sub  edx, r12d
    sub  edx, 22
    mov  r8d, 18
    mov  r9d, 18
    xor  r10d, r10d
    call FillRect
    mov  eax, [r13+16]
    lea  rdx, itemColor
    mov  r10d, [rdx+rax*4]
    lea  ecx, [rsi-8]
    mov  edx, edi
    sub  edx, r12d
    sub  edx, 21
    mov  r8d, 16
    mov  r9d, 16
    call FillRect
    pop  r12
    pop  rbx
    ret
DrawDrop ENDP

EntityAtPixel PROC
    lea  rax, entities
    mov  r8d, ENTN
ep_loop:
    mov  r9d, [rax]
    cmp  r9d, curMap
    jne  ep_next
    cmp  dword ptr [rax+12], 4
    jne  ep_alive
    cmp  dword ptr [rax+24], ST_DEAD
    je   ep_next
ep_alive:
    imul r9d, dword ptr [rax+4], TW
    add  r9d, TW/2-28
    sub  r9d, camX
    mov  r10d, ecx
    sub  r10d, r9d
    cmp  r10d, 56
    jae  ep_next
    imul r9d, dword ptr [rax+8], TH
    add  r9d, OFFY+TH-3-76
    sub  r9d, camY
    mov  r10d, edx
    sub  r10d, r9d
    cmp  r10d, 82
    jae  ep_next
    ret
ep_next:
    add  rax, ENTSZ
    dec  r8d
    jnz  ep_loop
    xor  eax, eax
    ret
EntityAtPixel ENDP

Interact PROC
    mov  ecx, 1000
    mov  eax, [rsi+12]
    cmp  eax, 2
    je   in_fast
    cmp  eax, 4
    je   in_fast
    cmp  eax, 5
    jne  in_cd
    mov  ecx, ASPD
    jmp  in_cd
in_fast:
    mov  ecx, curCd
in_cd:
    mov  rax, nowTick
    sub  rax, lastAct
    cmp  rax, rcx
    jb   in_ret
    mov  rax, nowTick
    mov  lastAct, rax
    mov  eax, [rsi+12]
    cmp  eax, 1
    je   in_smith
    cmp  eax, 2
    je   in_dummy
    cmp  eax, 4
    je   in_enemy
    cmp  eax, 5
    je   in_drop
    cmp  eax, 6
    je   in_fire
    lea  rax, msgSage
    mov  dlgPtr, rax
    mov  dlgEnt, rsi
    ret
in_smith:
    mov  eax, giveCount
    cmp  eax, 0
    je   in_knife
    cmp  eax, 1
    je   in_sword
    lea  rax, msgNoMore
    mov  dlgPtr, rax
    mov  dlgEnt, rsi
    ret
in_knife:
    mov  eax, 2
    call AddToBag
    mov  giveCount, 1
    lea  rax, msgKnife
    mov  dlgPtr, rax
    mov  dlgEnt, rsi
    ret
in_sword:
    mov  eax, 4
    call AddToBag
    mov  giveCount, 2
    lea  rax, msgSword
    mov  dlgPtr, rax
    mov  dlgEnt, rsi
    ret
in_enemy:
    cmp  weapon, 0
    jne  in_ehas
    lea  rax, msgNeedWpn
    mov  msgPtr, rax
    ret
in_ehas:
    mov  eax, [rsi+4]
    sub  eax, playerX
    inc  eax
    cmp  eax, 2
    ja   in_efar
    mov  eax, [rsi+8]
    sub  eax, playerY
    inc  eax
    cmp  eax, 2
    ja   in_efar
    call DoAttackEnemy
    ret
in_efar:
    lea  rax, msgTooFarE
    mov  msgPtr, rax
    ret
in_drop:
    mov  eax, [rsi+4]
    sub  eax, playerX
    inc  eax
    cmp  eax, 2
    ja   in_dfar
    mov  eax, [rsi+8]
    sub  eax, playerY
    inc  eax
    cmp  eax, 2
    ja   in_dfar
    mov  eax, [rsi+16]
    call AddToBag
    test eax, eax
    jz   in_bagfull
    call StartPickup
    mov  dword ptr [rsi], -1
    inc  lootCount
    mov  eax, [rsi+16]
    lea  rdx, pickMsgs
    mov  rax, [rdx+rax*8]
    mov  msgPtr, rax
    ret
in_bagfull:
    lea  rax, msgBagFull
    mov  msgPtr, rax
    ret
in_dfar:
    lea  rax, msgTooFarD
    mov  msgPtr, rax
    ret
in_fire:
    cmp  restOn, 0
    jne  in_fret
    mov  eax, [rsi+4]
    sub  eax, playerX
    inc  eax
    cmp  eax, 2
    ja   in_ffar
    mov  eax, [rsi+8]
    sub  eax, playerY
    inc  eax
    cmp  eax, 2
    ja   in_ffar
    cmp  dword ptr [rsi+24], 1
    je   in_fout
    cmp  playerHP, PLAYER_HP
    jge  in_ffull
    mov  restOn, 1
    mov  rax, nowTick
    mov  restStart, rax
    mov  eax, playerHP
    mov  restHP0, eax
    mov  restLastHP, eax
    mov  eax, playerX
    mov  restX, eax
    mov  eax, playerY
    mov  restY, eax
    mov  restEnt, rsi
    lea  rax, msgRest
    mov  msgPtr, rax
in_fret:
    ret
in_ffar:
    lea  rax, msgTooFarD
    mov  msgPtr, rax
    ret
in_fout:
    lea  rax, msgFireOut
    mov  msgPtr, rax
    ret
in_ffull:
    lea  rax, msgNotHurt
    mov  msgPtr, rax
    ret
in_dummy:
    cmp  weapon, 0
    jne  in_hit
    lea  rax, msgNeedWpn
    mov  msgPtr, rax
    ret
in_hit:
    call DoAttack
in_ret:
    ret
Interact ENDP

ChangeMap PROC
    cmp  eax, NMAPS
    jae  cm_bad
    lea  rdx, mapLoaded
    cmp  dword ptr [rdx+rax*4], 0
    jne  cm_go
cm_bad:
    lea  rax, msgNoField
    mov  msgPtr, rax
    ret
cm_go:
    mov  r8d, curMap
    mov  curMap, eax
    call SetMap
    add  r8b, '0'
    mov  r10, curBase
    mov  r11d, curW
    imul r11d, curH
    xor  ecx, ecx
cm_scan:
    cmp  byte ptr [r10+rcx], r8b
    je   cm_found
    inc  ecx
    cmp  ecx, r11d
    jb   cm_scan
    sub  r8b, '0'
    mov  curMap, r8d
    call SetMap
    ret
cm_found:
    mov  eax, ecx
    xor  edx, edx
    mov  r9d, curW
    div  r9d
    mov  r11d, edx
    mov  r9d, eax
    lea  r8, neigh
    mov  ecx, 4
cm_n:
    mov  eax, r9d
    add  eax, [r8+4]
    imul eax, curW
    add  eax, r11d
    add  eax, [r8]
    cmp  byte ptr [r10+rax], '.'
    je   cm_place
    add  r8, 8
    dec  ecx
    jnz  cm_n
    ret
cm_place:
    mov  edx, r11d
    add  edx, [r8]
    mov  playerX, edx
    mov  edx, r9d
    add  edx, [r8+4]
    mov  playerY, edx
    mov  eax, playerX
    mov  stepFromX, eax
    mov  eax, playerY
    mov  stepFromY, eax
    mov  stepStart, 0
    mov  pathLen, 0
    mov  pathPos, 0
    mov  pendingEnt, 0
    mov  dlgEnt, 0
    mov  dlgPtr, 0
    lea  rax, msgEmpty
    mov  msgPtr, rax
    ret
ChangeMap ENDP

DrawEntity PROC
    cmp  dword ptr [r13+12], 4
    je   DrawEnemy
    cmp  dword ptr [r13+12], 5
    je   DrawDrop
    cmp  dword ptr [r13+12], 6
    je   DrawCampfire
    cmp  dword ptr [r13+12], 1
    jne  de_nosmith
    cmp  bsPixels, 0
    je   de_nosmith
    jmp  DrawBlacksmith
de_nosmith:
    imul esi, dword ptr [r13+4], TW
    add  esi, TW/2
    sub  esi, camX
    imul edi, dword ptr [r13+8], TH
    add  edi, OFFY+TH-3
    sub  edi, camY
    lea  ecx, [rsi-10]
    lea  edx, [rdi-2]
    mov  r8d, 20
    mov  r9d, 4
    mov  r10d, C_SHADOW
    call FillRect
    mov  eax, [r13+12]
    cmp  eax, 2
    je   de_dummy
    mov  r10d, C_SMITH
    cmp  eax, 3
    jne  de_body
    mov  r10d, C_SAGE
de_body:
    lea  ecx, [rsi-6]
    lea  edx, [rdi-22]
    mov  r8d, 12
    mov  r9d, 20
    call FillRect
    lea  ecx, [rsi-5]
    lea  edx, [rdi-31]
    mov  r8d, 10
    mov  r9d, 9
    mov  r10d, C_SKIN
    call FillRect
    ret
de_dummy:
    lea  ecx, [rsi-2]
    lea  edx, [rdi-34]
    mov  r8d, 4
    mov  r9d, 34
    mov  r10d, C_WOOD
    call FillRect
    lea  ecx, [rsi-12]
    lea  edx, [rdi-30]
    mov  r8d, 24
    mov  r9d, 12
    mov  r10d, C_STRAW
    call FillRect
    lea  ecx, [rsi-5]
    lea  edx, [rdi-40]
    mov  r8d, 10
    mov  r9d, 8
    call FillRect
    lea  ecx, [rsi-16]
    lea  edx, [rdi+3]
    mov  r8d, 32
    mov  r9d, 4
    mov  r10d, C_HPBG
    call FillRect
    mov  eax, dummyHP
    imul eax, eax, 30
    xor  edx, edx
    mov  ecx, MAXHP
    div  ecx
    test eax, eax
    jz   de_done
    mov  r8d, eax
    lea  ecx, [rsi-15]
    lea  edx, [rdi+4]
    mov  r9d, 2
    mov  r10d, C_HPFG
    call FillRect
de_done:
    ret
DrawEntity ENDP

DrawEntPass PROC
    push r13
    push r14
    push r15
    mov  r15d, ecx
    lea  r13, entities
    mov  r14d, ENTN
dp_loop:
    mov  eax, [r13]
    cmp  eax, curMap
    jne  dp_next
    mov  eax, [r13+8]
    cmp  eax, playerY
    jg   dp_after
    test r15d, r15d
    jnz  dp_next
    call DrawEntity
    jmp  dp_next
dp_after:
    test r15d, r15d
    jz   dp_next
    call DrawEntity
dp_next:
    add  r13, ENTSZ
    dec  r14d
    jnz  dp_loop
    pop  r15
    pop  r14
    pop  r13
    ret
DrawEntPass ENDP

GetCell PROC
    cmp  esi, 0
    jl   gc_out
    cmp  esi, curW
    jge  gc_out
    cmp  edi, 0
    jl   gc_out
    cmp  edi, curH
    jge  gc_out
    mov  eax, edi
    imul eax, curW
    add  eax, esi
    mov  rdx, curBase
    movzx eax, byte ptr [rdx+rax]
    ret
gc_out:
    mov  eax, '#'
    ret
GetCell ENDP

LoadSheet PROC
    push rbx
    sub  rsp, 64
    lea  rcx, sheetName
    mov  edx, 80000000h
    mov  r8d, 1
    xor  r9d, r9d
    mov  dword ptr [rsp+32], 3
    mov  dword ptr [rsp+40], 80h
    mov  qword ptr [rsp+48], 0
    call CreateFileA
    cmp  rax, -1
    je   ls_done
    mov  rbx, rax
    mov  rcx, rbx
    lea  rdx, sheetFile
    mov  r8d, 5000000
    lea  r9, bytesRead
    mov  qword ptr [rsp+32], 0
    call ReadFile
    mov  rcx, rbx
    call CloseHandle
    lea  rax, sheetFile
    cmp  word ptr [rax], 4D42h
    jne  ls_done
    cmp  word ptr [rax+28], 32
    jne  ls_done
    cmp  dword ptr [rax+22], 0
    jge  ls_done
    mov  ecx, [rax+18]
    mov  sheetW, ecx
    mov  ecx, [rax+10]
    add  rax, rcx
    mov  sheetPixels, rax
ls_done:
    add  rsp, 64
    pop  rbx
    ret
LoadSheet ENDP

DrawSprite PROC
    push rbx
    push rsi
    push rdi
    push r12
    push r13
    mov  r12d, ecx
    mov  edi, edx
    mov  r13d, r10d
    mov  eax, r9d
    imul eax, sheetW
    add  eax, r8d
    mov  r11, sheetPixels
    lea  r11, [r11+rax*4]
    mov  ebx, sprCH
ds_row:
    cmp  edi, SCRH
    jae  ds_nextrow
    xor  esi, esi
ds_col:
    mov  eax, esi
    test r13d, r13d
    jz   ds_pix
    mov  eax, sprCW
    dec  eax
    sub  eax, esi
ds_pix:
    mov  eax, [r11+rax*4]
    test eax, 0FF000000h
    jz   ds_skip
    lea  edx, [r12+rsi]
    cmp  edx, SCRW
    jae  ds_skip
    imul ecx, edi, SCRW
    add  ecx, edx
    lea  rdx, pixels
    cmp  ghostMode, 0
    je   ds_put
    mov  r8d, [rdx+rcx*4]
    shr  r8d, 1
    and  r8d, 7F7F7Fh
    shr  eax, 1
    and  eax, 7F7F7Fh
    add  eax, r8d
ds_put:
    mov  [rdx+rcx*4], eax
ds_skip:
    inc  esi
    cmp  esi, sprCW
    jb   ds_col
ds_nextrow:
    mov  eax, sheetW
    lea  r11, [r11+rax*4]
    inc  edi
    dec  ebx
    jnz  ds_row
    pop  r13
    pop  r12
    pop  rdi
    pop  rsi
    pop  rbx
    ret
DrawSprite ENDP

Render PROC
    push r12
    push r13
    push r14
    push r15
    push rbx
    call UpdatePlayerVisual
    mov  clipT, 0
    mov  clipB, SCRH
    xor  ecx, ecx
    xor  edx, edx
    mov  r8d, SCRW
    mov  r9d, SCRH
    mov  r10d, C_BG
    call FillRect
    mov  clipT, OFFY
    mov  clipB, OFFY+VIEWH
    xor  ecx, ecx
    mov  edx, OFFY
    mov  r8d, SCRW
    mov  r9d, VIEWH
    mov  r10d, C_LINE
    call FillRect

    mov  r12, curBase
    mov  eax, camX
    xor  edx, edx
    mov  ecx, TW
    div  ecx
    mov  r13d, eax
    mov  eax, camX
    add  eax, SCRW-1
    xor  edx, edx
    mov  ecx, TW
    div  ecx
    inc  eax
    cmp  eax, curW
    jbe  rn_ce
    mov  eax, curW
rn_ce:
    mov  r15d, eax
    mov  eax, camY
    xor  edx, edx
    mov  ecx, TH
    div  ecx
    mov  r14d, eax
    mov  eax, camY
    add  eax, VIEWH-1
    xor  edx, edx
    mov  ecx, TH
    div  ecx
    inc  eax
    cmp  eax, curH
    jbe  rn_re
    mov  eax, curH
rn_re:
    mov  ebx, eax

    mov  gC0, r13d
    mov  gC1, r15d
    mov  gWR0, r14d
    mov  eax, ebx
    add  eax, curRowExtra
    cmp  eax, curH
    jbe  rn_wr
    mov  eax, curH
rn_wr:
    mov  gWR1, eax
    cmp  curTiles, 0
    je   rn_flat
    mov  gC0, r13d
    mov  gC1, r15d
    mov  gR0, r14d
    mov  gR1, ebx
    call DrawGround
    jmp  rn_tiles_done
rn_flat:
    mov  esi, r14d
rn_row:
    mov  edi, r13d
rn_col:
    mov  eax, esi
    imul eax, curW
    add  eax, edi
    mov  r11d, eax
    movzx eax, byte ptr [r12+rax]
    mov  r10d, C_FLOOR
    cmp  al, '.'
    jne  rn_notfloor
    cmp  curColors, 0
    je   rn_draw
    mov  rdx, curColors
    mov  r10d, [rdx+r11*4]
    jmp  rn_draw
rn_notfloor:
    mov  r10d, C_WALL
    cmp  al, '#'
    jne  rn_isexit
    cmp  curColors, 0
    je   rn_draw
    mov  rdx, curColors
    mov  r10d, [rdx+r11*4]
    shr  r10d, 1
    and  r10d, 7F7F7Fh
    jmp  rn_draw
rn_isexit:
    mov  r10d, C_EXIT
rn_draw:
    imul ecx, edi, TW
    sub  ecx, camX
    imul edx, esi, TH
    add  edx, OFFY
    sub  edx, camY
    mov  r8d, TW-1
    mov  r9d, TH-1
    call FillRect
    inc  edi
    cmp  edi, r15d
    jb   rn_col
    inc  esi
    cmp  esi, ebx
    jb   rn_row
rn_tiles_done:
    xor  ecx, ecx
    mov  edx, curNFloor
    call DrawProps
    call DrawFireZones

    lea  rsi, warps
    mov  edi, WARPN
rw_loop:
    mov  eax, [rsi]
    cmp  eax, curMap
    jne  rw_next
    mov  eax, [rsi+4]
    sub  eax, WARP_R
    imul eax, eax, TW
    sub  eax, camX
    mov  r13d, eax
    mov  eax, [rsi+8]
    sub  eax, WARP_R
    imul eax, eax, TH
    add  eax, OFFY
    sub  eax, camY
    mov  r14d, eax
    mov  r10d, 705020h
    mov  rax, nowTick
    test eax, 100h
    jz   rw_glow
    mov  r10d, 7F7040h
rw_glow:
    mov  ecx, r13d
    mov  edx, r14d
    mov  r8d, (WARP_R*2+1)*TW
    mov  r9d, (WARP_R*2+1)*TH
    call TintRect
    mov  r10d, C_EXIT
    mov  ecx, r13d
    mov  edx, r14d
    mov  r8d, (WARP_R*2+1)*TW
    mov  r9d, 3
    call FillRect
    mov  ecx, r13d
    lea  edx, [r14+(WARP_R*2+1)*TH-3]
    mov  r8d, (WARP_R*2+1)*TW
    mov  r9d, 3
    call FillRect
    mov  ecx, r13d
    mov  edx, r14d
    mov  r8d, 3
    mov  r9d, (WARP_R*2+1)*TH
    call FillRect
    lea  ecx, [r13+(WARP_R*2+1)*TW-3]
    mov  edx, r14d
    mov  r8d, 3
    mov  r9d, (WARP_R*2+1)*TH
    call FillRect
    xor  r10d, r10d
    lea  ecx, [r13+WARP_R*TW+TW/2-16]
    lea  edx, [r14+WARP_R*TH+TH/2-10]
    mov  r8d, 32
    mov  r9d, 20
    call FillRect
    mov  r10d, C_EXIT
    mov  rax, nowTick
    test eax, 100h
    jz   rw_dim
    mov  r10d, 0FFE080h
rw_dim:
    lea  ecx, [r13+WARP_R*TW+TW/2-14]
    lea  edx, [r14+WARP_R*TH+TH/2-8]
    mov  r8d, 28
    mov  r9d, 16
    call FillRect
rw_next:
    add  rsi, 24
    dec  edi
    jnz  rw_loop
    mov  eax, gWR0
    sub  eax, curRowBehind
    jns  wl_first
    xor  eax, eax
wl_first:
    mov  gWLoop, eax
wl_row:
    mov  ecx, gWLoop
    call DrawWallRow
    cmp  curProp, 0
    je   wl_noprop
    mov  rax, propRows
    mov  ecx, gWLoop
    mov  edx, [rax+rcx*4+4]
    mov  ecx, [rax+rcx*4]
    call DrawProps
wl_noprop:
    mov  ecx, gWLoop
    call DrawEntRow
    mov  eax, gWLoop
    cmp  eax, playerY
    jne  wl_nopl
    mov  ghostMode, 0
    call DrawPlayer
wl_nopl:
    inc  gWLoop
    mov  eax, gWLoop
    cmp  eax, gWR1
    jl   wl_row
    mov  clipT, 0
    mov  clipB, SCRH
    mov  ghostMode, 1
    call DrawPlayer
    mov  ghostMode, 0
    pop  rbx
    pop  r15
    pop  r14
    pop  r13
    pop  r12
    ret
Render ENDP

TextAt PROC
    push rbx
    push rsi
    push rdi
    sub  rsp, 48
    mov  esi, ecx
    mov  edi, edx
    mov  rbx, r8
    mov  rcx, hDC
    mov  edx, r9d
    call SetTextColor
    xor  ecx, ecx
ta_len:
    cmp  byte ptr [rbx+rcx], 0
    je   ta_go
    inc  ecx
    jmp  ta_len
ta_go:
    mov  dword ptr [rsp+32], ecx
    mov  rcx, hDC
    mov  edx, esi
    mov  r8d, edi
    mov  r9, rbx
    call TextOutA
    add  rsp, 48
    pop  rdi
    pop  rsi
    pop  rbx
    ret
TextAt ENDP

DrawHud PROC
    sub  rsp, 40
    mov  eax, curMap
    lea  rdx, mapNames
    mov  r8, [rdx+rax*8]
    mov  ecx, 8
    mov  edx, 6
    mov  r9d, 0FFFFFFh
    call TextAt

    lea  r8, strWeapon
    mov  ecx, 430
    mov  edx, 6
    mov  r9d, 0B0B0B0h
    call TextAt
    mov  eax, weapon
    lea  rdx, itemNames
    mov  r8, [rdx+rax*8]
    mov  ecx, 495
    mov  edx, 6
    mov  r9d, 1F9AFFh
    call TextAt

    lea  r8, strHP
    mov  ecx, 330
    mov  edx, 6
    mov  r9d, 0B0B0B0h
    call TextAt
    mov  eax, playerHP
    call U32ToStr
    mov  r8, rax
    mov  ecx, 362
    mov  edx, 6
    mov  r9d, 0FFFFFFh
    call TextAt
    lea  r8, strLoot
    mov  ecx, 640
    mov  edx, 6
    mov  r9d, 0B0B0B0h
    call TextAt
    mov  eax, lootCount
    call U32ToStr
    mov  r8, rax
    mov  ecx, 685
    mov  edx, 6
    mov  r9d, 0FFFFFFh
    call TextAt
    cmp  curMap, 0
    jne  hud_msg
    lea  r8, strDummy
    mov  ecx, 200
    mov  edx, 6
    mov  r9d, 0B0B0B0h
    call TextAt
    mov  eax, dummyHP
    call U32ToStr
    mov  r8, rax
    mov  ecx, 270
    mov  edx, 6
    mov  r9d, 0FFFFFFh
    call TextAt
hud_msg:
    mov  r8, msgPtr
    mov  ecx, 8
    mov  edx, 662
    mov  r9d, 0FFFFFFh
    call TextAt
    lea  r8, strHint
    mov  ecx, 8
    mov  edx, 686
    mov  r9d, 0A0A0A0h
    call TextAt
IF DEBUG_MOUSE
    mov  eax, dword ptr [mousePt]
    test eax, eax
    jns  dbg_xpos
    lea  r8, strMinus
    mov  ecx, 680
    mov  edx, 6
    mov  r9d, 0A0A0A0h
    call TextAt
    mov  eax, dword ptr [mousePt]
    neg  eax
dbg_xpos:
    call U32ToStr
    mov  r8, rax
    mov  ecx, 690
    mov  edx, 6
    mov  r9d, 0A0A0A0h
    call TextAt
    mov  eax, dword ptr [mousePt+4]
    test eax, eax
    jns  dbg_ypos
    lea  r8, strMinus
    mov  ecx, 730
    mov  edx, 6
    mov  r9d, 0A0A0A0h
    call TextAt
    mov  eax, dword ptr [mousePt+4]
    neg  eax
dbg_ypos:
    call U32ToStr
    mov  r8, rax
    mov  ecx, 740
    mov  edx, 6
    mov  r9d, 0A0A0A0h
    call TextAt
    mov  rax, curCursor
    cmp  rax, hHand
    jne  dbg_done
    lea  r8, strHand
    mov  ecx, 630
    mov  edx, 6
    mov  r9d, 1F9AFFh
    call TextAt
dbg_done:
ENDIF
    add  rsp, 40
    ret
DrawHud ENDP

DrawNums PROC
    push rbx
    push rsi
    push rdi
    push r12
    sub  rsp, 8
    lea  rbx, slots
    mov  esi, 8
dn_loop:
    mov  eax, [rbx+20]
    test eax, eax
    jz   dn_next
    mov  rax, nowTick
    sub  rax, [rbx]
    cmp  rax, 900
    ja   dn_kill
    xor  edx, edx
    mov  ecx, 20
    div  ecx
    mov  r12d, eax
    cmp  dword ptr [rbx+20], 3
    je   dn_missstr
    mov  eax, [rbx+16]
    call U32ToStr
    mov  rdi, rax
    jmp  dn_draw
dn_missstr:
    lea  rdi, strMissNum
dn_draw:
    mov  ecx, [rbx+8]
    sub  ecx, camX
    inc  ecx
    mov  edx, [rbx+12]
    sub  edx, camY
    sub  edx, r12d
    inc  edx
    mov  r8, rdi
    xor  r9d, r9d
    call TextAt
    mov  ecx, [rbx+8]
    sub  ecx, camX
    mov  edx, [rbx+12]
    sub  edx, camY
    sub  edx, r12d
    mov  r8, rdi
    mov  r9d, 0FFFFFFh
    cmp  dword ptr [rbx+20], 2
    jne  dn_c3
    mov  r9d, 1F9AFFh
dn_c3:
    cmp  dword ptr [rbx+20], 3
    jne  dn_c4
    mov  r9d, 0B0B0B0h
dn_c4:
    cmp  dword ptr [rbx+20], 4
    jne  dn_go
    mov  r9d, 4040FFh
dn_go:
    call TextAt
    jmp  dn_next
dn_kill:
    mov  dword ptr [rbx+20], 0
dn_next:
    add  rbx, 24
    dec  esi
    jnz  dn_loop
    add  rsp, 8
    pop  r12
    pop  rdi
    pop  rsi
    pop  rbx
    ret
DrawNums ENDP

RecalcStats PROC
    mov  eax, eqWpn
    xor  r8d, r8d
    test eax, eax
    js   rs_w
    lea  rdx, bag
    mov  r8d, [rdx+rax*4]
rs_w:
    mov  weapon, r8d
    mov  curCd, ASPD
    test r8d, r8d
    jz   rs_a
    lea  rdx, itemCd
    mov  eax, [rdx+r8*4]
    mov  curCd, eax
rs_a:
    mov  eax, eqArm
    xor  r8d, r8d
    test eax, eax
    js   rs_a2
    lea  rdx, bag
    mov  r8d, [rdx+rax*4]
rs_a2:
    mov  armorId, r8d
    lea  rdx, itemDef
    mov  eax, [rdx+r8*4]
    mov  curDef, eax
    mov  eax, sharpPct
    add  eax, 100
    mov  atkMul, eax
    ret
RecalcStats ENDP

AddToBag PROC
    mov  r8d, eax
    lea  rdx, itemStack
    mov  r9d, [rdx+r8*4]
    cmp  r9d, 1
    jbe  ab_empty
    lea  r10, bag
    lea  r11, bagQty
    xor  ecx, ecx
ab_stack:
    cmp  [r10+rcx*4], r8d
    jne  ab_sn
    cmp  [r11+rcx*4], r9d
    jae  ab_sn
    inc  dword ptr [r11+rcx*4]
    mov  eax, 1
    ret
ab_sn:
    inc  ecx
    cmp  ecx, BAGN
    jb   ab_stack
ab_empty:
    lea  r10, bag
    xor  ecx, ecx
ab_find:
    cmp  dword ptr [r10+rcx*4], 0
    je   ab_put
    inc  ecx
    cmp  ecx, BAGN
    jb   ab_find
    xor  eax, eax
    ret
ab_put:
    mov  [r10+rcx*4], r8d
    lea  r11, bagQty
    mov  dword ptr [r11+rcx*4], 1
    lea  rdx, itemKind
    mov  eax, [rdx+r8*4]
    cmp  eax, 2
    jne  ab_arm
    cmp  eqWpn, -1
    jne  ab_done
    mov  eqWpn, ecx
    jmp  ab_done
ab_arm:
    cmp  eax, 3
    jne  ab_done
    cmp  eqArm, -1
    jne  ab_done
    mov  eqArm, ecx
ab_done:
    call RecalcStats
    mov  eax, 1
    ret
AddToBag ENDP

SwapSlots PROC
    lea  r8, bag
    mov  eax, [r8+rcx*4]
    xchg eax, [r8+rdx*4]
    mov  [r8+rcx*4], eax
    lea  r8, bagQty
    mov  eax, [r8+rcx*4]
    xchg eax, [r8+rdx*4]
    mov  [r8+rcx*4], eax
    mov  eax, eqWpn
    cmp  eax, ecx
    jne  sw_w1
    mov  eqWpn, edx
    jmp  sw_arm
sw_w1:
    cmp  eax, edx
    jne  sw_arm
    mov  eqWpn, ecx
sw_arm:
    mov  eax, eqArm
    cmp  eax, ecx
    jne  sw_a1
    mov  eqArm, edx
    jmp  sw_done
sw_a1:
    cmp  eax, edx
    jne  sw_done
    mov  eqArm, ecx
sw_done:
    ret
SwapSlots ENDP

UseSlot PROC
    lea  rdx, bag
    mov  eax, [rdx+rcx*4]
    test eax, eax
    jz   us_ret
    mov  r8d, eax
    lea  rdx, itemKind
    mov  eax, [rdx+r8*4]
    cmp  eax, 1
    je   us_heal
    cmp  eax, 2
    je   us_weapon
    cmp  eax, 3
    je   us_armor
    cmp  eax, 4
    je   us_scroll
    cmp  eax, 5
    je   us_fly
us_ret:
    ret
us_fly:
    cmp  pAct, 6
    je   us_ret
    call RandomSpot
    test eax, eax
    jz   us_nospot
    call TeleportTo
    lea  rax, msgFly
    mov  msgPtr, rax
    ret
us_nospot:
    lea  rax, msgNoSpot
    mov  msgPtr, rax
    ret
us_heal:
    cmp  pAct, 6
    je   us_ret
    mov  eax, playerHP
    cmp  eax, PLAYER_HP
    jae  us_full
    add  eax, 30
    cmp  eax, PLAYER_HP
    jbe  us_h1
    mov  eax, PLAYER_HP
us_h1:
    mov  playerHP, eax
    lea  rax, msgHealed
    mov  msgPtr, rax
    jmp  us_consume
us_full:
    lea  rax, msgFullHP
    mov  msgPtr, rax
    ret
us_weapon:
    cmp  eqWpn, ecx
    jne  us_w_on
    mov  eqWpn, -1
    jmp  us_recalc
us_w_on:
    mov  eqWpn, ecx
    jmp  us_recalc
us_armor:
    cmp  eqArm, ecx
    jne  us_a_on
    mov  eqArm, -1
    jmp  us_recalc
us_a_on:
    mov  eqArm, ecx
us_recalc:
    call RecalcStats
    ret
us_scroll:
    cmp  r8d, 8
    je   us_sharp
    cmp  bindOn, 0
    jne  us_already
    mov  bindOn, 1
    lea  rax, msgBind
    mov  msgPtr, rax
    jmp  us_consume
us_already:
    lea  rax, msgAlready
    mov  msgPtr, rax
    ret
us_sharp:
    add  sharpPct, 2
    lea  rax, msgSharp
    mov  msgPtr, rax
us_consume:
    lea  rdx, bagQty
    dec  dword ptr [rdx+rcx*4]
    jnz  us_done
    lea  rdx, bag
    mov  dword ptr [rdx+rcx*4], 0
    cmp  eqWpn, ecx
    jne  us_c2
    mov  eqWpn, -1
us_c2:
    cmp  eqArm, ecx
    jne  us_done
    mov  eqArm, -1
us_done:
    call RecalcStats
    ret
UseSlot ENDP

BagSlotAt PROC
    sub  ecx, GRID_X
    js   bs_none
    sub  edx, GRID_Y
    js   bs_none
    mov  r8d, edx
    mov  eax, ecx
    xor  edx, edx
    mov  ecx, SLOT_PX+SLOT_GAP
    div  ecx
    cmp  eax, 3
    ja   bs_none
    cmp  edx, SLOT_PX
    jae  bs_none
    mov  r9d, eax
    mov  eax, r8d
    xor  edx, edx
    mov  ecx, SLOT_PX+SLOT_ROWGAP
    div  ecx
    cmp  eax, 1
    ja   bs_none
    cmp  edx, SLOT_PX
    jae  bs_none
    lea  eax, [r9+rax*4]
    ret
bs_none:
    mov  eax, -1
    ret
BagSlotAt ENDP

BagInput PROC
    push rbx
    push rsi
    push rdi
    push r12
    push r13
    sub  rsp, 48
    call GetForegroundWindow
    xor  ebx, ebx
    cmp  rax, hWnd
    jne  bi_keysdone
    xor  esi, esi
bi_fk:
    lea  ecx, [rsi+70h]
    call GetAsyncKeyState
    test ax, 8000h
    jz   bi_fk_n
    bts  ebx, esi
bi_fk_n:
    inc  esi
    cmp  esi, 8
    jb   bi_fk
    mov  ecx, 42h
    call GetAsyncKeyState
    test ax, 8000h
    jz   bi_k1
    or   ebx, 100h
bi_k1:
    mov  ecx, 49h
    call GetAsyncKeyState
    test ax, 8000h
    jz   bi_k2
    or   ebx, 200h
bi_k2:
    mov  ecx, 1Bh
    call GetAsyncKeyState
    test ax, 8000h
    jz   bi_keysdone
    or   ebx, 400h
bi_keysdone:
    mov  eax, fkPrev
    not  eax
    and  eax, ebx
    mov  fkPrev, ebx
    mov  r12d, eax
    xor  esi, esi
bi_use:
    bt   r12d, esi
    jnc  bi_use_n
    mov  ecx, esi
    call UseSlot
bi_use_n:
    inc  esi
    cmp  esi, 8
    jb   bi_use
    test r12d, 300h
    jz   bi_esc
    xor  bagOpen, 1
    mov  heldSlot, -1
    mov  dragPress, 0
bi_esc:
    test r12d, 400h
    jz   bi_mouse
    cmp  bagOpen, 0
    jne  bi_escclose
    mov  pauseReq, 1
    jmp  bi_mouse
bi_escclose:
    mov  bagOpen, 0
    mov  heldSlot, -1
    mov  dragPress, 0
bi_mouse:
    cmp  bagOpen, 0
    jne  bi_open
    mov  releasePending, 0
    mov  dragPress, 0
    jmp  bi_ret
bi_open:
    cmp  clickPending, 0
    je   bi_rel
    mov  esi, dword ptr [mousePt]
    mov  edi, dword ptr [mousePt+4]
    mov  ecx, esi
    sub  ecx, BAG_X
    cmp  ecx, BAG_W
    jae  bi_rel
    mov  edx, edi
    sub  edx, BAG_Y
    cmp  edx, BAG_H
    jae  bi_rel
    mov  clickPending, 0
    mov  ecx, esi
    mov  edx, edi
    call BagSlotAt
    mov  ebx, eax
    test ebx, ebx
    js   bi_bg
    mov  eax, heldSlot
    test eax, eax
    jns  bi_have
    lea  rdx, bag
    cmp  dword ptr [rdx+rbx*4], 0
    je   bi_rel
    mov  heldSlot, ebx
    mov  dragPress, 1
    jmp  bi_rel
bi_have:
    cmp  eax, ebx
    jne  bi_swap
    mov  ecx, ebx
    call UseSlot
    mov  heldSlot, -1
    mov  dragPress, 0
    jmp  bi_rel
bi_swap:
    mov  ecx, eax
    mov  edx, ebx
    call SwapSlots
    mov  heldSlot, -1
    mov  dragPress, 0
    jmp  bi_rel
bi_bg:
    mov  heldSlot, -1
    mov  dragPress, 0
bi_rel:
    cmp  releasePending, 0
    je   bi_ret
    mov  releasePending, 0
    cmp  dragPress, 0
    je   bi_ret
    mov  dragPress, 0
    mov  ecx, dword ptr [mousePt]
    mov  edx, dword ptr [mousePt+4]
    call BagSlotAt
    mov  ebx, eax
    mov  eax, heldSlot
    test eax, eax
    js   bi_ret
    test ebx, ebx
    js   bi_cancel
    cmp  eax, ebx
    je   bi_ret
    mov  ecx, eax
    mov  edx, ebx
    call SwapSlots
    mov  heldSlot, -1
    jmp  bi_ret
bi_cancel:
    mov  ecx, dword ptr [mousePt]
    sub  ecx, BAG_X
    cmp  ecx, BAG_W
    jae  bi_dropit
    mov  ecx, dword ptr [mousePt+4]
    sub  ecx, BAG_Y
    cmp  ecx, BAG_H
    jae  bi_dropit
    mov  heldSlot, -1
    jmp  bi_ret
bi_dropit:
    mov  ecx, heldSlot
    mov  heldSlot, -1
    call DropSlot
bi_ret:
    add  rsp, 48
    pop  r13
    pop  r12
    pop  rdi
    pop  rsi
    pop  rbx
    ret
BagInput ENDP

DrawIcon PROC
    push rbx
    push rsi
    push rdi
    push r12
    push r13
    push r14
    push r15
    mov  r12d, ecx
    mov  r13d, edx
    mov  r14d, r8d
    mov  r15d, r9d
    cmp  iconPixels, 0
    jne  di_image
    mov  ecx, r12d
    mov  edx, r13d
    mov  r8d, r14d
    mov  r9d, r14d
    xor  r10d, r10d
    call FillRect
    lea  ecx, [r12+2]
    lea  edx, [r13+2]
    lea  r8d, [r14-4]
    lea  r9d, [r14-4]
    lea  rax, itemColor
    mov  r10d, [rax+r15*4]
    call FillRect
    jmp  di_ret
di_image:
    xor  esi, esi
di_row:
    mov  eax, esi
    shl  eax, 6
    xor  edx, edx
    div  r14d
    imul eax, iconW
    mov  ebx, eax
    mov  eax, r15d
    shl  eax, 6
    add  ebx, eax
    xor  edi, edi
di_col:
    mov  eax, edi
    shl  eax, 6
    xor  edx, edx
    div  r14d
    add  eax, ebx
    mov  rdx, iconPixels
    mov  eax, [rdx+rax*4]
    test eax, 0FF000000h
    jz   di_skip
    lea  ecx, [r12+rdi]
    lea  edx, [r13+rsi]
    cmp  ecx, SCRW
    jae  di_skip
    cmp  edx, SCRH
    jae  di_skip
    imul edx, edx, SCRW
    add  edx, ecx
    lea  rcx, pixels
    mov  [rcx+rdx*4], eax
di_skip:
    inc  edi
    cmp  edi, r14d
    jb   di_col
    inc  esi
    cmp  esi, r14d
    jb   di_row
di_ret:
    pop  r15
    pop  r14
    pop  r13
    pop  r12
    pop  rdi
    pop  rsi
    pop  rbx
    ret
DrawIcon ENDP

DrawQuickbar PROC
    push rbx
    push rsi
    push rdi
    mov  clipT, 0
    mov  clipB, SCRH
    xor  ebx, ebx
dq_loop:
    imul esi, ebx, QB_STEP
    add  esi, QB_X
    mov  r10d, 0C3C3C3h
    cmp  eqWpn, ebx
    je   dq_eq
    cmp  eqArm, ebx
    jne  dq_fr
dq_eq:
    mov  r10d, 0F0D040h
dq_fr:
    lea  ecx, [rsi-2]
    mov  edx, QB_Y-2
    mov  r8d, QB_SZ+4
    mov  r9d, QB_SZ+4
    call FillRect
    mov  ecx, esi
    mov  edx, QB_Y
    mov  r8d, QB_SZ
    mov  r9d, QB_SZ
    mov  r10d, 000000h
    call FillRect
    lea  rdx, bag
    mov  r9d, [rdx+rbx*4]
    test r9d, r9d
    jz   dq_next
    mov  ecx, esi
    mov  edx, QB_Y
    mov  r8d, QB_SZ
    call DrawIcon
dq_next:
    inc  ebx
    cmp  ebx, BAGN
    jb   dq_loop
    pop  rdi
    pop  rsi
    pop  rbx
    ret
DrawQuickbar ENDP

DrawBag PROC
    push rbx
    push rsi
    push rdi
    push r12
    push r13
    mov  clipT, 0
    mov  clipB, SCRH
    mov  ecx, dword ptr [mousePt]
    mov  edx, dword ptr [mousePt+4]
    call BagSlotAt
    mov  r13d, eax
    mov  ecx, BAG_X-2
    mov  edx, BAG_Y-2
    mov  r8d, BAG_W+4
    mov  r9d, BAG_H+4
    xor  r10d, r10d
    call FillRect
    mov  ecx, BAG_X
    mov  edx, BAG_Y
    mov  r8d, BAG_W
    mov  r9d, BAG_H
    mov  r10d, 000000h
    call FillRect
    mov  ecx, BAG_X
    mov  edx, BAG_Y
    mov  r8d, BAG_W
    mov  r9d, 30
    mov  r10d, 123c78h
    call FillRect
    mov  ecx, STX-12
    mov  edx, BAG_Y+48
    mov  r8d, 252
    mov  r9d, 224
    mov  r10d, 123c78h
    call FillRect
    mov  ecx, BAG_X+16
    mov  edx, BAG_Y+288
    mov  r8d, BAG_W-32
    mov  r9d, 116
    mov  r10d, 123c78h
    call FillRect
    xor  ebx, ebx
db_slot:
    mov  eax, ebx
    and  eax, 3
    imul eax, eax, SLOT_PX+SLOT_GAP
    lea  esi, [rax+GRID_X]
    mov  eax, ebx
    shr  eax, 2
    imul eax, eax, SLOT_PX+SLOT_ROWGAP
    lea  edi, [rax+GRID_Y]
    mov  r10d, 0C3C3C3h
    cmp  ebx, r13d
    jne  db_c1
    mov  r10d, 0A0B8D0h
db_c1:
    cmp  eqWpn, ebx
    je   db_eq
    cmp  eqArm, ebx
    jne  db_c2
db_eq:
    mov  r10d, 0F0D040h
db_c2:
    cmp  heldSlot, ebx
    jne  db_c3
    mov  r10d, 60FF60h
db_c3:
    mov  ecx, esi
    mov  edx, edi
    mov  r8d, SLOT_PX
    mov  r9d, SLOT_PX
    call FillRect
    lea  ecx, [rsi+2]
    lea  edx, [rdi+2]
    mov  r8d, SLOT_PX-4
    mov  r9d, SLOT_PX-4
    mov  r10d, 000000h
    call FillRect
    lea  rdx, bag
    mov  r9d, [rdx+rbx*4]
    test r9d, r9d
    jz   db_next
    lea  ecx, [rsi+6]
    lea  edx, [rdi+6]
    mov  r8d, ICON_SZ
    call DrawIcon
db_next:
    inc  ebx
    cmp  ebx, BAGN
    jb   db_slot
    mov  eax, heldSlot
    test eax, eax
    js   db_done
    lea  rdx, bag
    mov  r9d, [rdx+rax*4]
    test r9d, r9d
    jz   db_done
    mov  ecx, dword ptr [mousePt]
    sub  ecx, 24
    mov  edx, dword ptr [mousePt+4]
    sub  edx, 24
    mov  r8d, 48
    call DrawIcon
db_done:
    pop  r13
    pop  r12
    pop  rdi
    pop  rsi
    pop  rbx
    ret
DrawBag ENDP

StatLabel PROC
    sub  rsp, 40
    mov  ecx, STX
    mov  r9d, 0B0B0B0h
    call TextAt
    add  rsp, 40
    ret
StatLabel ENDP
StatNum PROC
    sub  rsp, 40
    mov  r11d, edx
    call U32ToStr
    mov  r8, rax
    mov  edx, r11d
    mov  ecx, STV
    mov  r9d, 0FFFFFFh
    call TextAt
    add  rsp, 40
    ret
StatNum ENDP
StatStr PROC
    sub  rsp, 40
    mov  ecx, STV
    mov  r9d, 0FFFFFFh
    call TextAt
    add  rsp, 40
    ret
StatStr ENDP

DrawQuickText PROC
    push rbx
    push rsi
    push rdi
    sub  rsp, 48
    xor  ebx, ebx
qt_loop:
    imul esi, ebx, QB_STEP
    add  esi, QB_X
    lea  rax, fkeyStr
    lea  r8, [rbx+rbx*2]
    add  r8, rax
    lea  ecx, [rsi+9]
    mov  edx, QB_Y-19
    mov  r9d, 0C0C0C0h
    call TextAt
    lea  rdx, bag
    mov  edi, [rdx+rbx*4]
    test edi, edi
    jz   qt_next
    cmp  iconPixels, 0
    jne  qt_noshort
    lea  rax, itemShort
    lea  r8, [rdi+rdi*2]
    add  r8, rax
    lea  ecx, [rsi+10]
    mov  edx, QB_Y+10
    mov  r9d, 0FFFFFFh
    call TextAt
qt_noshort:
    lea  rdx, bagQty
    mov  eax, [rdx+rbx*4]
    cmp  eax, 1
    jbe  qt_next
    call U32ToStr
    mov  r8, rax
    lea  ecx, [rsi+25]
    mov  edx, QB_Y+20
    mov  r9d, 40D0FFh
    call TextAt
qt_next:
    inc  ebx
    cmp  ebx, BAGN
    jb   qt_loop
    add  rsp, 48
    pop  rdi
    pop  rsi
    pop  rbx
    ret
DrawQuickText ENDP

DrawBagText PROC
    push rbx
    push rsi
    push rdi
    push r12
    push r13
    sub  rsp, 48
    lea  r8, strBagTitle
    mov  ecx, BAG_X+14
    mov  edx, BAG_Y+8
    mov  r9d, 0FFFFFFh
    call TextAt
    xor  ebx, ebx
bt_slot:
    mov  eax, ebx
    and  eax, 3
    imul eax, eax, SLOT_PX+SLOT_GAP
    lea  esi, [rax+GRID_X]
    mov  eax, ebx
    shr  eax, 2
    imul eax, eax, SLOT_PX+SLOT_ROWGAP
    lea  edi, [rax+GRID_Y]
    lea  rax, fkeyStr
    lea  r8, [rbx+rbx*2]
    add  r8, rax
    lea  ecx, [rsi+30]
    lea  edx, [rdi+SLOT_PX+4]
    mov  r9d, 0C0C0C0h
    call TextAt
    lea  rdx, bag
    mov  r12d, [rdx+rbx*4]
    test r12d, r12d
    jz   bt_next
    cmp  iconPixels, 0
    jne  bt_noshort
    lea  rax, itemShort
    lea  r8, [r12+r12*2]
    add  r8, rax
    lea  ecx, [rsi+28]
    lea  edx, [rdi+28]
    mov  r9d, 0FFFFFFh
    call TextAt
bt_noshort:
    lea  rdx, bagQty
    mov  eax, [rdx+rbx*4]
    cmp  eax, 1
    jbe  bt_eq
    call U32ToStr
    mov  r8, rax
    lea  ecx, [rsi+56]
    lea  edx, [rdi+54]
    mov  r9d, 40D0FFh
    call TextAt
bt_eq:
    cmp  eqWpn, ebx
    je   bt_mark
    cmp  eqArm, ebx
    jne  bt_next
bt_mark:
    lea  r8, strEq
    lea  ecx, [rsi+6]
    lea  edx, [rdi+5]
    mov  r9d, 40E0FFh
    call TextAt
bt_next:
    inc  ebx
    cmp  ebx, BAGN
    jb   bt_slot
    lea  r8, strStats
    mov  ecx, STX
    mov  edx, BAG_Y+54
    mov  r9d, 009C684Dh
    call TextAt
    lea  r8, strHPl
    mov  edx, BAG_Y+80
    call StatLabel
    mov  eax, playerHP
    mov  edx, BAG_Y+80
    call StatNum
    lea  r8, strSlash
    mov  ecx, STV+44
    mov  edx, BAG_Y+80
    mov  r9d, 0B0B0B0h
    call TextAt
    lea  r8, strAtk
    mov  edx, BAG_Y+104
    call StatLabel
    mov  eax, weapon
    lea  rdx, itemAtk
    mov  eax, [rdx+rax*4]
    imul eax, atkMul
    xor  edx, edx
    mov  ecx, 100
    div  ecx
    mov  edx, BAG_Y+104
    call StatNum
    lea  r8, strDefl
    mov  edx, BAG_Y+128
    call StatLabel
    mov  eax, curDef
    mov  edx, BAG_Y+128
    call StatNum
    lea  r8, strDelay
    mov  edx, BAG_Y+152
    call StatLabel
    mov  eax, curCd
    mov  edx, BAG_Y+152
    call StatNum
    lea  r8, strBonus
    mov  edx, BAG_Y+176
    call StatLabel
    mov  eax, sharpPct
    mov  edx, BAG_Y+176
    call StatNum
    lea  r8, strBind
    mov  edx, BAG_Y+200
    call StatLabel
    lea  r8, strNo
    cmp  bindOn, 0
    je   bt_b1
    lea  r8, strYes
bt_b1:
    mov  edx, BAG_Y+200
    call StatStr
    lea  r8, strWpnL
    mov  edx, BAG_Y+224
    call StatLabel
    mov  eax, weapon
    lea  rdx, itemNames
    mov  r8, [rdx+rax*8]
    mov  edx, BAG_Y+224
    call StatStr
    lea  r8, strArmL
    mov  edx, BAG_Y+248
    call StatLabel
    mov  eax, armorId
    lea  rdx, itemNames
    mov  r8, [rdx+rax*8]
    mov  edx, BAG_Y+248
    call StatStr
    mov  eax, heldSlot
    test eax, eax
    jns  bt_tip
    mov  ecx, dword ptr [mousePt]
    mov  edx, dword ptr [mousePt+4]
    call BagSlotAt
bt_tip:
    test eax, eax
    js   bt_help
    lea  rdx, bag
    mov  r12d, [rdx+rax*4]
    test r12d, r12d
    jz   bt_help
    lea  rdx, itemNames
    mov  r8, [rdx+r12*8]
    mov  ecx, BAG_X+28
    mov  edx, BAG_Y+298
    mov  r9d, 40D0FFh
    call TextAt
    lea  rdx, itemDesc
    mov  r8, [rdx+r12*8]
    mov  ecx, BAG_X+28
    mov  edx, BAG_Y+322
    mov  r9d, 0F0F0F0h
    call TextAt
bt_help:
    lea  r8, strHelp1
    mov  ecx, BAG_X+28
    mov  edx, BAG_Y+356
    mov  r9d, 0B0B0B0h
    call TextAt
    lea  r8, strHelp2
    mov  ecx, BAG_X+28
    mov  edx, BAG_Y+378
    mov  r9d, 0B0B0B0h
    call TextAt
    add  rsp, 48
    pop  r13
    pop  r12
    pop  rdi
    pop  rsi
    pop  rbx
    ret
DrawBagText ENDP

MakeFont PROC
    sub  rsp, 120
    mov  ecx, -FONT_H
    xor  edx, edx
    xor  r8d, r8d
    xor  r9d, r9d
    mov  dword ptr [rsp+32], FONT_WEIGHT
    mov  dword ptr [rsp+40], 0
    mov  dword ptr [rsp+48], 0
    mov  dword ptr [rsp+56], 0
    mov  dword ptr [rsp+64], 1
    mov  dword ptr [rsp+72], 0
    mov  dword ptr [rsp+80], 0
    mov  dword ptr [rsp+88], 4
    mov  dword ptr [rsp+96], 0
    lea  rax, fontName
    mov  [rsp+104], rax
    call CreateFontA
    add  rsp, 120
    ret
MakeFont ENDP

LoadProps PROC
    push rbp
    mov  rbp, rsp
    push rcx
    push rdx
    push r8
    push r9
    push r10
    push r11
    and  rsp, -16
    mov  curProp, 0
    mov  curNFloor, 0
    mov  curRowExtra, WALL_EXTRA
    mov  curRowBehind, 0
    mov  eax, curMap
    lea  rdx, prpFiles
    mov  rcx, [rdx+rax*8]
    lea  rdx, propData
    mov  r8d, PROP_BYTES
    call ReadWhole
    cmp  eax, 28
    jb   lp_done
    lea  rdx, propData
    cmp  dword ptr [rdx], PROP_MAGIC
    jne  lp_done
    mov  ecx, [rdx+12]
    cmp  ecx, curH
    jne  lp_done
    mov  r8d, [rdx+4]
    mov  r9d, [rdx+8]
    lea  rax, [rdx+28]
    mov  propTab, rax
    lea  r10d, [r8+r8*4]
    lea  rax, [rax+r10*4]
    mov  propRows, rax
    lea  r10d, [rcx+1]
    lea  rax, [rax+r10*4]
    mov  propList, rax
    lea  r10d, [r9+r9*2]
    lea  rax, [rax+r10*4]
    mov  propPix, rax
    mov  eax, [rdx+24]
    mov  curNFloor, eax
    mov  eax, [rdx+16]
    xor  edx, edx
    mov  ecx, TH
    div  ecx
    add  eax, 2
    cmp  eax, WALL_EXTRA
    jae  lp_e1
    mov  eax, WALL_EXTRA
lp_e1:
    mov  curRowExtra, eax
    lea  rdx, propData
    mov  eax, [rdx+20]
    xor  edx, edx
    div  ecx
    inc  eax
    mov  curRowBehind, eax
    lea  rax, propData
    mov  curProp, rax
lp_done:
    lea  rsp, [rbp-48]
    pop  r11
    pop  r10
    pop  r9
    pop  r8
    pop  rdx
    pop  rcx
    pop  rbp
    ret
LoadProps ENDP

DrawProps PROC
    cmp  curProp, 0
    je   dp_exit
    cmp  ecx, edx
    jae  dp_exit
    push rbx
    push rsi
    push rdi
    push r12
    push r13
    push r14
    push r15
    mov  esi, ecx
    mov  edi, edx
dp_next:
    cmp  esi, edi
    jae  dp_done
    lea  eax, [rsi+rsi*2]
    mov  rdx, propList
    mov  ecx, [rdx+rax*4]
    mov  r12d, [rdx+rax*4+4]
    mov  r13d, [rdx+rax*4+8]
    inc  esi
    lea  ecx, [rcx+rcx*4]
    mov  rdx, propTab
    lea  rdx, [rdx+rcx*4]
    mov  r14d, [rdx+4]
    mov  r15d, [rdx+8]
    mov  eax, r12d
    sub  eax, [rdx+12]
    sub  eax, camX
    mov  gPrX, eax
    mov  eax, r13d
    sub  eax, [rdx+16]
    sub  eax, camY
    add  eax, OFFY
    mov  gPrY, eax
    mov  ecx, [rdx]
    mov  rbx, propPix
    lea  rbx, [rbx+rcx*4]
    mov  r8d, gPrX
    xor  r9d, r9d
    test r8d, r8d
    jns  dp_cx1
    mov  r9d, r8d
    neg  r9d
dp_cx1:
    mov  r10d, SCRW
    sub  r10d, r8d
    cmp  r10d, r14d
    jle  dp_cx2
    mov  r10d, r14d
dp_cx2:
    cmp  r9d, r10d
    jge  dp_next
    mov  r8d, gPrY
    xor  r11d, r11d
    mov  eax, clipT
    sub  eax, r8d
    jle  dp_cy1
    mov  r11d, eax
dp_cy1:
    mov  eax, clipB
    sub  eax, r8d
    cmp  eax, r15d
    jle  dp_cy2
    mov  eax, r15d
dp_cy2:
    cmp  r11d, eax
    jge  dp_next
    mov  gPrEY, eax
    mov  gPrEX, r10d
    mov  gPrSX0, r9d
dp_row:
    mov  eax, r11d
    imul eax, r14d
    add  eax, gPrSX0
    lea  rdx, [rbx+rax*4]
    mov  eax, gPrY
    add  eax, r11d
    imul eax, eax, SCRW
    add  eax, gPrX
    add  eax, gPrSX0
    lea  rcx, pixels
    lea  rcx, [rcx+rax*4]
    mov  r8d, gPrSX0
dp_col:
    mov  eax, [rdx]
    test eax, 0FF000000h
    jz   dp_skip
    mov  [rcx], eax
dp_skip:
    add  rdx, 4
    add  rcx, 4
    inc  r8d
    cmp  r8d, gPrEX
    jl   dp_col
    inc  r11d
    cmp  r11d, gPrEY
    jl   dp_row
    jmp  dp_next
dp_done:
    pop  r15
    pop  r14
    pop  r13
    pop  r12
    pop  rdi
    pop  rsi
    pop  rbx
dp_exit:
    ret
DrawProps ENDP

KeyPressed PROC
    push rbx
    push rsi
    sub  rsp, 40
    mov  ebx, ecx
    xor  esi, esi
    call GetForegroundWindow
    cmp  rax, hWnd
    jne  kp_chk
    mov  ecx, ebx
    call GetAsyncKeyState
    test ax, 8000h
    jz   kp_chk
    mov  esi, 1
kp_chk:
    lea  rcx, keyDown
    movzx eax, byte ptr [rcx+rbx]
    mov  [rcx+rbx], sil
    test eax, eax
    jnz  kp_no
    mov  eax, esi
    jmp  kp_out
kp_no:
    xor  eax, eax
kp_out:
    add  rsp, 40
    pop  rsi
    pop  rbx
    ret
KeyPressed ENDP

BlendRect PROC
    push rbx
    push rsi
    push rdi
    push r12
    push r13
    mov  r12d, 256
    sub  r12d, r11d
    mov  eax, r10d
    and  eax, 0FF00FFh
    imul eax, r11d
    mov  esi, eax
    mov  eax, r10d
    and  eax, 00FF00h
    imul eax, r11d
    mov  edi, eax
    mov  r13d, r9d
    imul eax, edx, SCRW
    add  eax, ecx
    lea  r10, pixels
    lea  r10, [r10+rax*4]
br_row:
    mov  ecx, r8d
    mov  rdx, r10
br_col:
    mov  eax, [rdx]
    mov  ebx, eax
    and  eax, 0FF00FFh
    and  ebx, 00FF00h
    imul eax, r12d
    imul ebx, r12d
    add  eax, esi
    add  ebx, edi
    shr  eax, 8
    shr  ebx, 8
    and  eax, 0FF00FFh
    and  ebx, 00FF00h
    or   eax, ebx
    mov  [rdx], eax
    add  rdx, 4
    dec  ecx
    jnz  br_col
    add  r10, SCRW*4
    dec  r13d
    jnz  br_row
    pop  r13
    pop  r12
    pop  rdi
    pop  rsi
    pop  rbx
    ret
BlendRect ENDP

ScaleColor PROC
    mov  edx, eax
    and  eax, 0FFh
    imul eax, ecx
    shr  eax, 8
    mov  r8d, edx
    shr  r8d, 8
    and  r8d, 0FFh
    imul r8d, ecx
    shr  r8d, 8
    shl  r8d, 8
    or   eax, r8d
    shr  edx, 16
    and  edx, 0FFh
    imul edx, ecx
    shr  edx, 8
    shl  edx, 16
    or   eax, edx
    ret
ScaleColor ENDP

MakeFontEx PROC
    sub  rsp, 120
    mov  [rsp+104], r8
    neg  ecx
    mov  dword ptr [rsp+32], edx
    xor  edx, edx
    xor  r8d, r8d
    xor  r9d, r9d
    mov  dword ptr [rsp+40], 0
    mov  dword ptr [rsp+48], 0
    mov  dword ptr [rsp+56], 0
    mov  dword ptr [rsp+64], 1
    mov  dword ptr [rsp+72], 0
    mov  dword ptr [rsp+80], 0
    mov  dword ptr [rsp+88], 4
    mov  dword ptr [rsp+96], 0
    call CreateFontA
    add  rsp, 120
    ret
MakeFontEx ENDP

TextCentered PROC
    push rbx
    push rsi
    push rdi
    push r12
    sub  rsp, 56
    mov  r12d, ecx
    mov  esi, edx
    mov  rdi, r8
    mov  ebx, r9d
    xor  r8d, r8d
tc_len:
    cmp  byte ptr [rdi+r8], 0
    je   tc_got
    inc  r8d
    jmp  tc_len
tc_got:
    mov  rcx, hDC
    mov  rdx, rdi
    lea  r9, [rsp+32]
    call GetTextExtentPoint32A
    mov  eax, [rsp+32]
    shr  eax, 1
    sub  r12d, eax
    lea  ecx, [r12+2]
    lea  edx, [rsi+2]
    mov  r8, rdi
    xor  r9d, r9d
    call TextAt
    mov  ecx, r12d
    mov  edx, esi
    mov  r8, rdi
    mov  r9d, ebx
    call TextAt
    add  rsp, 56
    pop  r12
    pop  rdi
    pop  rsi
    pop  rbx
    ret
TextCentered ENDP

MenuHit PROC
    sub  ecx, MENU_BTN_X
    cmp  ecx, MENU_BTN_W
    jae  mh_no
    sub  edx, r8d
    cmp  edx, MENU_BTN_H
    jae  mh_no
    mov  eax, 1
    ret
mh_no:
    xor  eax, eax
    ret
MenuHit ENDP

MenuButtonAt PROC
    sub  ecx, ML_X
    cmp  ecx, ML_W
    jae  mb_no
    sub  edx, ML_Y
    js   mb_no
    mov  eax, edx
    xor  edx, edx
    mov  r8d, ML_STEP
    div  r8d
    cmp  eax, 3
    jae  mb_no
    cmp  edx, ML_H
    jae  mb_no
    ret
mb_no:
    mov  eax, -1
    ret
MenuButtonAt ENDP

SnapshotEntities PROC
    lea  rdx, entities
    lea  r8, entInit
    xor  ecx, ecx
se_loop:
    mov  rax, [rdx+rcx*8]
    mov  [r8+rcx*8], rax
    inc  ecx
    cmp  ecx, ENTN*ENTSZ/8
    jb   se_loop
    ret
SnapshotEntities ENDP

NewGame PROC
    mov  restOn, 0
    mov  endAt, 0
    mov  playerHP, PLAYER_HP
    mov  pAct, 0
    mov  pReadyUntil, 0
    mov  heldSlot, -1
    mov  bagOpen, 0
    mov  dragPress, 0
    mov  eqWpn, -1
    mov  eqArm, -1
    mov  sharpPct, 0
    mov  bindOn, 0
    mov  giveCount, 0
    mov  lootCount, 0
    mov  dummyHP, MAXHP
    lea  rdx, bag
    lea  r8, bagQty
    xor  ecx, ecx
ng_bag:
    mov  dword ptr [rdx+rcx*4], 0
    mov  dword ptr [r8+rcx*4], 0
    inc  ecx
    cmp  ecx, BAGN
    jb   ng_bag
    lea  rdx, entInit
    lea  r8, entities
    xor  ecx, ecx
ng_ent:
    mov  rax, [rdx+rcx*8]
    mov  [r8+rcx*8], rax
    inc  ecx
    cmp  ecx, ENTN*ENTSZ/8
    jb   ng_ent
    lea  rdx, slots
    xor  ecx, ecx
ng_num:
    mov  qword ptr [rdx+rcx*8], 0
    inc  ecx
    cmp  ecx, 24
    jb   ng_num
    call RecalcStats
    mov  curMap, 0
    call SetMap
    call PlaceAtSpawn
    lea  rax, msgWelcome
    mov  msgPtr, rax
    ret
NewGame ENDP

Respawn PROC
    mov  playerHP, PLAYER_HP
    call PlaceAtSpawn
    mov  pAct, 0
    mov  pReadyUntil, 0
    lea  rax, msgReborn
    mov  msgPtr, rax
    ret
Respawn ENDP

E_T1 equ END_FADE_MS+500
E_T2 equ E_T1+E1LEN*END_MS1+1000
E_T3 equ E_T2+(E2ALEN+E2BLEN)*END_MS2+2200
E_T4 equ E_T3+END_IMG_MS+800
E_T5 equ E_T4+ETLEN*END_MS3+1500
BS_SHEETW equ BS_W*5

CF_SHEETW equ CF_W*7

DrawCampfireCell PROC
    push rbx
    push rsi
    push rdi
    push r12
    mov  r12d, ecx
    mov  edi, edx
    mov  eax, r8d
    imul eax, eax, CF_W
    mov  r11, cfPixels
    lea  r11, [r11+rax*4]
    mov  ebx, CF_H
cc_row:
    cmp  edi, clipT
    jl   cc_next
    cmp  edi, clipB
    jge  cc_next
    xor  esi, esi
cc_col:
    mov  eax, [r11+rsi*4]
    test eax, 0FF000000h
    jz   cc_skip
    lea  edx, [r12+rsi]
    cmp  edx, SCRW
    jae  cc_skip
    imul ecx, edi, SCRW
    add  ecx, edx
    lea  rdx, pixels
    mov  [rdx+rcx*4], eax
cc_skip:
    inc  esi
    cmp  esi, CF_W
    jb   cc_col
cc_next:
    lea  r11, [r11+CF_SHEETW*4]
    inc  edi
    dec  ebx
    jnz  cc_row
    pop  r12
    pop  rdi
    pop  rsi
    pop  rbx
    ret
DrawCampfireCell ENDP

DrawCampfire PROC
    imul esi, dword ptr [r13+4], TW
    add  esi, TW/2
    sub  esi, camX
    imul edi, dword ptr [r13+8], TH
    add  edi, OFFY+TH-3
    sub  edi, camY
    lea  ecx, [rsi-20]
    lea  edx, [rdi-4]
    mov  r8d, 40
    mov  r9d, 8
    mov  r10d, C_SHADOW
    call FillRect
    cmp  cfPixels, 0
    je   dc_block
    mov  r8d, CF_BURNT
    cmp  dword ptr [r13+24], 1
    je   dc_draw
    mov  eax, dword ptr [nowTick]
    xor  edx, edx
    mov  ecx, CF_FRAME_MS
    div  ecx
    xor  edx, edx
    mov  ecx, 6
    div  ecx
    mov  r8d, edx
dc_draw:
    lea  ecx, [rsi-CF_W/2]
    lea  edx, [rdi-CF_H+6]
    call DrawCampfireCell
    ret
dc_block:
    lea  ecx, [rsi-14]
    lea  edx, [rdi-6]
    mov  r8d, 28
    mov  r9d, 6
    mov  r10d, C_WOOD
    call FillRect
    cmp  dword ptr [r13+24], 1
    je   dc_out
    lea  ecx, [rsi-7]
    lea  edx, [rdi-26]
    mov  r8d, 14
    mov  r9d, 20
    mov  r10d, 0E07020h
    call FillRect
    lea  ecx, [rsi-3]
    lea  edx, [rdi-18]
    mov  r8d, 6
    mov  r9d, 12
    mov  r10d, 0F0D040h
    call FillRect
dc_out:
    ret
DrawCampfire ENDP

DrawFireZones PROC
    push rbx
    push rsi
    push rdi
    push r12
    push r13
    push r14
    sub  rsp, 40
    lea  rsi, entities
    mov  edi, ENTN
fz_loop:
    mov  eax, [rsi]
    cmp  eax, curMap
    jne  fz_next
    cmp  dword ptr [rsi+12], 6
    jne  fz_next
    mov  eax, [rsi+4]
    sub  eax, FIRE_BOX
    imul eax, eax, TW
    sub  eax, camX
    mov  r12d, eax
    mov  eax, [rsi+8]
    sub  eax, FIRE_BOX
    imul eax, eax, TH
    add  eax, OFFY
    sub  eax, camY
    mov  r13d, eax
    mov  ebx, C_FIREBOX
    mov  r14d, 24
    mov  eax, dword ptr [nowTick]
    test eax, 200h
    jz   fz_cols
    mov  r14d, 40
fz_cols:
    cmp  dword ptr [rsi+24], 1
    jne  fz_tint
    mov  eax, dword ptr [nowTick]
    sub  eax, [rsi+28]
    cmp  eax, FIRE_FADE_MS
    jae  fz_dim
    shl  eax, 8
    xor  edx, edx
    mov  ecx, FIRE_FADE_MS
    div  ecx
    mov  ecx, 256
    sub  ecx, eax
    mov  edx, C_FIREBOX
    and  edx, 0FF00FFh
    imul edx, ecx
    mov  r8d, C_FIREOUT
    and  r8d, 0FF00FFh
    imul r8d, eax
    add  edx, r8d
    shr  edx, 8
    and  edx, 0FF00FFh
    mov  r9d, C_FIREBOX
    and  r9d, 00FF00h
    imul r9d, ecx
    mov  r10d, C_FIREOUT
    and  r10d, 00FF00h
    imul r10d, eax
    add  r9d, r10d
    shr  r9d, 8
    and  r9d, 00FF00h
    or   edx, r9d
    mov  ebx, edx
    imul r14d, ecx
    mov  r8d, 12
    imul r8d, eax
    add  r14d, r8d
    shr  r14d, 8
    jmp  fz_tint
fz_dim:
    mov  ebx, C_FIREOUT
    mov  r14d, 12
fz_tint:
    mov  ecx, r12d
    mov  edx, r13d
    mov  r8d, (FIRE_BOX*2+1)*TW
    mov  r9d, (FIRE_BOX*2+1)*TH
    lea  eax, [rcx+r8]
    cmp  eax, SCRW
    jle  fz_x1
    mov  eax, SCRW
fz_x1:
    test ecx, ecx
    jns  fz_x0
    xor  ecx, ecx
fz_x0:
    sub  eax, ecx
    jle  fz_border
    mov  r8d, eax
    lea  eax, [rdx+r9]
    cmp  eax, clipB
    jle  fz_y1
    mov  eax, clipB
fz_y1:
    cmp  edx, clipT
    jge  fz_y0
    mov  edx, clipT
fz_y0:
    sub  eax, edx
    jle  fz_border
    mov  r9d, eax
    mov  r10d, ebx
    mov  r11d, r14d
    call BlendRect
fz_border:
    mov  r10d, ebx
    mov  ecx, r12d
    mov  edx, r13d
    mov  r8d, (FIRE_BOX*2+1)*TW
    mov  r9d, 3
    call FillRect
    mov  ecx, r12d
    lea  edx, [r13+(FIRE_BOX*2+1)*TH-3]
    mov  r8d, (FIRE_BOX*2+1)*TW
    mov  r9d, 3
    call FillRect
    mov  ecx, r12d
    mov  edx, r13d
    mov  r8d, 3
    mov  r9d, (FIRE_BOX*2+1)*TH
    call FillRect
    lea  ecx, [r12+(FIRE_BOX*2+1)*TW-3]
    mov  edx, r13d
    mov  r8d, 3
    mov  r9d, (FIRE_BOX*2+1)*TH
    call FillRect
fz_next:
    add  rsi, ENTSZ
    dec  edi
    jnz  fz_loop
    add  rsp, 40
    pop  r14
    pop  r13
    pop  r12
    pop  rdi
    pop  rsi
    pop  rbx
    ret
DrawFireZones ENDP

UpdateRest PROC
    cmp  restOn, 0
    je   ur_ret
    cmp  pAct, 6
    je   ur_silent
    cmp  pAct, 0
    jne  ur_stop
    mov  eax, playerX
    cmp  eax, restX
    jne  ur_stop
    mov  eax, playerY
    cmp  eax, restY
    jne  ur_stop
    mov  eax, playerHP
    cmp  eax, restLastHP
    jl   ur_stop
    mov  rax, nowTick
    sub  rax, restStart
    cmp  rax, REST_MS
    jae  ur_done
    mov  ecx, PLAYER_HP
    sub  ecx, restHP0
    imul ecx, eax
    mov  eax, ecx
    xor  edx, edx
    mov  ecx, REST_MS
    div  ecx
    add  eax, restHP0
    cmp  eax, playerHP
    jle  ur_keep
    mov  playerHP, eax
ur_keep:
    mov  eax, playerHP
    mov  restLastHP, eax
ur_ret:
    ret
ur_done:
    mov  playerHP, PLAYER_HP
    mov  restOn, 0
    mov  rax, restEnt
    mov  dword ptr [rax+24], 1
    mov  ecx, dword ptr [nowTick]
    mov  [rax+28], ecx
    lea  rax, msgRested
    mov  msgPtr, rax
    ret
ur_stop:
    mov  restOn, 0
    lea  rax, msgRestStop
    mov  msgPtr, rax
    ret
ur_silent:
    mov  restOn, 0
    ret
UpdateRest ENDP

DrawNpcCell PROC
    push rbx
    push rsi
    push rdi
    push r12
    mov  r12d, ecx
    mov  edi, edx
    mov  eax, r8d
    imul eax, eax, BS_W
    mov  r11, bsPixels
    lea  r11, [r11+rax*4]
    mov  ebx, BS_H
nc_row:
    cmp  edi, clipT
    jl   nc_next
    cmp  edi, clipB
    jge  nc_next
    xor  esi, esi
nc_col:
    mov  eax, [r11+rsi*4]
    test eax, 0FF000000h
    jz   nc_skip
    lea  edx, [r12+rsi]
    cmp  edx, SCRW
    jae  nc_skip
    imul ecx, edi, SCRW
    add  ecx, edx
    lea  rdx, pixels
    mov  [rdx+rcx*4], eax
nc_skip:
    inc  esi
    cmp  esi, BS_W
    jb   nc_col
nc_next:
    lea  r11, [r11+BS_SHEETW*4]
    inc  edi
    dec  ebx
    jnz  nc_row
    pop  r12
    pop  rdi
    pop  rsi
    pop  rbx
    ret
DrawNpcCell ENDP

DrawBlacksmith PROC
    imul esi, dword ptr [r13+4], TW
    add  esi, TW/2
    sub  esi, camX
    imul edi, dword ptr [r13+8], TH
    add  edi, OFFY+TH-3
    sub  edi, camY
    lea  ecx, [rsi-28]
    lea  edx, [rdi-4]
    mov  r8d, 56
    mov  r9d, 8
    mov  r10d, C_SHADOW
    call FillRect
    mov  eax, dword ptr [nowTick]
    xor  edx, edx
    mov  ecx, BS_FRAME_MS
    div  ecx
    xor  edx, edx
    mov  ecx, BS_STEPS
    div  ecx
    lea  rax, bsSeq
    movzx r8d, byte ptr [rax+rdx]
    lea  ecx, [rsi-BS_W/2]
    lea  edx, [rdi-BS_BASE]
    call DrawNpcCell
    ret
DrawBlacksmith ENDP

MiniBoss PROC
    mov  eax, edx
    imul eax, r12d
    mov  edx, r12d
    shr  edx, 1
    add  eax, edx
    shr  eax, 16
    lea  edx, [rbx+rax-4]
    imul ecx, r12d
    mov  eax, r12d
    shr  eax, 1
    add  ecx, eax
    shr  ecx, 16
    add  ecx, r15d
    sub  ecx, 4
    push rcx
    push rdx
    mov  r8d, 9
    mov  r9d, 9
    mov  r10d, C_MMBOSSBDR
    call FillRect
    pop  rdx
    pop  rcx
    inc  ecx
    inc  edx
    mov  r8d, 7
    mov  r9d, 7
    mov  r10d, C_MMBOSS
    call FillRect
    ret
MiniBoss ENDP

TypedText PROC
    push rbx
    push rsi
    push rdi
    sub  rsp, 48
    test ecx, ecx
    js   tt_out
    mov  esi, edx
    mov  eax, ecx
    xor  edx, edx
    div  esi
    cmp  eax, r9d
    jbe  tt_n
    mov  eax, r9d
tt_n:
    test eax, eax
    jz   tt_out
    mov  ebx, eax
    lea  rdi, endBuf
    xor  ecx, ecx
tt_c:
    movzx eax, byte ptr [r8+rcx]
    mov  [rdi+rcx], al
    inc  ecx
    cmp  ecx, ebx
    jb   tt_c
    mov  byte ptr [rdi+rcx], 0
    mov  ecx, SCRW/2
    mov  edx, r10d
    lea  r8, endBuf
    mov  r9d, r11d
    call TextCentered
tt_out:
    add  rsp, 48
    pop  rdi
    pop  rsi
    pop  rbx
    ret
TypedText ENDP

EndingFrame PROC
    push rbx
    sub  rsp, 48
    mov  ecx, 0Dh
    call KeyPressed
    mov  ebx, eax
    mov  ecx, 20h
    call KeyPressed
    or   ebx, eax
    mov  ecx, 1Bh
    call KeyPressed
    or   ebx, eax
    cmp  clickPending, 0
    je   ef_nc
    mov  ebx, 1
ef_nc:
    mov  clickPending, 0
    mov  eax, dword ptr [nowTick]
    sub  eax, dword ptr [endStart]
    cmp  eax, E_T5
    jb   ef_nokey
    test ebx, ebx
    jz   ef_nokey
    mov  gameState, 0
    mov  menuSel, 0
    mov  menuPage, 0
    mov  rax, nowTick
    mov  menuTick, rax
    xor  eax, eax
    jmp  ef_out
ef_nokey:
    mov  ecx, dword ptr [nowTick]
    sub  ecx, dword ptr [endStart]
    xor  eax, eax
    cmp  ecx, END_FADE_MS
    jae  ef_out
    mov  eax, 1
ef_out:
    add  rsp, 48
    pop  rbx
    ret
EndingFrame ENDP

EndingDraw PROC
    push rbx
    push rsi
    sub  rsp, 40
    mov  clipT, 0
    mov  clipB, SCRH
    mov  eax, dword ptr [nowTick]
    sub  eax, dword ptr [endStart]
    mov  ebx, eax
    cmp  ebx, END_FADE_MS
    jae  ed_black
    imul eax, ebx, 256
    xor  edx, edx
    mov  ecx, END_FADE_MS
    div  ecx
    mov  r11d, eax
    xor  ecx, ecx
    xor  edx, edx
    mov  r8d, SCRW
    mov  r9d, SCRH
    xor  r10d, r10d
    call BlendRect
    jmp  ed_out
ed_black:
    xor  ecx, ecx
    xor  edx, edx
    mov  r8d, SCRW
    mov  r9d, SCRH
    xor  r10d, r10d
    call FillRect
    cmp  ebx, E_T3
    jb   ed_out
    mov  rdx, endImgPixels
    test rdx, rdx
    jnz  ed_copy
    mov  rdx, menuBgPixels
    test rdx, rdx
    jz   ed_grad
ed_copy:
    lea  r8, pixels
    xor  ecx, ecx
ed_cl:
    mov  eax, [rdx+rcx*4]
    mov  [r8+rcx*4], eax
    inc  ecx
    cmp  ecx, SCRW*SCRH
    jb   ed_cl
    jmp  ed_dim
ed_grad:
    xor  esi, esi
ed_gl:
    mov  eax, esi
    xor  edx, edx
    mov  ecx, 48
    div  ecx
    add  eax, 10
    mov  r10d, eax
    shl  r10d, 16
    mov  eax, esi
    xor  edx, edx
    mov  ecx, 36
    div  ecx
    add  eax, 12
    shl  eax, 8
    or   r10d, eax
    mov  eax, esi
    xor  edx, edx
    mov  ecx, 22
    div  ecx
    add  eax, 28
    or   r10d, eax
    xor  ecx, ecx
    mov  edx, esi
    mov  r8d, SCRW
    mov  r9d, 1
    call FillRect
    inc  esi
    cmp  esi, SCRH
    jb   ed_gl
ed_dim:
    mov  eax, ebx
    sub  eax, E_T3
    cmp  eax, END_IMG_MS
    jae  ed_out
    imul eax, eax, 256
    xor  edx, edx
    mov  ecx, END_IMG_MS
    div  ecx
    mov  r11d, 256
    sub  r11d, eax
    xor  ecx, ecx
    xor  edx, edx
    mov  r8d, SCRW
    mov  r9d, SCRH
    xor  r10d, r10d
    call BlendRect
ed_out:
    add  rsp, 40
    pop  rsi
    pop  rbx
    ret
EndingDraw ENDP

EndingText PROC
    push rbx
    sub  rsp, 48
    mov  eax, dword ptr [nowTick]
    sub  eax, dword ptr [endStart]
    mov  ebx, eax
    cmp  ebx, E_T3
    jae  et_demo
    mov  rcx, hDC
    mov  rdx, hFontMenu
    call SelectObject
    mov  ecx, ebx
    sub  ecx, E_T1
    mov  edx, END_MS1
    lea  r8, strEnd1
    mov  r9d, E1LEN
    mov  r10d, 300
    mov  r11d, 0FFFFFFh
    call TypedText
    mov  ecx, ebx
    sub  ecx, E_T2
    mov  edx, END_MS2
    lea  r8, strEnd2a
    mov  r9d, E2ALEN
    mov  r10d, 372
    mov  r11d, 0E0E0E0h
    call TypedText
    mov  ecx, ebx
    sub  ecx, E_T2+E2ALEN*END_MS2
    mov  edx, END_MS2
    lea  r8, strEnd2b
    mov  r9d, E2BLEN
    mov  r10d, 412
    mov  r11d, 0E0E0E0h
    call TypedText
    jmp  et_out
et_demo:
    cmp  ebx, E_T4
    jb   et_out
    mov  rcx, hDC
    mov  rdx, hFontTitle
    call SelectObject
    mov  ecx, ebx
    sub  ecx, E_T4
    mov  edx, END_MS3
    lea  r8, strEndTitle
    mov  r9d, ETLEN
    mov  r10d, 300
    mov  r11d, 50C8F0h
    call TypedText
    cmp  ebx, E_T5
    jb   et_out
    mov  rcx, hDC
    mov  rdx, hFontSmall
    call SelectObject
    mov  ecx, SCRW/2
    mov  edx, 650
    lea  r8, strEndHint
    mov  r9d, 0C0C0C0h
    call TextCentered
et_out:
    add  rsp, 48
    pop  rbx
    ret
EndingText ENDP

HaveItem PROC
    lea  rdx, bag
    xor  r8d, r8d
hi_l:
    cmp  [rdx+r8*4], ecx
    je   hi_yes
    inc  r8d
    cmp  r8d, BAGN
    jb   hi_l
    xor  eax, eax
    ret
hi_yes:
    mov  eax, 1
    ret
HaveItem ENDP

TeleportTo PROC
    mov  playerX, ecx
    mov  playerY, edx
    mov  stepFromX, ecx
    mov  stepFromY, edx
    mov  stepStart, 0
    mov  pathLen, 0
    mov  pathPos, 0
    mov  pendingEnt, 0
    mov  dlgEnt, 0
    mov  dlgPtr, 0
    ret
TeleportTo ENDP

RandomSpot PROC
    push rbx
    push rsi
    push rdi
    push r12
    push r13
    mov  r13d, 400
rs_try:
    call Rand
    xor  edx, edx
    mov  ecx, curW
    div  ecx
    mov  esi, edx
    call Rand
    xor  edx, edx
    mov  ecx, curH
    div  ecx
    mov  edi, edx
    call GetCell
    cmp  al, '.'
    jne  rs_next
    call FindEntity
    test rax, rax
    jnz  rs_next
    lea  r12, warps
    mov  ebx, WARPN
rs_w:
    mov  eax, [r12]
    cmp  eax, curMap
    jne  rs_wn
    mov  eax, [r12+4]
    sub  eax, esi
    cdq
    xor  eax, edx
    sub  eax, edx
    cmp  eax, WARP_R+3
    jg   rs_wn
    mov  eax, [r12+8]
    sub  eax, edi
    cdq
    xor  eax, edx
    sub  eax, edx
    cmp  eax, WARP_R+3
    jle  rs_next
rs_wn:
    add  r12, 24
    dec  ebx
    jnz  rs_w
    mov  ecx, esi
    mov  edx, edi
    mov  eax, 1
    jmp  rs_out
rs_next:
    dec  r13d
    jnz  rs_try
    xor  eax, eax
rs_out:
    pop  r13
    pop  r12
    pop  rdi
    pop  rsi
    pop  rbx
    ret
RandomSpot ENDP

SpawnItemAt PROC
    push rbx
    push rsi
    push rdi
    push r12
    push r13
    mov  ebx, ecx
    mov  r12d, edx
    mov  r13d, r8d
    lea  rdx, entities
    mov  ecx, ENTN
sf_find:
    cmp  dword ptr [rdx+12], 5
    jne  sf_next
    cmp  dword ptr [rdx], -1
    je   sf_found
sf_next:
    add  rdx, ENTSZ
    dec  ecx
    jnz  sf_find
    xor  eax, eax
    jmp  sf_out
sf_found:
    mov  r8, rdx
    mov  [r8], r9d
    mov  [r8+48], r12d
    mov  [r8+52], r13d
    call Rand
    mov  r9d, eax
    xor  edx, edx
    mov  ecx, 3
    div  ecx
    lea  esi, [r12+rdx-1]
    mov  eax, r9d
    shr  eax, 8
    xor  edx, edx
    div  ecx
    lea  edi, [r13+rdx-1]
    call GetCell
    cmp  al, '.'
    je   sf_land
    mov  esi, r12d
    mov  edi, r13d
sf_land:
    mov  [r8+4], esi
    mov  [r8+8], edi
    mov  [r8+16], ebx
    mov  eax, dword ptr [nowTick]
    mov  [r8+28], eax
    mov  eax, 1
sf_out:
    pop  r13
    pop  r12
    pop  rdi
    pop  rsi
    pop  rbx
    ret
SpawnItemAt ENDP

DropSlot PROC
    push rbx
    push rsi
    mov  esi, ecx
    cmp  esi, BAGN
    jae  ds_out
    cmp  pAct, 6
    je   ds_out
    lea  rdx, bag
    mov  ebx, [rdx+rsi*4]
    test ebx, ebx
    jz   ds_out
    mov  ecx, ebx
    mov  edx, playerX
    mov  r8d, playerY
    mov  r9d, curMap
    call SpawnItemAt
    test eax, eax
    jz   ds_full
    lea  rdx, bagQty
    dec  dword ptr [rdx+rsi*4]
    jnz  ds_msg
    lea  rdx, bag
    mov  dword ptr [rdx+rsi*4], 0
    cmp  eqWpn, esi
    jne  ds_a
    mov  eqWpn, -1
ds_a:
    cmp  eqArm, esi
    jne  ds_b
    mov  eqArm, -1
ds_b:
    call RecalcStats
ds_msg:
    lea  rax, msgDropped
    mov  msgPtr, rax
    jmp  ds_out
ds_full:
    lea  rax, msgNoRoom
    mov  msgPtr, rax
ds_out:
    pop  rsi
    pop  rbx
    ret
DropSlot ENDP

InitEnemyStats PROC
    lea  rdx, entities
    mov  ecx, ENTN
ie_l:
    cmp  dword ptr [rdx+12], 4
    jne  ie_n
    mov  eax, [rdx+36]
    lea  r8, monHP
    mov  eax, [r8+rax*4]
    mov  [rdx+16], eax
    mov  [rdx+20], eax
ie_n:
    add  rdx, ENTSZ
    dec  ecx
    jnz  ie_l
    ret
InitEnemyStats ENDP

DrawArrowCursor PROC
    cmp  curPixels, 0
    je   dac_out
    cmp  mouseIn, 0
    je   dac_out
    mov  rax, lastReal
    xor  edx, edx
    mov  ecx, CUR_FRAME_MS
    div  ecx
    xor  edx, edx
    mov  ecx, 6
    div  ecx
    mov  r8d, edx
    mov  ecx, dword ptr [mousePt]
    sub  ecx, 16
    mov  edx, dword ptr [mousePt+4]
    sub  edx, 3
    sub  rsp, 40
    call DrawCursorCell
    add  rsp, 40
dac_out:
    ret
DrawArrowCursor ENDP

PauseFrame PROC
    push rbx
    push rsi
    push rdi
    push r12
    push r13
    sub  rsp, 48
    mov  r12d, pauseSel
    mov  ecx, 26h
    call KeyPressed
    mov  ebx, eax
    mov  ecx, 57h
    call KeyPressed
    or   ebx, eax
    mov  ecx, 28h
    call KeyPressed
    mov  esi, eax
    mov  ecx, 53h
    call KeyPressed
    or   esi, eax
    mov  ecx, 0Dh
    call KeyPressed
    mov  edi, eax
    mov  ecx, 20h
    call KeyPressed
    or   edi, eax
    mov  ecx, 1Bh
    call KeyPressed
    mov  r13d, eax
    test ebx, ebx
    jz   pf_nup
    dec  r12d
    jns  pf_nup
    mov  r12d, 2
pf_nup:
    test esi, esi
    jz   pf_ndn
    inc  r12d
    cmp  r12d, 3
    jb   pf_ndn
    xor  r12d, r12d
pf_ndn:
    mov  ecx, dword ptr [mousePt]
    mov  edx, dword ptr [mousePt+4]
    call MenuButtonAt
    xor  ebx, ebx
    cmp  mouseIn, 0
    je   pf_nohover
    test eax, eax
    js   pf_nohover
    mov  r12d, eax
    cmp  clickPending, 0
    je   pf_nohover
    mov  ebx, 1
pf_nohover:
    mov  clickPending, 0
    mov  pauseSel, r12d
    test r13d, r13d
    jnz  pf_resume
    test ebx, ebx
    jnz  pf_choose
    test edi, edi
    jz   pf_out
pf_choose:
    cmp  r12d, 0
    je   pf_resume
    cmp  r12d, 1
    je   pf_restart
    mov  gameState, 0
    mov  menuSel, 0
    mov  menuPage, 0
    mov  rax, nowTick
    mov  menuTick, rax
    jmp  pf_out
pf_restart:
    call NewGame
    mov  gameState, 1
    jmp  pf_out
pf_resume:
    mov  gameState, 1
pf_out:
    add  rsp, 48
    pop  r13
    pop  r12
    pop  rdi
    pop  rsi
    pop  rbx
    ret
PauseFrame ENDP

PauseDraw PROC
    push rbx
    push rsi
    sub  rsp, 40
    mov  clipT, 0
    mov  clipB, SCRH
    xor  ecx, ecx
    xor  edx, edx
    mov  r8d, SCRW
    mov  r9d, SCRH
    mov  r10d, 0A0A18h
    mov  r11d, 150
    call BlendRect
    mov  ecx, pauseSel
    xor  edx, edx
    call DrawMenuList
    mov  ecx, pauseSel
    call DrawMenuMarker
    add  rsp, 40
    pop  rsi
    pop  rbx
    ret
PauseDraw ENDP

PauseText PROC
    push rbx
    sub  rsp, 48
    mov  rcx, hDC
    mov  rdx, hFontTitle
    call SelectObject
    mov  ecx, ML_X
    mov  edx, ML_Y-100
    lea  r8, strPaused
    mov  r9d, 50C8F0h
    call TextAt
    mov  rcx, hDC
    mov  rdx, hFontMenu
    call SelectObject
    mov  ecx, pauseSel
    xor  edx, edx
    lea  r8, pauseWords
    call MenuListText
    mov  rcx, hDC
    mov  rdx, hFontSmall
    call SelectObject
    mov  ecx, SCRW/2
    mov  edx, 690
    lea  r8, strPauseHint
    mov  r9d, 808080h
    call TextCentered
    add  rsp, 48
    pop  rbx
    ret
PauseText ENDP

LoadMonsterSheets PROC
    push rbx
    push rsi
    sub  rsp, 40
    xor  ebx, ebx
lms_l:
    lea  rax, monNameTab
    mov  rcx, [rax+rbx*8]
    mov  eax, MON_SHEET_BYTES
    imul eax, ebx
    lea  rdx, monFile
    add  rdx, rax
    mov  r8d, MON_SHEET_BYTES
    call LoadBmp
    lea  rcx, monSheetPix
    cmp  edx, MCELLW*6
    je   lms_ok
    xor  eax, eax
lms_ok:
    mov  [rcx+rbx*8], rax
    inc  ebx
    cmp  ebx, MON_SHEETS
    jb   lms_l
    mov  rax, monSheetPix
    mov  monPixels, rax
    add  rsp, 40
    pop  rsi
    pop  rbx
    ret
LoadMonsterSheets ENDP

DrawMenuList PROC
    push rbx
    push rsi
    push rdi
    push r12
    push r13
    sub  rsp, 40
    mov  r12d, ecx
    mov  r13d, edx
    xor  ebx, ebx
dl_item:
    imul esi, ebx, ML_STEP
    add  esi, ML_Y
    cmp  ebx, r12d
    jne  dl_line
    xor  edi, edi
dl_col:
    mov  eax, ML_W
    sub  eax, edi
    imul eax, eax, 240
    shr  eax, 9
    mov  r11d, eax
    lea  ecx, [rdi+ML_X]
    mov  edx, esi
    mov  r8d, 1
    mov  r9d, ML_H
    mov  r10d, C_MLBAR
    call BlendRect
    inc  edi
    cmp  edi, ML_W
    jb   dl_col
dl_line:
    xor  edi, edi
dl_lc:
    mov  eax, ML_W
    sub  eax, edi
    shr  eax, 1
    mov  r11d, eax
    lea  ecx, [rdi+ML_X]
    lea  edx, [rsi+ML_H+3]
    mov  r8d, 1
    mov  r9d, 1
    mov  r10d, C_MLLINE_D
    test r13d, r13d
    jz   dl_lcall
    mov  r10d, C_MLLINE_L
dl_lcall:
    call BlendRect
    inc  edi
    cmp  edi, ML_W
    jb   dl_lc
    inc  ebx
    cmp  ebx, 3
    jb   dl_item
    add  rsp, 40
    pop  r13
    pop  r12
    pop  rdi
    pop  rsi
    pop  rbx
    ret
DrawMenuList ENDP

MenuListText PROC
    push rbx
    push rsi
    push rdi
    push r12
    push r13
    push r14
    sub  rsp, 40
    mov  r12d, ecx
    mov  r13d, edx
    mov  r14, r8
    xor  ebx, ebx
ml_item:
    mov  r8, [r14+rbx*8]
    imul edx, ebx, ML_STEP
    add  edx, ML_Y+4
    mov  ecx, ML_TEXT_X
    mov  r9d, 0FFFFFFh
    cmp  ebx, r12d
    je   ml_go
    mov  r9d, 0D2BEBEh
    test r13d, r13d
    jz   ml_go
    mov  r9d, 404040h
ml_go:
    call TextAt
    inc  ebx
    cmp  ebx, 3
    jb   ml_item
    add  rsp, 40
    pop  r14
    pop  r13
    pop  r12
    pop  rdi
    pop  rsi
    pop  rbx
    ret
MenuListText ENDP

DrawMenuDesc PROC
    push rbx
    sub  rsp, 48
    xor  ebx, ebx
dd2_col:
    mov  eax, ML_DESC_W-1
    sub  eax, ebx
    cmp  eax, ebx
    jbe  dd2_t
    mov  eax, ebx
dd2_t:
    cmp  eax, 256
    jbe  dd2_a
    mov  eax, 256
dd2_a:
    imul eax, eax, 220
    shr  eax, 8
    mov  r11d, eax
    lea  ecx, [rbx+ML_DESC_X]
    mov  edx, ML_DESC_Y
    mov  r8d, 1
    mov  r9d, ML_DESC_H
    mov  r10d, C_MLDESC
    call BlendRect
    inc  ebx
    cmp  ebx, ML_DESC_W
    jb   dd2_col
    add  rsp, 48
    pop  rbx
    ret
DrawMenuDesc ENDP

DrawMenuMarker PROC
    push rbx
    push rsi
    push rdi
    push r12
    imul esi, ecx, ML_STEP
    add  esi, ML_Y
    mov  eax, dword ptr [nowTick]
    shr  eax, 8
    and  eax, 1
    lea  eax, [rax+rax*2]
    mov  edi, ML_X-62
    add  edi, eax
    cmp  menuIcoPixels, 0
    jne  mm_own
    cmp  iconPixels, 0
    je   mm_plain
    mov  ecx, edi
    lea  edx, [rsi-2]
    mov  r8d, 44
    mov  r9d, MENU_ICON_ITEM
    call DrawIcon
    jmp  mm_out
mm_plain:
    lea  ecx, [rdi+14]
    lea  edx, [rsi+4]
    mov  r8d, 12
    mov  r9d, 32
    mov  r10d, 0F0C850h
    call FillRect
    lea  ecx, [rdi+6]
    lea  edx, [rsi+14]
    mov  r8d, 28
    mov  r9d, 12
    mov  r10d, 0F0C850h
    call FillRect
    jmp  mm_out
mm_own:
    mov  r11, menuIcoPixels
    lea  r12d, [rsi-12]
    sub  edi, 10
    mov  ebx, MI_SZ
mm_row:
    xor  r10d, r10d
    cmp  r12d, SCRH
    jae  mm_next
mm_col:
    mov  eax, [r11+r10*4]
    test eax, 0FF000000h
    jz   mm_skip
    lea  edx, [rdi+r10]
    cmp  edx, SCRW
    jae  mm_skip
    imul ecx, r12d, SCRW
    add  ecx, edx
    lea  rdx, pixels
    mov  [rdx+rcx*4], eax
mm_skip:
    inc  r10d
    cmp  r10d, MI_SZ
    jb   mm_col
mm_next:
    add  r11, MI_SZ*4
    inc  r12d
    dec  ebx
    jnz  mm_row
mm_out:
    pop  r12
    pop  rdi
    pop  rsi
    pop  rbx
    ret
DrawMenuMarker ENDP

MenuFrame PROC
    push rbx
    push rsi
    push rdi
    push r12
    push r13
    sub  rsp, 48
    mov  r12d, menuSel
    mov  ecx, 26h
    call KeyPressed
    mov  ebx, eax
    mov  ecx, 57h
    call KeyPressed
    or   ebx, eax
    mov  ecx, 28h
    call KeyPressed
    mov  esi, eax
    mov  ecx, 53h
    call KeyPressed
    or   esi, eax
    mov  ecx, 0Dh
    call KeyPressed
    mov  edi, eax
    mov  ecx, 20h
    call KeyPressed
    or   edi, eax
    mov  ecx, 1Bh
    call KeyPressed
    mov  r13d, eax
    cmp  menuPage, 0
    jne  mf_page1
    test ebx, ebx
    jz   mf_nup
    dec  r12d
    jns  mf_nup
    mov  r12d, 2
mf_nup:
    test esi, esi
    jz   mf_ndn
    inc  r12d
    cmp  r12d, 3
    jb   mf_ndn
    xor  r12d, r12d
mf_ndn:
    mov  ecx, dword ptr [mousePt]
    mov  edx, dword ptr [mousePt+4]
    call MenuButtonAt
    xor  ebx, ebx
    cmp  mouseIn, 0
    je   mf_nohover
    test eax, eax
    js   mf_nohover
    mov  r12d, eax
    cmp  clickPending, 0
    je   mf_nohover
    mov  ebx, 1
mf_nohover:
    mov  clickPending, 0
    mov  menuSel, r12d
    test ebx, ebx
    jnz  mf_choose
    test edi, edi
    jz   mf_draw
mf_choose:
    cmp  r12d, 0
    je   mf_begin
    cmp  r12d, 1
    je   mf_controls
    mov  menuQuit, 1
    jmp  mf_draw
mf_begin:
    call NewGame
    mov  gameState, 1
    jmp  mf_draw
mf_controls:
    mov  menuPage, 1
    mov  menuSel, 0
    jmp  mf_draw
mf_page1:
    mov  ecx, dword ptr [mousePt]
    mov  edx, dword ptr [mousePt+4]
    mov  r8d, MENU_BACK_Y
    call MenuHit
    xor  ebx, ebx
    cmp  mouseIn, 0
    je   mf_p1b
    test eax, eax
    jz   mf_p1b
    cmp  clickPending, 0
    je   mf_p1b
    mov  ebx, 1
mf_p1b:
    mov  clickPending, 0
    or   ebx, edi
    or   ebx, r13d
    jz   mf_draw
    mov  menuPage, 0
    mov  menuSel, 0
mf_draw:
    mov  clipT, 0
    mov  clipB, SCRH
    cmp  menuBgPixels, 0
    je   mf_gradient
    mov  rdx, menuBgPixels
    lea  r8, pixels
    xor  ecx, ecx
mf_pic:
    mov  eax, [rdx+rcx*4]
    mov  [r8+rcx*4], eax
    inc  ecx
    cmp  ecx, SCRW*SCRH
    jb   mf_pic
    jmp  mf_afterbg
mf_gradient:
    xor  ebx, ebx
mf_bg:
    mov  eax, ebx
    imul eax, eax, 24
    xor  edx, edx
    mov  ecx, SCRH
    div  ecx
    add  eax, 10
    shl  eax, 16
    mov  r10d, eax
    mov  eax, ebx
    imul eax, eax, 8
    xor  edx, edx
    div  ecx
    add  eax, 12
    shl  eax, 8
    or   r10d, eax
    mov  eax, ebx
    imul eax, eax, 16
    xor  edx, edx
    div  ecx
    add  eax, 28
    or   r10d, eax
    xor  ecx, ecx
    mov  edx, ebx
    mov  r8d, SCRW
    mov  r9d, 1
    call FillRect
    inc  ebx
    cmp  ebx, SCRH
    jb   mf_bg
mf_afterbg:
    cmp  menuPage, 0
    jne  mf_draw1
    mov  ecx, menuSel
    xor  edx, edx
    cmp  menuBgPixels, 0
    je   mf_theme
    mov  edx, MENU_PIC_LIGHT
mf_theme:
    call DrawMenuList
    call DrawMenuDesc
    mov  ecx, menuSel
    call DrawMenuMarker
    jmp  mf_fade
mf_draw1:
    mov  ecx, 198
    mov  edx, 98
    mov  r8d, 884
    mov  r9d, 494
    mov  r10d, 465078h
    call FillRect
    mov  ecx, 200
    mov  edx, 100
    mov  r8d, 880
    mov  r9d, 490
    mov  r10d, 14182Ah
    call FillRect
    mov  ecx, MENU_BTN_X-2
    mov  edx, MENU_BACK_Y-2
    mov  r8d, MENU_BTN_W+4
    mov  r9d, MENU_BTN_H+4
    mov  r10d, 0F0C850h
    call FillRect
    mov  ecx, MENU_BTN_X
    mov  edx, MENU_BACK_Y
    mov  r8d, MENU_BTN_W
    mov  r9d, MENU_BTN_H
    mov  r10d, 3A2A28h
    call FillRect
mf_fade:
    mov  rax, nowTick
    sub  rax, menuTick
    cmp  rax, MENU_FADE_MS
    jae  mf_cursor
    mov  ecx, MENU_FADE_MS
    sub  ecx, eax
    imul ecx, ecx, 256
    mov  eax, ecx
    xor  edx, edx
    mov  ecx, MENU_FADE_MS
    div  ecx
    mov  r11d, eax
    xor  ecx, ecx
    xor  edx, edx
    mov  r8d, SCRW
    mov  r9d, SCRH
    xor  r10d, r10d
    call BlendRect
mf_cursor:
    call DrawArrowCursor
mf_out:
    add  rsp, 48
    pop  r13
    pop  r12
    pop  rdi
    pop  rsi
    pop  rbx
    ret
MenuFrame ENDP

MenuText PROC
    push rbx
    push rsi
    sub  rsp, 40
    cmp  menuPage, 0
    jne  mt_page1
    cmp  menuBgPixels, 0
    jne  mt_notitle
    mov  rcx, hDC
    mov  rdx, hFontTitle
    call SelectObject
    mov  ecx, SCRW/2
    mov  edx, 130
    lea  r8, strGameTitle
    mov  r9d, 50C8F0h
    call TextCentered
    mov  rcx, hDC
    mov  rdx, hFontSmall
    call SelectObject
    mov  ecx, SCRW/2
    mov  edx, 222
    lea  r8, strGameSub
    mov  r9d, 0BEAAAAh
    call TextCentered
mt_notitle:
    mov  rcx, hDC
    mov  rdx, hFontMenu
    call SelectObject
    xor  edx, edx
    cmp  menuBgPixels, 0
    je   mt_theme
    mov  edx, MENU_PIC_LIGHT
mt_theme:
    mov  ecx, menuSel
    lea  r8, menuWords
    call MenuListText
    mov  rcx, hDC
    mov  rdx, hFontSmall
    call SelectObject
    mov  eax, menuSel
    lea  rdx, menuDescs
    mov  r8, [rdx+rax*8]
    mov  ecx, SCRW/2
    mov  edx, ML_DESC_Y+5
    mov  r9d, 0FFFFFFh
    call TextCentered
    cmp  menuBgPixels, 0
    jne  mt_out
    mov  rcx, hDC
    mov  rdx, hFontSmall
    call SelectObject
    mov  ecx, SCRW/2
    mov  edx, 690
    lea  r8, strMenuHint
    mov  r9d, 808080h
    call TextCentered
    jmp  mt_out
mt_page1:
    mov  rcx, hDC
    mov  rdx, hFontMenu
    call SelectObject
    mov  ecx, SCRW/2
    mov  edx, 125
    lea  r8, strControls
    mov  r9d, 50C8F0h
    call TextCentered
    mov  rcx, hDC
    mov  rdx, hFontSmall
    call SelectObject
    xor  ebx, ebx
mt_row:
    imul esi, ebx, 38
    add  esi, 190
    lea  rax, ctlKeys
    mov  r8, [rax+rbx*8]
    mov  ecx, 230
    mov  edx, esi
    mov  r9d, 50C8F0h
    call TextAt
    lea  rax, ctlDescs
    mov  r8, [rax+rbx*8]
    mov  ecx, 500
    mov  edx, esi
    mov  r9d, 0E0E0E0h
    call TextAt
    inc  ebx
    cmp  ebx, 9
    jb   mt_row
    mov  rcx, hDC
    mov  rdx, hFontMenu
    call SelectObject
    mov  ecx, SCRW/2
    mov  edx, MENU_BACK_Y+13
    lea  r8, strBack
    mov  r9d, 0FFFFFFh
    call TextCentered
mt_out:
    add  rsp, 40
    pop  rsi
    pop  rbx
    ret
MenuText ENDP

DeathInput PROC
    cmp  pAct, 6
    jne  di_exit
    push rbx
    push rsi
    sub  rsp, 40
    mov  ecx, 0Dh
    call KeyPressed
    mov  ebx, eax
    mov  ecx, 20h
    call KeyPressed
    or   ebx, eax
    mov  ecx, 1Bh
    call KeyPressed
    mov  esi, eax
    mov  eax, dword ptr [nowTick]
    sub  eax, pActStart
    cmp  eax, DEATH_INPUT_MS
    jb   di_done
    test esi, esi
    jnz  di_menu
    cmp  clickPending, 0
    jne  di_go
    test ebx, ebx
    jz   di_done
di_go:
    mov  clickPending, 0
    call Respawn
    jmp  di_done
di_menu:
    mov  clickPending, 0
    mov  gameState, 0
    mov  menuSel, 0
    mov  menuPage, 0
    mov  rax, nowTick
    mov  menuTick, rax
di_done:
    add  rsp, 40
    pop  rsi
    pop  rbx
di_exit:
    ret
DeathInput ENDP

DeathOverlay PROC
    mov  eax, dword ptr [nowTick]
    sub  eax, pActStart
    sub  eax, DEATH_FADE_DELAY
    jle  de_exit
    cmp  eax, DEATH_FADE_MS
    jbe  de_a
    mov  eax, DEATH_FADE_MS
de_a:
    imul eax, eax, DEATH_ALPHA
    xor  edx, edx
    mov  ecx, DEATH_FADE_MS
    div  ecx
    mov  r11d, eax
    xor  ecx, ecx
    xor  edx, edx
    mov  r8d, SCRW
    mov  r9d, SCRH
    mov  r10d, DEATH_TINT
    call BlendRect
    mov  ghostMode, 0
    call DrawPlayer
de_exit:
    ret
DeathOverlay ENDP

DeathText PROC
    push rbx
    push rsi
    sub  rsp, 40
    mov  eax, dword ptr [nowTick]
    sub  eax, pActStart
    mov  ebx, eax
    sub  eax, DEATH_TEXT_AT
    jle  dt_exit
    cmp  eax, 1000
    jbe  dt_f
    mov  eax, 1000
dt_f:
    imul eax, eax, 256
    xor  edx, edx
    mov  ecx, 1000
    div  ecx
    mov  esi, eax
    mov  rcx, hDC
    mov  rdx, hFontD1
    call SelectObject
    mov  eax, 2828C8h
    mov  ecx, esi
    call ScaleColor
    mov  r9d, eax
    mov  ecx, SCRW/2
    mov  edx, 250
    lea  r8, strDeathTitle
    call TextCentered
    mov  eax, ebx
    sub  eax, DEATH_INPUT_MS
    jle  dt_exit
    cmp  eax, 600
    jbe  dt_g
    mov  eax, 600
dt_g:
    imul eax, eax, 256
    xor  edx, edx
    mov  ecx, 600
    div  ecx
    mov  esi, eax
    mov  rcx, hDC
    mov  rdx, hFontD2
    call SelectObject
    mov  eax, 0E0E0E0h
    mov  ecx, esi
    call ScaleColor
    mov  r9d, eax
    mov  ecx, SCRW/2
    mov  edx, 345
    lea  r8, strDeathPrompt
    call TextCentered
    mov  rcx, hDC
    mov  rdx, hFontD3
    call SelectObject
    mov  eax, 0A0A0A0h
    mov  ecx, esi
    call ScaleColor
    mov  r9d, eax
    mov  ecx, SCRW/2
    mov  edx, 400
    lea  r8, strDeathEsc
    call TextCentered
dt_exit:
    add  rsp, 40
    pop  rsi
    pop  rbx
    ret
DeathText ENDP

main PROC
    sub  rsp, 120

    xor  ecx, ecx
    call GetModuleHandleA
    mov  hInst, rax

    lea  rbx, wc
    mov  dword ptr [rbx], 80
    mov  dword ptr [rbx+4], 3
    lea  rax, WndProc
    mov  [rbx+8], rax
    mov  rax, hInst
    mov  [rbx+24], rax
    xor  ecx, ecx
    mov  edx, 32512
    call LoadCursorA
    mov  [rbx+40], rax
    mov  hArrow, rax
    mov  curCursor, rax
    xor  ecx, ecx
    mov  edx, 32649
    call LoadCursorA
    mov  hHand, rax
    lea  rcx, curNormalName
    call LoadCursorFromFileA
    test rax, rax
    jz   no_ncur
    mov  hArrow, rax
    mov  curCursor, rax
no_ncur:
    lea  rcx, curHoverName
    call LoadCursorFromFileA
    test rax, rax
    jz   no_hcur
    mov  hHand, rax
no_hcur:
    mov  qword ptr [rbx+48], 6
    lea  rax, className
    mov  [rbx+64], rax
    mov  rcx, rbx
    call RegisterClassExA

    xor  ecx, ecx
    lea  rdx, className
    lea  r8, windowTitle
    mov  r9d, 10CA0000h
    mov  dword ptr [rsp+32], 80000000h
    mov  dword ptr [rsp+40], 80000000h
    mov  dword ptr [rsp+48], 1296
    mov  dword ptr [rsp+56], 759
    mov  qword ptr [rsp+64], 0
    mov  qword ptr [rsp+72], 0
    mov  rax, hInst
    mov  [rsp+80], rax
    mov  qword ptr [rsp+88], 0
    call CreateWindowExA
    mov  hWnd, rax

    lea  rcx, sheetName
    lea  rdx, sheetFile
    mov  r8d, 23000000
    call LoadBmp
    mov  sheetPixels, rax
    mov  sheetW, edx
    lea  rcx, weapName
    lea  rdx, weapFile
    mov  r8d, 16000000
    call LoadBmp
    mov  weapPixels, rax
    mov  weapW, edx
    lea  rcx, curSheetName
    lea  rdx, curFile
    mov  r8d, 262144
    call LoadBmp
    mov  curPixels, rax
    mov  curSheetW, edx
    call LoadMonsterSheets
    lea  rcx, headName
    lea  rdx, headFile
    mov  r8d, 23000000
    call LoadBmp
    mov  headPixels, rax
    mov  headW, edx
    lea  rax, msgNoBody
    cmp  sheetPixels, 0
    je   ps_bad
    lea  rax, msgOldSheet
    cmp  sheetW, PSHEETW
    jne  ps_bad
    lea  rax, msgNoHead
    cmp  headPixels, 0
    je   ps_bad
    lea  rax, msgOldSheet
    cmp  headW, PSHEETW
    jne  ps_bad
    cmp  weapPixels, 0
    je   ps_ok
    cmp  weapW, WSHEETW
    je   ps_ok
ps_bad:
    mov  sheetPixels, 0
    mov  headPixels, 0
    mov  weapPixels, 0
    mov  msgPtr, rax
ps_ok:
    lea  rcx, iconName
    lea  rdx, iconFile
    mov  r8d, 200000
    call LoadBmp
    mov  iconPixels, rax
    mov  iconW, edx
    cmp  iconW, ICON_SZ*13
    je   ic_ok
    mov  iconPixels, 0
ic_ok:
    lea  rcx, menuBgName
    lea  rdx, menuBgFile
    mov  r8d, 3700000
    call LoadBmp
    mov  menuBgPixels, rax
    cmp  edx, SCRW
    jne  mb_bad
    lea  rax, menuBgFile
    cmp  dword ptr [rax+22], -SCRH
    je   mb_ok
mb_bad:
    mov  menuBgPixels, 0
mb_ok:
    lea  rcx, cfName
    lea  rdx, cfFile
    mov  r8d, 120000
    call LoadBmp
    mov  cfPixels, rax
    cmp  edx, CF_W*7
    je   cf_ok
    mov  cfPixels, 0
cf_ok:
    lea  rcx, menuIcoName
    lea  rdx, menuIcoFile
    mov  r8d, 20000
    call LoadBmp
    mov  menuIcoPixels, rax
    cmp  edx, MI_SZ
    je   mi_ok
    mov  menuIcoPixels, 0
mi_ok:
    lea  rcx, bsName
    lea  rdx, bsFile
    mov  r8d, 210000
    call LoadBmp
    mov  bsPixels, rax
    cmp  edx, BS_W*5
    je   bs_ok
    mov  bsPixels, 0
bs_ok:
    lea  rcx, endingName
    lea  rdx, endFile
    mov  r8d, 3700000
    call LoadBmp
    mov  endImgPixels, rax
    cmp  edx, SCRW
    jne  ei_bad
    lea  rax, endFile
    cmp  dword ptr [rax+22], -SCRH
    je   ei_ok
ei_bad:
    mov  endImgPixels, 0
ei_ok:
    call LoadMaps
    call LoadGround
    IF FONT_H
    call MakeFont
    mov  hFont, rax
    ENDIF
    lea  r8, fontMenuName
    mov  ecx, 60
    mov  edx, 700
    call MakeFontEx
    mov  hFontTitle, rax
    lea  r8, fontMenuName
    mov  ecx, 28
    mov  edx, 600
    call MakeFontEx
    mov  hFontMenu, rax
    lea  r8, fontMenuName
    mov  ecx, 20
    mov  edx, 400
    call MakeFontEx
    mov  hFontSmall, rax
    lea  r8, fontDeathName
    mov  ecx, 60
    mov  edx, 700
    call MakeFontEx
    mov  hFontD1, rax
    lea  r8, fontDeathName
    mov  ecx, 28
    mov  edx, 600
    call MakeFontEx
    mov  hFontD2, rax
    lea  r8, fontDeathName
    mov  ecx, 20
    mov  edx, 400
    call MakeFontEx
    mov  hFontD3, rax
    call SetMap
    call PlaceAtSpawn
    call InitEnemyStats
    call SnapshotEntities
    cmp  mapLoaded, 0
    jne  maps_ok
    lea  rax, msgNoMaps
    mov  msgPtr, rax
maps_ok:
    call GetTickCount64
    mov  menuTick, rax
    or   eax, 1
    mov  rng, eax

frame_loop:
msg_pump:
    lea  rcx, msg
    xor  edx, edx
    xor  r8d, r8d
    xor  r9d, r9d
    mov  qword ptr [rsp+32], 1
    call PeekMessageA
    test eax, eax
    jz   no_msg
    cmp  dword ptr [msg+8], 12h
    je   quit
    lea  rcx, msg
    call TranslateMessage
    lea  rcx, msg
    call DispatchMessageA
    jmp  msg_pump
no_msg:
IF DEV_KEYS
    call GetForegroundWindow
    cmp  rax, hWnd
    jne  fk_done
    xor  r13d, r13d
    xor  r12d, r12d
fk_loop:
    lea  ecx, [r12+70h]
    call GetAsyncKeyState
    test ax, 8000h
    jz   fk_next
    bts  r13d, r12d
    mov  eax, fkHeld
    bt   eax, r12d
    jc   fk_next
    mov  eax, r12d
    call JumpToMap
fk_next:
    inc  r12d
    cmp  r12d, 8
    jb   fk_loop
    mov  fkHeld, r13d
fk_done:
ENDIF
    call GetTickCount64
    mov  r8, rax
    mov  rcx, r8
    sub  rcx, lastReal
    mov  lastReal, r8
    cmp  gameState, 2
    jne  gs_clk
    add  pauseTotal, rcx
gs_clk:
    mov  rax, r8
    sub  rax, pauseTotal
    mov  nowTick, rax
    cmp  gameState, 0
    jne  gs_nomenu
    call MenuFrame
    cmp  menuQuit, 0
    jne  quit
    jmp  blit_frame
gs_nomenu:
    cmp  gameState, 2
    jne  gs_chk3
    call PauseFrame
    jmp  render_frame
gs_chk3:
    cmp  gameState, 3
    jne  gs_play
    call EndingFrame
    test eax, eax
    jnz  render_frame
    call EndingDraw
    jmp  blit_frame
gs_play:
    sub  rax, stepStart
    mov  ecx, stepDur
    cmp  rax, rcx
    jb   skip_input
    cmp  pAct, 6
    je   skip_input
    call CheckWarp
    call GetForegroundWindow
    cmp  rax, hWnd
    jne  skip_input

    xor  r14d, r14d
    xor  r15d, r15d
    lea  r12, keys
    mov  r13d, 8
key_loop:
    mov  ecx, [r12]
    call GetAsyncKeyState
    test ax, 8000h
    jz   key_next
    add  r14d, [r12+4]
    add  r15d, [r12+8]
key_next:
    add  r12, 12
    dec  r13d
    jnz  key_loop
    cmp  r14d, 1
    jle  cl1
    mov  r14d, 1
cl1:
    cmp  r14d, -1
    jge  cl2
    mov  r14d, -1
cl2:
    cmp  r15d, 1
    jle  cl3
    mov  r15d, 1
cl3:
    cmp  r15d, -1
    jge  cl4
    mov  r15d, -1
cl4:
    mov  eax, r14d
    or   eax, r15d
    jnz  kb_cancel
    mov  eax, pathPos
    cmp  eax, pathLen
    jb   pw_step
    mov  rsi, pendingEnt
    test rsi, rsi
    jz   skip_input
    mov  pendingEnt, 0
    call Interact
    jmp  skip_input
pw_step:
    lea  rcx, pathCells
    mov  eax, [rcx+rax*4]
    inc  pathPos
    xor  edx, edx
    mov  ecx, curW
    div  ecx
    mov  r15d, eax
    sub  r15d, playerY
    mov  r14d, edx
    sub  r14d, playerX
    jmp  kh_dir
kb_cancel:
    mov  pathLen, 0
    mov  pathPos, 0
    mov  pendingEnt, 0
kh_dir:
    mov  eax, r15d
    inc  eax
    imul eax, eax, 3
    mov  ecx, r14d
    inc  ecx
    add  eax, ecx
    lea  rcx, dirTab
    mov  eax, [rcx+rax*4]
    mov  facing, eax

    mov  esi, playerX
    add  esi, r14d
    mov  edi, playerY
    add  edi, r15d
    call FindEntity
    test rax, rax
    jz   kh_cell
    jmp  skip_input
kh_cell:
    mov  eax, r14d
    test eax, eax
    jz   kh_target
    mov  eax, r15d
    test eax, eax
    jz   kh_target
    mov  esi, playerX
    add  esi, r14d
    mov  edi, playerY
    call GetCell
    cmp  al, '#'
    je   skip_input
    mov  esi, playerX
    mov  edi, playerY
    add  edi, r15d
    call GetCell
    cmp  al, '#'
    je   skip_input
    mov  esi, playerX
    add  esi, r14d
    mov  edi, playerY
    add  edi, r15d
kh_target:
    call GetCell
    cmp  al, '#'
    je   skip_input
    cmp  al, '.'
    je   kh_walk
    sub  eax, '0'
    call ChangeMap
    jmp  skip_input
kh_walk:
    mov  pAct, 0
    mov  rax, nowTick
    sub  rax, stepStart
    mov  ecx, stepDur
    add  ecx, 40
    cmp  rax, rcx
    jae  kh_fresh
    mov  eax, stepDur
    add  rax, stepStart
    jmp  kh_set
kh_fresh:
    mov  rax, nowTick
    mov  animBase, rax
kh_set:
    mov  stepStart, rax
    mov  eax, playerX
    mov  stepFromX, eax
    mov  eax, playerY
    mov  stepFromY, eax
    mov  playerX, esi
    mov  playerY, edi
    mov  stepDur, STEP_MS
    mov  eax, r14d
    imul eax, r15d
    test eax, eax
    jz   skip_input
    mov  stepDur, STEP_DIAG
skip_input:
    call BagInput
    call DeathInput
    cmp  pauseReq, 0
    je   no_pausereq
    mov  pauseReq, 0
    cmp  pAct, 6
    je   no_pausereq
    cmp  gameState, 1
    jne  no_pausereq
    mov  gameState, 2
    mov  pauseSel, 0
    lea  rax, keyDown
    mov  byte ptr [rax+1Bh], 1
no_pausereq:

    mov  ecx, dword ptr [mousePt]
    mov  edx, dword ptr [mousePt+4]
    call EntityAtPixel
    mov  rsi, rax
    mov  hoverEnt, rax
    mov  rax, hArrow
    test rsi, rsi
    jz   ms_pick
    mov  rax, hHand
ms_pick:
    cmp  curPixels, 0
    je   ms_pick2
    xor  eax, eax
ms_pick2:
    mov  curCursor, rax
    mov  eax, clickPending
    test eax, eax
    jz   ms_done
    mov  clickPending, 0
    cmp  pAct, 6
    je   ms_done
    test rsi, rsi
    jz   ms_done
    mov  eax, [rsi+4]
    sub  eax, playerX
    add  eax, 5
    cmp  eax, 10
    ja   ms_far
    mov  eax, [rsi+8]
    sub  eax, playerY
    add  eax, 5
    cmp  eax, 10
    ja   ms_far
    mov  eax, [rsi+4]
    sub  eax, playerX
    inc  eax
    cmp  eax, 2
    ja   ms_walk
    mov  eax, [rsi+8]
    sub  eax, playerY
    inc  eax
    cmp  eax, 2
    ja   ms_walk
    call Interact
    jmp  ms_done
ms_walk:
    mov  pathTarget, rsi
    call FindPath
    cmp  eax, 0
    jle  ms_nopath
    mov  pendingEnt, rsi
    lea  rax, msgEmpty
    mov  msgPtr, rax
    jmp  ms_done
ms_nopath:
    lea  rax, msgNoPath
    mov  msgPtr, rax
    jmp  ms_done
ms_far:
    lea  rax, msgTooFar
    mov  msgPtr, rax
ms_done:

    call UpdatePlayerAct
    call UpdateRest
    call UpdateEnemies
    cmp  endAt, 0
    je   no_endtrig
    cmp  pAct, 6
    je   no_endtrig
    mov  rax, nowTick
    cmp  rax, endAt
    jb   no_endtrig
    mov  endAt, 0
    mov  endStart, rax
    mov  gameState, 3
no_endtrig:
    mov  rax, dlgEnt
    test rax, rax
    jz   dl_done
    mov  ecx, [rax+4]
    sub  ecx, playerX
    add  ecx, DLG_RANGE
    cmp  ecx, DLG_RANGE*2
    ja   dl_clear
    mov  ecx, [rax+8]
    sub  ecx, playerY
    add  ecx, DLG_RANGE
    cmp  ecx, DLG_RANGE*2
    jbe  dl_done
dl_clear:
    mov  dlgEnt, 0
    mov  dlgPtr, 0
dl_done:
render_frame:
    call Render
    cmp  gameState, 3
    jne  no_ending
    call EndingDraw
    jmp  blit_frame
no_ending:
    cmp  pAct, 6
    jne  no_death
    call DeathOverlay
no_death:
    call DrawMinimap
    call DrawQuickbar
    cmp  bagOpen, 0
    je   no_bag
    call DrawBag
no_bag:
    cmp  gameState, 2
    jne  no_pausedraw
    call PauseDraw
    call DrawArrowCursor
    jmp  no_swcur
no_pausedraw:
    cmp  curPixels, 0
    je   no_swcur
    cmp  mouseIn, 0
    je   no_swcur
    call CursorState
    mov  rax, nowTick
    xor  edx, edx
    mov  ecx, CUR_FRAME_MS
    div  ecx
    xor  edx, edx
    div  r11d
    add  edx, r10d
    mov  eax, edx
    mov  ecx, dword ptr [mousePt]
    sub  ecx, r8d
    mov  edx, dword ptr [mousePt+4]
    sub  edx, r9d
    mov  r8d, eax
    call DrawCursorCell
no_swcur:
blit_frame:
    mov  rcx, hWnd
    call GetDC
    mov  hDC, rax
    mov  rcx, rax
    xor  edx, edx
    xor  r8d, r8d
    mov  r9d, SCRW
    mov  qword ptr [rsp+32], SCRH
    mov  qword ptr [rsp+40], 0
    mov  qword ptr [rsp+48], 0
    mov  qword ptr [rsp+56], SCRW
    mov  qword ptr [rsp+64], SCRH
    lea  rax, pixels
    mov  [rsp+72], rax
    lea  rax, bmi
    mov  [rsp+80], rax
    mov  qword ptr [rsp+88], 0
    mov  qword ptr [rsp+96], 00CC0020h
    call StretchDIBits

    mov  rcx, hDC
    mov  edx, 1
    call SetBkMode
    IF FONT_H
    mov  rcx, hDC
    mov  rdx, hFont
    call SelectObject
    ENDIF
    cmp  gameState, 0
    jne  txt_game
    call MenuText
    jmp  txt_done
txt_game:
    cmp  gameState, 3
    jne  txt_g2
    call EndingText
    jmp  txt_done
txt_g2:
    cmp  gameState, 2
    jne  txt_play
    call PauseText
    jmp  txt_done
txt_play:
    call DrawHud
    call DrawQuickText
    cmp  bagOpen, 0
    je   no_bagtxt
    call DrawBagText
no_bagtxt:
    call DrawNums
    call DrawDialogue
    cmp  pAct, 6
    jne  txt_done
    call DeathText
txt_done:

    mov  rcx, hWnd
    mov  rdx, hDC
    call ReleaseDC
    mov  ecx, 12
    call Sleep
    jmp  frame_loop

quit:
    xor  ecx, ecx
    call ExitProcess
main ENDP

END