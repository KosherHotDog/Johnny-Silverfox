param([string]$InDir, [string]$OutDir)
# Old BioExotics paths -> BioExotics Expanded / engine equivalents. JSON escapes each backslash as \\.
$map = [ordered]@{
    'base\characters\exoticsco\fox\textures\fox_body_m01.xbm' = 'bioexotics_expanded\textures\heads\fox_body_m01.xbm'
    'base\characters\exoticsco\fox\textures\fox_body_r01.xbm' = 'bioexotics_expanded\textures\heads\fox_body_r01.xbm'
    'base\characters\exoticsco\fox\textures\fox_face_m01.xbm' = 'bioexotics_expanded\textures\heads\fennec_face_m01.xbm'
    'base\characters\exoticsco\fox\textures\fox_face_r01.xbm' = 'bioexotics_expanded\textures\heads\fennec_face_r01.xbm'
    'base\characters\common\player_base_bodies\player_female_average\jaguar\textures\jaguar_body_n01.xbm' = 'bioexotics_expanded\textures\bodyfemale\jaguar_bodyf_n01.xbm'
    'base\characters\common\player_base_bodies\player_female_average\jaguar\textures\jaguar_eye_r01.xbm' = 'bioexotics_expanded\textures\eyes\jaguar_eye_r01.xbm'
    'base\characters\common\player_base_bodies\player_female_average\jaguar\textures\jaguar_eye_m01.xbm' = 'engine\textures\editor\black.xbm'
    'base\characters\exoticsco\playereyes\eyes03.mi' = 'bioexotics_expanded\materials\eyes\eyes03.mi'
}
$utf8 = New-Object System.Text.UTF8Encoding($false)
foreach ($name in 'he_001_ma_c__silverhand.mesh', 'silverfox_body.mi', 'silverfox_eyes.mi', 'silverfox_face.mi') {
    $src = Join-Path $InDir "$name.json"
    $txt = [IO.File]::ReadAllText($src)
    $count = 0
    foreach ($k in $map.Keys) {
        $old = $k.Replace('\', '\\')
        $new = $map[$k].Replace('\', '\\')
        $hits = ([regex]::Matches($txt, [regex]::Escape($old))).Count
        if ($hits) { $txt = $txt.Replace($old, $new); $count += $hits }
    }
    [IO.File]::WriteAllText((Join-Path $OutDir "$name.json"), $txt, $utf8)
    "$name : $count replacements"
}
