# Changelog

## 2.5.0

Compatibility update for Cyberpunk 2077 2.5 and BioExotics Expanded.

### Removed
Outdated pre-2.0 vanilla files that overwrote current game data (no mod content in them):
- `base\characters\appearances\main_npc\silverhand.app`
- `base\characters\appearances\quest_temp\man_average.app`
- `base\characters\entities\main_npc\silverhand.ent`
- `base\characters\entities\player\replacer\johnny_silverhand_replacer.ent`
- `base\quest\primary_characters\johnny.ent`

### Fixed
Remapped references in `silverfox_body.mi`, `silverfox_eyes.mi`, `silverfox_face.mi` and `he_001_ma_c__silverhand.mesh`:

| Old path (no longer exists) | New path |
|---|---|
| `base\characters\exoticsco\fox\textures\fox_body_m01.xbm` | `bioexotics_expanded\textures\heads\fox_body_m01.xbm` |
| `base\characters\exoticsco\fox\textures\fox_body_r01.xbm` | `bioexotics_expanded\textures\heads\fox_body_r01.xbm` |
| `base\characters\exoticsco\fox\textures\fox_face_m01.xbm` | `bioexotics_expanded\textures\heads\fennec_face_m01.xbm` |
| `base\characters\exoticsco\fox\textures\fox_face_r01.xbm` | `bioexotics_expanded\textures\heads\fennec_face_r01.xbm` |
| `base\characters\common\player_base_bodies\player_female_average\jaguar\textures\jaguar_body_n01.xbm` | `bioexotics_expanded\textures\bodyfemale\jaguar_bodyf_n01.xbm` |
| `base\characters\common\player_base_bodies\player_female_average\jaguar\textures\jaguar_eye_r01.xbm` | `bioexotics_expanded\textures\eyes\jaguar_eye_r01.xbm` |
| `base\characters\common\player_base_bodies\player_female_average\jaguar\textures\jaguar_eye_m01.xbm` | `engine\textures\editor\black.xbm` |
| `base\characters\exoticsco\playereyes\eyes03.mi` | `bioexotics_expanded\materials\eyes\eyes03.mi` |

The fox face metalness/roughness maps now match the ones BioExotics Expanded uses for its own fox head.

## 1.0

Original release on [Nexus Mods (#11848)](https://www.nexusmods.com/cyberpunk2077/mods/11848).
