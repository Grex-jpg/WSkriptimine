Write-Host "Vali riik! :" -ForegroundColor Green
Write-Host "[1] Eesti"
Write-Host "[2] Saksamaa"
Write-Host "[3] Hiina" 
$valik = [int](Read-Host "Valik üks nendest riikidest")

if($valik -eq 1)
{
Write-Host "Hea valik siin on veike fackt - " -NoNewline
sleep 1
Write-Host "Eesti kapitali on Tallinn."
}

elseif($valik -eq 2)
{
Write-Host "Hea valik siin on veike fackt - " -NoNewline
sleep 1
Write-Host "Saksamaa kapitali on Berliin."
}

elseif($valik -eq 3)
{
Write-Host "Hea valik siin on veike fackt - " -NoNewline
sleep 1
Write-Host "Hiina kapitali on Beijing."
}
else
{
Write-Host "Mees... sellist valikut pole 1,2 ja 3 aint!" -ForegroundColor Red
}