New-Item -Path "C:\Temp\Test" -ItemType Directory -Force

Copy-Item "C:\Temp\SampleFile.csv" -Destination "C:\Temp\Test\"
Copy-Item "C:\Temp\Notepad1.txt" -Destination "C:\Temp\Test\"
Copy-Item "C:\Temp\Notepad2.txt" -Destination "C:\Temp\Test\"

Get-ChildItem "C:\Temp\Test"

$csv = Get-ChildItem "C:\Temp\Test" -Filter "*.csv"

$sizeKB = $csv.Length / 1KB
$sizeMB = $csv.Length / 1MB

Write-Output "Failinimi : $($csv.Name)"
Write-Output "Suurus (KB) : $sizeKB"
Write-Output "Suurus (MB) : $sizeMB"