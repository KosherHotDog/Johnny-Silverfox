param([string]$PatchedDir, [string]$OutDir)
# Fade-capable twins of the fox materials: same parameters, metal_base_blendable.mt shader.
$utf8 = New-Object System.Text.UTF8Encoding($false)
$base = 'engine\\materials\\metal_base.remt'
$blend = 'engine\\materials\\metal_base_blendable.mt'

$body = [IO.File]::ReadAllText((Join-Path $PatchedDir 'silverfox_body.mi.json'))
if (-not $body.Contains($base)) { throw 'body: base not found' }
[IO.File]::WriteAllText((Join-Path $OutDir 'silverfox_body_blendable.mi.json'), $body.Replace($base, $blend), $utf8)

# Eyes mirror BioExotics Expanded eyes03.mi (eye_d03 on eyes_base: grey metalness, jaguar roughness).
$eyes = [IO.File]::ReadAllText((Join-Path $PatchedDir 'silverfox_eyes.mi.json'))
$eyes = $eyes.Replace($base, $blend)
$eyes = $eyes.Replace('base\\characters\\main_npc\\silverhand\\h0_001_ma_c__silverhand\\textures\\he_001_ma_c__silverhand_d01.xbm', 'bioexotics_expanded\\textures\\eyes\\eye_d03.xbm')
$eyes = [regex]::Replace($eyes, '("Metalness": \{\s*"DepotPath": \{[^}]*?"\$value": ")engine\\\\textures\\\\editor\\\\black\.xbm', '${1}engine\\textures\\editor\\grey.xbm')
[IO.File]::WriteAllText((Join-Path $OutDir 'silverfox_eyes_blendable.mi.json'), $eyes, $utf8)
