# Küsi kasutaja andmed
$eesnimi = Read-Host "Palun sisesta oma eesnimi"
$perenimi = Read-Host "Palun sisesta oma perekonnanimi"

# Loo kasutajanimi ja muud andmed
$kasutajanimi = ("$eesnimi.$perenimi").ToLower()
$taisnimi = "$eesnimi $perenimi"
$kirjeldus = "Kasutaja $taisnimi"

# Kontrolli, kas kasutaja juba eksisteerib
$olemas = Get-LocalUser -Name $kasutajanimi -ErrorAction SilentlyContinue

if ($olemas) {
    Write-Host "See kasutaja $kasutajanimi on juba olemas" -ForegroundColor Yellow
}
else {
    # Määra parool
    $parool = ConvertTo-SecureString "Parool1!" -AsPlainText -Force

    try {
        New-LocalUser `
            -Name $kasutajanimi `
            -Password $parool `
            -FullName $taisnimi `
            -Description $kirjeldus `
            -ErrorAction Stop

        Write-Host "Kasutaja nimega $kasutajanimi loodi edukalt" -ForegroundColor Green
    }
    catch {
        Write-Host "VIGA kasutaja loomisel:" -ForegroundColor Red
        Write-Host $_.Exception.Message -ForegroundColor Red
    }
}