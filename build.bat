@echo off
rem Run from the "x64 Native Tools Command Prompt for VS", in this folder.
rem Deletes the old game.exe first so a failed build can't run stale code.
if exist game.exe del game.exe
if not exist enemies.inc (
  echo enemies.inc is missing: it must sit next to game.asm. Make it with place_enemies.py ^(see the guide^).
  goto failed
)
if not exist campfires.inc (
  echo campfires.inc is missing: it must sit next to game.asm. Make it with place_enemies.py ^(see the guide^).
  goto failed
)
ml64 /nologo /Zi game.asm /link /nologo /debug /subsystem:windows /entry:main kernel32.lib user32.lib gdi32.lib
if errorlevel 1 goto failed
if not exist game.exe goto failed
echo Build OK - running...
game.exe
goto :eof
:failed
echo.
echo BUILD FAILED - read the error lines above. No game was started.
