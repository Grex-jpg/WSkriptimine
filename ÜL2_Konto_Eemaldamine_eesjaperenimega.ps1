# Küsi kasutaja andmed
$eesnimi = Read-Host "Sisesta kustutatava kasutaja eesnimi"
$perenimi = Read-Host "Sisesta kustutatava kasutaja perenimi"

# Loo kasutajanimi
$kasutajanimi = ("$eesnimi.$perenimi").ToLower()

# Kontrolli, kas kasutaja eksisteerib
$kasutaja = Get-LocalUser -Name $kasutajanimi -ErrorAction SilentlyContinue

if (-not $kasutaja) {
    Write-Host "Kasutajat $kasutajanimi ei leitud!" -ForegroundColor Yellow
}
else {
    try {
        Remove-LocalUser -Name $kasutajanimi -ErrorAction Stop
        Write-Host "Kasutaja $kasutajanimi kustutati edukalt!" -ForegroundColor Green
    }
    catch {
        Write-Host "VIGA kasutaja kustutamisel!" -ForegroundColor Red
        Write-Host $_.Exception.Message -ForegroundColor Red
    }
}