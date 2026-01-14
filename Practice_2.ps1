$tööpäevad=@{John=12; Marry=20; Joe=18}

$päevapalk=@{John=100; Marry=120; Joe=150}

$salary = @{}

foreach ($name in $tööpäevad.Keys) {
    $salary[$name] = $tööpäevad[$name] * $päevapalk[$name]
}

$salary.GetEnumerator() | ForEach-Object {
    [PSCustomObject]@{
        Name   = $_.Key
        Salary = $_.Value
    }
}