$array = [collections.arraylist]@(
    "abcde",
    "fghij",
    "klmno",
    "pqrst",
    "fguij",
    "axcye",
    "wvxyz"
)

$hashset = new-object 'System.Collections.Generic.HashSet[string]'

[collections.arraylist]$array = Get-Content .\aoc-2_2-input.txt
foreach ($i in (0 .. ($array.Count -2))) {
        $j = $i +1
        foreach ($m in ($j .. ($array.Count -1))) {
            $comp = Compare-Object $array[$i].ToCharArray() $array[$m].ToCharArray() -IncludeEqual
            if (($comp | Where-Object {$_.SideIndicator -ne "=="}).Count -eq 2)
                {
                    Write-Output "---------------"
                    Write-Output "string"
                    -join (($comp |
                        Where-Object {$_.SideIndicator -eq "=="})).InputObject
                    $array[$i]
                    $array[$m]
                    $comp
                    Write-Output "---------------"
                }
        }
}

