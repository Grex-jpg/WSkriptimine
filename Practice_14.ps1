# system_report.ps1
# Eesmärk: Luua süsteemiaruanne koos kasutaja sisendi, tsüklite, tingimuslause ja cmdletidega
# Autor: [Sinu nimi]
# Kuupäev: [Kuupäev]

# ---------------------------------------
# 1️ Kasutaja sisend
# ---------------------------------------
$userName = Read-Host "Palun sisesta oma nimi"
$repeatCount = Read-Host "Mitu korda soovid tervitust kuvada?"

# Kontrollime, et $repeatCount oleks number
if (-not [int]::TryParse($repeatCount, [ref]$null)) {
    Write-Host "Sisestatud arv ei olnud korrektne. Kasutame vaikimisi 1 kord."
    $repeatCount = 1
} else {
    $repeatCount = [int]$repeatCount
}

# ---------------------------------------
# 2️ Tsükkel – tervitus
# ---------------------------------------
for ($i = 1; $i -le $repeatCount; $i++) {
    Write-Host "Tere, $userName! ($i)"
}

# ---------------------------------------
# 3️ Süsteemiinfo
# ---------------------------------------
$computerName = $env:COMPUTERNAME
$loggedInUser = $env:USERNAME
$psVersion = $PSVersionTable.PSVersion

Write-Host "`nSüsteemiinfo:"
Write-Host "Arvuti nimi: $computerName"
Write-Host "Sisseloginud kasutaja: $loggedInUser"
Write-Host "PowerShelli versioon: $psVersion"

# ---------------------------------------
# 4️ Cmdlet'ide kasutamine
# ---------------------------------------
Write-Host "`n3 töötavat protsessi:"
Get-Process | Select-Object -First 3 | Format-Table -AutoSize

Write-Host "`n3 teenust koos nende olekuga:"
Get-Service | Select-Object -First 3 | Format-Table -AutoSize

# ---------------------------------------
# 5️ Tingimuslause PowerShelli versiooni kontrollimiseks
# ---------------------------------------
if ($PSVersionTable.PSVersion.Major -lt 5) {
    Write-Host "`nHoiatus: PowerShelli versioon on alla 5!"
} else {
    Write-Host "`nPowerShelli versioon on sobiv."
}

# ---------------------------------------
# 6️ Väljundi salvestamine faili
# ---------------------------------------
# Kogu eelnev väljund suuname report.txt faili
# Selleks käivitame skripti uuesti ja suuname väljundi faili
# Või kasutame tee lihtsustamiseks Start-Transcript
$reportFile = "report.txt"
Start-Transcript -Path $reportFile -Append

# Kuvame uuesti vajalik info transcripti jaoks
for ($i = 1; $i -le $repeatCount; $i++) {
    Write-Host "Tere, $userName! ($i)"
}

Write-Host "`nSüsteemiinfo:"
Write-Host "Arvuti nimi: $computerName"
Write-Host "Sisseloginud kasutaja: $loggedInUser"
Write-Host "PowerShelli versioon: $psVersion"

Write-Host "`n3 töötavat protsessi:"
Get-Process | Select-Object -First 3 | Format-Table -AutoSize

Write-Host "`n3 teenust koos nende olekuga:"
Get-Service | Select-Object -First 3 | Format-Table -AutoSize

if ($PSVersionTable.PSVersion.Major -lt 5) {
    Write-Host "`nHoiatus: PowerShelli versioon on alla 5!"
} else {
    Write-Host "`nPowerShelli versioon on sobiv."
}

Stop-Transcript

# ---------------------------------------
# 7️ Vormindatud lõppteade
# ---------------------------------------
Write-Host "`n==========================="
Write-Host "Script finished successfully"
Write-Host "==========================="
