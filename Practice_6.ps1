$info = Import-Csv C:\Users\Grexx\wskriptimine\Info.csv

$studentsWithSchool = $info | ForEach-Object {
    $school = if ([int]$_.Age -ge 4 -and [int]$_.Age -le 10) {
        "Junior"
    }
    elseif ([int]$_.Age -ge 11 -and [int]$_.Age -le 17) {
        "Senior"
    }
    else {
        "Unknown"
    }

    [PSCustomObject]@{
        Name   = $_.Name
        School = $school
    }
}
$studentsWithSchool | Format-Table

$studentsWithSchool | Export-Csv -Path "C:\Users\Grexx\wskriptimine\infovastus.txt" -NoTypeInformation