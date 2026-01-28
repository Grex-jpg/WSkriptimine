
[double]$num1 = Read-Host "Pane üks number kirja"
[double]$num2 = Read-Host "Viska üks veel palun :)"


Write-Host "`nCalculator" -ForegroundColor Cyan
Write-Host "1: Liitmine"
Write-Host "2: Lahutamine"
Write-Host "3: Jagamine"
Write-Host "4: Korrutamine"

$choice = Read-Host "Sisesta oma valik"

switch ($choice) {
    1 {
        $result = $num1 + $num2
        Write-Host "Vastus on: $result" -ForegroundColor Green
    }
    2 {
        $result = $num1 - $num2
        Write-Host "Vastus on : $result" -ForegroundColor Green
    }
    3 {
        if ($num2 -eq 0) {
            Write-Host "Nulliga jagamine pole lubatud." -ForegroundColor Red
        }
        else {
            $result = $num1 / $num2
            Write-Host "Vastus on : $result" -ForegroundColor Green
        }
    }
    4 {
        $result = $num1 * $num2
        Write-Host "Vastus on : $result" -ForegroundColor Green
    }
    default {
        Write-Host "Kehtetu valik. :/" -ForegroundColor Red
    }
}