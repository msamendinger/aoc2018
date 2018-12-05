# Today I learned
Method Contains() can take a long time when comparing if a value is in array,
better use an arraylist

```powershell
$fa = [collections.arraylist]@($f)
````
arraylists get automatically converted to arrays if you use Powershell
enhancements

```powershell
PS C:\aoc2018\day1> $fa = [collections.arraylist]@(1,2,3)
PS C:\aoc2018\day1> $fa.GetType()

IsPublic IsSerial Name                                     BaseType
-------- -------- ----                                     --------
True     True     ArrayList                                System.Object


PS C:\aoc2018\day1> $fa += 4
$fa.GetType()

IsPublic IsSerial Name                                     BaseType
-------- -------- ----                                     --------
True     True     Object[]                                 System.Array
```

you need to use .add method to add values to arraylists

```powershell
PS C:\aoc2018\day1> $fa = [collections.arraylist]@(1,2,3)
PS C:\aoc2018\day1> $fa.GetType()

IsPublic IsSerial Name                                     BaseType
-------- -------- ----                                     --------
True     True     ArrayList                                System.Object


PS C:\aoc2018\day1> $fa.Add(4)
3
PS C:\aoc2018\day1> $fa.GetType()

IsPublic IsSerial Name                                     BaseType
-------- -------- ----                                     --------
True     True     ArrayList                                System.Object
```

reference: <https://www.madwithpowershell.com/2018/02/alternatives-to-arrays-for-enhanced.html>