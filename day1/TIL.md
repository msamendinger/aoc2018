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

```powershell
Measure-Command part1
Days              : 0
Hours             : 0
Minutes           : 0
Seconds           : 0
Milliseconds      : 14
Ticks             : 143558
TotalDays         : 1,66155092592593E-07
TotalHours        : 3,98772222222222E-06
TotalMinutes      : 0,000239263333333333
TotalSeconds      : 0,0143558
TotalMilliseconds : 14,3558
```

```powershell
Measure-Command part2
Days              : 0
Hours             : 0
Minutes           : 0
Seconds           : 38
Milliseconds      : 848
Ticks             : 388482992
TotalDays         : 0,000449633092592593
TotalHours        : 0,0107911942222222
TotalMinutes      : 0,647471653333333
TotalSeconds      : 38,8482992
TotalMilliseconds : 38848,2992
```