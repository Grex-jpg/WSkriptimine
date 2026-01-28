function countstart {
    $count = (Get-Service | Where-Object {$_.Status -eq "Running"}).Count
    Write-Host "Töötavate teenuste koguarv = $count"
}

function countstop {
    $count = (Get-Service | Where-Object {$_.Status -eq "Stopped"}).Count
    Write-Host "Peatatud olekus teenuste koguarv = $count"
}