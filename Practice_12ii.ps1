#Kuidas kävitada :
#countservice -status Running
#countservice -status Stopped

function countservice {
    param (
        [string]$status
    )

    $count = (Get-Service | Where-Object {$_.Status -eq $status}).Count
    Write-Host "Total services in $status state = $count"
}