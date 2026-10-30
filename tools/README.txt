Prop tools: the 3D models on the Clock Tower maps, baked into sprites for game.asm
======================================================================================
Needs: python 3, pip install numpy pillow scipy

1. Put the original Clock Tower map files (1@ctf1.gat ... 1@ctb4.gat) in one folder and copy rsw_models.json (here) into it.
   rsw_models.json holds every model placement (name, position, rotation, scale) read from the eight .rsw files.
2. Bake (a few seconds per map):
     python bake_props.py  <map folder>  <folder with the .rsm files>  "<texture folder>;<another texture folder>"  <output folder>  ctb4 ctb2 ctb1
   -> <output folder>/<map>.prp   (copy into the game's maps\ folder)
3. Rebuild the wall heights (stand-in pillars are dropped wherever a real model stands) and the wall textures:
     python gat_to_walls.py  <map folder>  <output folder>  3.2  <folder with the .prp files>
   -> <output folder>/<map>.hgt  (heights)
      <output folder>/<map>.wtx  (which texture each wall cell uses)
      <output folder>/<map>.wuv  (which PIECE of that texture sheet: the original map gives every wall face its own piece)
   Copy all three into the game's maps folder.  Delete the .wuv files to tile whole sheets instead, or the .wtx files too to
   go back to one texture per map.  FLOOR_ONLY in gat_to_walls.py lists the floor-only textures that are never used on walls.
4. Preview a region without running the game (cells are columns / rows from the north):
     python preview.py  ctb4  <x0> <y0> <width> <height>  out.png  <folder with .col/.hgt>   (needs the .prp in props/out)

mesh.py has LID_MODELS: the crates, barrels and cabinets whose original models have no top face and get a lid added (add a model's name, without .rsm, to give it one).
raster.py draws every face (cull=False): several models have faces wound the wrong way and vanish if back faces are skipped.

Settings you may want to change are at the top of bake_props.py (FLAT_PX, FLAT_LIFT: what counts as a flat floor prop)
and raster.py (PX_X, PX_Z, PX_H: the projection, which must match the game; ambient: how dark the shaded sides are).
