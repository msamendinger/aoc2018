$c = Get-Content .\aoc-1_2-input.txt
$f = 0
$i = $false
$fa = [collections.arraylist]@($f)
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
} while ($i -eq $false)
$i
