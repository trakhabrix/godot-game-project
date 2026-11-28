Pixel Burst VFX: Status Effects & Loot Rarity · FREE v1.0
==========================================================

8 animated pixel art effects + 6 status icons for any 2D game: burn, poison, stun stars and sleep Zzz loops,
a buff pillar, a rare loot beam, a drop sparkle and a pixel dissolve death.
Free for commercial use. Every pixel is drawn by our own code. No generative AI was used.

The FULL pack has 44 effects (18 status loops, 9 apply/remove one-shots, 12 loot rarity effects in 6 rarity
colours, 5 death effects: dissolve, burn to ash, petrify, soul release, melt) + 18 icons, 114 animations, 4x sheets:
https://dotplays.itch.io/pixel-burst-status-loot

EFFECTS
  status_burn             48x48  10 frames  loop      Burn
  status_poison           48x48  12 frames  loop      Poison
  status_stun             48x48   8 frames  loop      Stun stars
  status_sleep            48x48  12 frames  loop      Sleep Zzz
  apply_buff              48x48  10 frames  one-shot  Buff pillar
  loot_beam               48x48  10 frames  loop      Loot beam (rare)
  loot_drop_sparkle       32x32   9 frames  one-shot  Drop sparkle
  death_dissolve          48x48  12 frames  one-shot  Pixel dissolve

ICONS (16x16 and 32x32): burn, freeze, poison, stun, sleep, regen

FILES
  sheets/1x/, 2x/   horizontal sprite sheets (transparent PNG)
  frames/           every frame as its own PNG
  gif_previews/     4x previews
  godot/            Godot 4 SpriteFrames (.tres)
  icons/            status icons
  effects.json      frame size, frame count, fps, loop, pivot and sheet path

HOW TO PLACE THEM
  Status effects (status_*, apply_*, remove_*, death_*) are 48x48 overlays drawn around a character about 16 px
  wide and 30 px tall, standing with its feet at y=44 of the frame (pivot "feet" in effects.json). Put the
  bottom-centre of your character at (24, 44) of the frame and draw the effect on top. For bigger sprites,
  use the 2x or 4x sheets. A few effects follow that body shape closely (freeze and poison tints, ice encase,
  shield dome, invisibility outline, the death set); they fit most small humanoids. Hide or fade your own
  sprite while a death effect plays: the dissolve, ash, melt and soul effects replace the body.
  Loot effects use pivot "bottom": put the item on the bottom-centre of the frame (about 6 px up).
  The slot frame and the outline pulses use pivot "center". The outline pulses include the sword and gem art.
  Some pixels use real semi-transparent alpha (tints, ice, shield dome); keep the PNG alpha.

GODOT 4
  Copy the pack folder anywhere under res://. Project Settings > Rendering > Textures > Default Texture Filter = Nearest.
  Add an AnimatedSprite2D as a child of your character, drag a godot/.../<effect>.tres into Sprite Frames, press play.
  One-shot effects have loop off: connect animation_finished to queue_free(). Offset the sprite by (0, -20) so
  the frame point (24, 44) sits on the character's feet.

UNITY
  Import a sheet, Texture Type Sprite (2D and UI), Sprite Mode Multiple, Filter Point, Compression None.
  Sprite Editor > Slice > Grid By Cell Size (frame size from the table above), Custom Pivot (0.5, 0.083) for the
  48 px status effects (the feet point), then drag the slices into the scene to make an animation clip.

PHASER / OTHERS
  this.load.spritesheet('burn', 'sheets/1x/status/status_burn.png', { frameWidth: 48, frameHeight: 48 });
  Frame sizes and pivots are in effects.json, so you can load everything in a loop. Suggested speed 10 fps.
