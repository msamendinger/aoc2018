[collections.arraylist]$aoc2input = Get-Content .\aoc-2_1-input.txt
$Counter2 = 0
$Counter3 = 0
ForEach ($entry in $aoc2input) {
    $Counter2temp = $false
    $Counter3temp = $false
    [collections.arraylist]$entrycharunique = $entry.ToCharArray() |
        Select-Object -Unique
    ForEach ($i in (0 .. ($entrycharunique.Count -1))) {
        $charcount = [regex]::matches($entry,$entrycharunique[$i]).Count
        if ($charcount -eq 2 -and -not [bool]$Counter2temp) {
            $Counter2temp = $true
            $Counter2++
        }
        elseif ($charcount -eq 3 -and -not [bool]$Counter3temp) {
            $Counter3temp = $true
            $Counter3++
        }
    }
}
$Counter2 * $Counter3