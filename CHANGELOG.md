# Changelog

## 2.5.1

### Fixed
- **Johnny's head vanishing in the mirror cutscene** (V and Johnny mirroring each other's movements), leaving only the eyes, teeth, hair and glasses. The fox face's normal material used the fade-capable `metal_base_blendable.mt` shader. It now uses `metal_base.remt`, like the fox body. The fade version is kept as a separate material for fade-in/out only.
- **Eyes, teeth, body and arm decals not fading out** with the rest of Johnny during his fade/glitch effects. Their "blendable" material slots pointed to shaders that can't fade.

| Mesh | Slot | Was | Now |
|---|---|---|---|
| `h0_001_ma_c__silverhand.mesh` | `_skinShader_ma`, `_skinShader_ma_copya`, `_no_skullcap` | `silverfox_face.mi` on `metal_base_blendable.mt` | `silverfox_face.mi` on `metal_base.remt` |
| `h0_001_ma_c__silverhand.mesh` | `_skinShader_ma_blendable`, `_no_skullcap_blendable` | `silverfox_face.mi` | `silverfox_face_blendable.mi` (new) |
| `ht_001_ma_c__silverhand.mesh` | `teeth_MAT_blendable` | `teeth_base.mi` | `base\materials\skin_blendable.mt` (vanilla) |
| `he_001_ma_c__silverhand.mesh` | `eyeMat3_blendable` | `eyes03.mi` | `silverfox_eyes_blendable.mi` (new) |
| `t0_001_ma_body__silverhand.mesh` | `skin_body_blendable`, `skin_body_legs_blendable` | `silverfox_body.mi` | `silverfox_body_blendable.mi` (new) |
| `a0_001_ma_arms__silverhand.mesh`, `a0_001_ma_arms__silverhand_damaged.mesh` | `decal_blendable` | `mesh_decal.mt` | `mesh_decal_blendable.mt` (vanilla) |

The new `*_blendable.mi` materials use the same textures as their normal versions on `metal_base_blendable.mt`. Normal (non-fading) appearance is unchanged apart from the face shader fix.

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
