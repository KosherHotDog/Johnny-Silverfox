param([string]$In, [string]$Out)
# Normal (non-fade) face material: same parameters on metal_base.remt, matching silverfox_body.mi.
$t = [IO.File]::ReadAllText($In)
$old = 'engine\\materials\\metal_base_blendable.mt'
if (-not $t.Contains($old)) { throw 'blendable base not found' }
[IO.File]::WriteAllText($Out, $t.Replace($old, 'engine\\materials\\metal_base.remt'), (New-Object System.Text.UTF8Encoding($false)))
