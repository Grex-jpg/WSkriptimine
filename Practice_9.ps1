$count = 0

do {
    # Get all running Notepad processes
    $notepads = Get-Process -Name "notepad" -ErrorAction SilentlyContinue

    if ($notepads) {
        Write-Host "Notepad is running"
        $count++
    }

    Start-Sleep -Seconds 1

} while ($notepads) 

Write-Host "All Notepad instances have stopped running."
Write-Host "'Notepad is running' was displayed $count times."