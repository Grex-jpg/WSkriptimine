$essa = Read-Host "Kirjutage mingi number"
$essa = [double]$essa

$teine = Read-Host "Nooo pane üks veel kirja"
$teine = [double]$teine

if ($essa -gt $teine) {
    Write-Host "Suurem number on! $essa"
}
elseif ($teine -gt $essa) {
    Write-Host "Suurem number on! $teine"
}
else {
    Write-Host "Mõlemad on võrdsed lihtsalt lihtsalt :("
}