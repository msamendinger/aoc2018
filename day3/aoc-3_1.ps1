# Create 2-dimensional array
$aoc31 = Get-Content .\aoc-3_1-input.txt
$counter = 0

function Test-Coordinates {
    param (
        [int]$x,
        [int]$y,
        [int]$id
    )
    # Test if coordinate is already set
    if ($mat[$y,$x]) {
        if ($mat[$y,$x] -ne "X") {
            $global:counter++
            $mat[$y,$x] = "X"
        }
    }
    else {
        $mat[$y, $x] = $id
    }    
}

$maxx = 0
$maxy = 0
foreach ($l in $aoc31) {
    $lc = $l -split " "
    [int]$x = [convert]::ToInt32(($lc[2] -replace ":" -split ",")[0], 10)
    [int]$y = [convert]::ToInt32(($lc[2] -replace ":" -split ",")[1], 10)
    [int]$xp = $x + [convert]::ToInt32(($lc[3] -split "x")[0], 10) -1
    [int]$yp = $y + [convert]::ToInt32(($lc[3] -split "x")[1], 10) -1
    $id = $lc[0]
    if ($xp -gt $maxx) {
        $maxx = $xp + 1
    }
    if ($yp -gt $maxy) {
        $maxy = $yp + 1
    }
    if ($id -eq "#661") { Write-Host $id $maxx $maxy}
}


$mat = New-Object 'object[,]' $maxy,$maxx
foreach ($l in $aoc31) {
    $lt = $l -split " "
    $id = $lt[0]
    [int]$x = [convert]::ToInt32(($lt[2] -replace ":" -split ",")[0], 10)
    [int]$y = [convert]::ToInt32(($lt[2] -replace ":" -split ",")[1], 10)
    [int]$xp = $x + [convert]::ToInt32(($lt[3] -split "x")[0], 10) -1
    [int]$yp = $y + [convert]::ToInt32(($lt[3] -split "x")[1], 10) -1

    foreach ($i in ($x .. $xp)) {
        foreach ($j in ($y .. $yp)) {
            if ($j -ge $maxy) {write-host "id" $id "j" $j "yp" $yp "i" $i "xp" $xp}
            Test-Coordinates -x $i -y $j -id $id
        }
    }
} 
$counter
