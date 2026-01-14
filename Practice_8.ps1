do {

    $notepads = Get-Process -Name "notepad" -ErrorAction SilentlyContinue

    if ($notepads) {

        Write-Host "Notepad is running"
    } else {

        Write-Host "Notepad has stopped running"
    }

    Start-Sleep -Seconds 1

} while ($notepads)