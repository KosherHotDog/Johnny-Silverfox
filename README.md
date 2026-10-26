# Johnny Silverfox – 2.5 Update

An updated build of the **Johnny Silverfox – Replacer** mod for Cyberpunk 2077, fixed to work with **game version 2.5** and **BioExotics Expanded**.

Original mod: [Johnny Silverfox – Replacer on Nexus Mods (#11848)](https://www.nexusmods.com/cyberpunk2077/mods/11848). All credit for the model, textures and concept goes to the original author. This update only fixes compatibility.

## Requirements

- Cyberpunk 2077 **2.5**
- [BioExotics Expanded](https://www.nexusmods.com/cyberpunk2077/search/?gsearch=bioexotics%20expanded) (required: the fox textures and eye material come from it)

## Installation

**Vortex / Mod Organizer 2:** install the zip from the [latest release](../../releases/latest) like any other mod.

**Manual:** extract the zip into your Cyberpunk 2077 game folder, so you end up with:

```
Cyberpunk 2077/archive/pc/mod/ZZ_Johnny_Silverfox.archive
```

If you had the original version installed, remove it first. This file replaces it.

## What was fixed

The original archive was built before patch 2.0 and could cause crashes on current versions:

1. **Removed 5 outdated vanilla files** that were packed in by accident and contained no mod changes:
   - `base\characters\appearances\main_npc\silverhand.app`
   - `base\characters\appearances\quest_temp\man_average.app`
   - `base\characters\entities\main_npc\silverhand.ent`
   - `base\characters\entities\player\replacer\johnny_silverhand_replacer.ent`
   - `base\quest\primary_characters\johnny.ent`

   These were pre-2.0 copies that overwrote the game's current versions. `man_average.app` is shared by many generic NPCs, so the issue went beyond Johnny.

2. **Updated 8 broken references** from the old BioExotics layout (`base\characters\exoticsco\...`) to BioExotics Expanded (`bioexotics_expanded\...`). This includes the eye material `eyes03.mi`, which no longer existed at its old path.

3. **Fixed Johnny's head disappearing** in the mirror cutscene. The fox face used a fade-only shader for its normal look.

4. **Fixed eyes, teeth, body and arm decals staying visible** when Johnny fades or glitches out.

The fox meshes and textures are unchanged. Their appearances, material slots and rig match the 2.5 vanilla meshes. See [CHANGELOG.md](CHANGELOG.md) for full details.
