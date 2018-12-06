function Find-CommonChars {
    param (
        [string]$RefString,
        [string]$DiffString,
        [int]$diffby = 1
    )
    if ($RefString.Length -ne $DiffString.Length) {
        break
    }
    $diff = 0
    $length = $RefString.Length
    foreach ($c in 0 .. ($length -1)) {
        if ($RefString[$c] -ne $DiffString[$c]) {
            $diff++
            if ($diff -gt $diffby) {
                break
            }
        }
    }

    if ($diff -eq $diffby) {
        $comp = Compare-Object $RefString.ToCharArray() $DiffString.ToCharArray() -IncludeEqual 
        -join (($comp |
            Where-Object {$_.SideIndicator -eq "=="})).InputObject 
    }
}

[collections.arraylist]$array = Get-Content .\aoc-2_2-input.txt
foreach ($i in (0 .. ($array.Count -2))) {
    foreach ($j in (($i +1) .. ($array.Count -1))) {
        Find-CommonChars -RefString $array[$i] -DiffString $array[$j]
    }
}