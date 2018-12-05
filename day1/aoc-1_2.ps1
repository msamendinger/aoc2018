$c = Get-Content .\aoc-2-input.txt
$f = 0
$t = 0
$i = $null
$fa = [collections.arraylist]@()
$fa.Add($f)
do {
    $c | ForEach-Object {
        $f += $_
        if ($fa.Contains($f)) {
            $i = $f
            break
        }
        else {
            $fa.Add($f)    |Out-Null
        }
    } 
    $t += 1
    $t 
} while ($i -eq $null)
