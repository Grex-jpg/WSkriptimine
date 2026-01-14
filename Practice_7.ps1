$colors = @("Red", "Green", "Yellow", "Blue")
$students = 1..20

$studentGroups = $students | ForEach-Object {
    [PSCustomObject]@{
        RollNumber = $_
        Group = $colors | Get-Random
    }
}

$studentGroups | Format-Table