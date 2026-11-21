HALLOWEEN ASSET PACK  v1.0
TizWildin Entertainment

CONTENTS
--------
sprites/
  1x/                16x16 PNG, transparent, one file per sprite/frame (17 files)
  4x/                64x64 PNG, nearest-neighbour upscale of the same
  animated/          GIF previews: bat, candle, ghost_float
  spritesheet.png    128x48 atlas (8 columns, 16x16 cells)
  spritesheet_4x.png 512x192 atlas
  spritesheet.json   frame name -> {x, y, w, h}

  Sprites: pumpkin, jackolantern, ghost, skull, tombstone, witch_hat, cauldron,
           candy, spider
  Animations: bat (2 frames: bat_0, bat_1), candle (2 frames: candle_0, candle_1),
              ghost_float (4 frames: ghost_float_0..3, loop 0-1-2-3)

audio/sfx/           14 sound effects, WAV (44.1 kHz, 16-bit, mono) + OGG
  ghost_wail, creaky_door, bat_flutter, thunder, cauldron_bubbles, pumpkin_smash,
  bell_toll, wolf_howl, heartbeat, jumpscare_sting, pickup_candy, hurt,
  powerup_spooky, witch_cackle

audio/music/         2 seamless loops, WAV + OGG
  haunted_hollow_loop         30.0 s, 64 BPM, A minor, ambient (8 bars)
  pumpkin_patch_chase_loop    27.4 s, 140 BPM, E minor, chiptune (16 bars)

cover_630x500.png    itch.io cover image
LICENSE.txt          usage terms

PALETTE (sprites)
-----------------
Outline #1A1020 | Orange #F28C28 #B55A14 #FFC064 | Green #3F8F3A #25602A
Ghost #F2F2FA #B9BDD0 | Glow #FFD84A #FFF4AA | Purple #6B3FA0 #43276B
Red #C0392B | Stone #8A8D9E #5A5D6E | Brown #6B4226 #3F2615
Bone #F0E6CD #C4B896 | Candy #E65AA0 #46C8C8

NOTES
-----
- Sprites are designed for nearest-neighbour scaling; disable texture smoothing.
- Music loops are seamless: set loop = true, no crossfade needed.
- Use the OGG files for web/HTML5 builds, WAV for engines that prefer uncompressed.
