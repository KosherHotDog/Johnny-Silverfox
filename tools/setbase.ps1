param([string]$InFile, [string]$OutFile, [string]$Edits)
# Edits: "index=new\base\path;index=..." — sets baseMaterial of local material #index.
# Applied to both copies under localMaterialBuffer: "materials" (parsed) and rawData "Files".
$lines = [IO.File]::ReadAllLines($InFile)
$map = @{}
foreach ($e in $Edits -split ';') { $k, $v = $e -split '=', 2; $map[[int]$k] = $v.Replace('\', '\\') }

$lmb = ($lines | Select-String -Pattern '"localMaterialBuffer"' | Select-Object -First 1).LineNumber - 1
$end = ($lines | Select-String -Pattern '"localMaterialInstances"' | Select-Object -First 1).LineNumber - 1
$changed = 0
for ($i = $lmb; $i -lt $end; $i++) {
    if ($lines[$i] -notmatch '^\s*"(materials|Files)": \[\s*$') { continue }
    $depth = 0; $elem = -1; $done = @{}
    for ($j = $i; $j -lt $end; $j++) {
        $t = $lines[$j]
        $opens = ([regex]::Matches($t, '[\{\[]')).Count
        $closes = ([regex]::Matches($t, '[\}\]]')).Count
        if ($depth -eq 1 -and $t -match '^\s*\{') { $elem++ }
        $depth += $opens - $closes
        if ($depth -le 0) { break }
        if ($map.ContainsKey($elem) -and -not $done[$elem] -and $t -match '^\s*"baseMaterial": \{') {
            for ($k = $j + 1; $k -lt $j + 6; $k++) {
                if ($lines[$k] -match '^(\s*"\$value": ")([^"]*)(".*)$') {
                    "  material #$elem : $($Matches[2]) -> $($map[$elem])"
                    $lines[$k] = $Matches[1] + $map[$elem] + $Matches[3]
                    $done[$elem] = $true; $changed++
                    break
                }
            }
        }
    }
}
[IO.File]::WriteAllLines($OutFile, $lines, (New-Object System.Text.UTF8Encoding($false)))
"$changed edits written to $OutFile"
