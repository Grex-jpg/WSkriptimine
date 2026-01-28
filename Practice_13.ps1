function Show-MainMenu {
    Clear-Host
    Write-Host "Area Calculator`n"
    Write-Host "Main Menu`n"
    Write-Host "Please select the option to perform the respective task`n"
    Write-Host "1: Area of Square"
    Write-Host "2: Area of Rectangle"
    Write-Host "3: Area of Circle"
    Write-Host "4: Area of Triangle"
    Write-Host "5: Exit`n"

    $choice = Read-Host "Enter your choice"

    switch ($choice) {
        "1" { Area-Square }
        "2" { Area-Rectangle }
        "3" { Area-Circle }
        "4" { Area-Triangle }
        "5" { Write-Host "`nExiting program..."; exit }
        default {
            Write-Host "`nEnter correct option" -ForegroundColor Red
            Read-Host "Press Enter to continue"
            Show-MainMenu
        }
    }
}

function Next-Menu {
    while ($true) {
        Write-Host "`nPlease select the next option`n"
        Write-Host "1: Return to Main Menu"
        Write-Host "2: Exit`n"

        $choice = Read-Host "Enter your choice"

        if ($choice -eq "1") {
            Show-MainMenu
        }
        elseif ($choice -eq "2") {
            Write-Host "`nExiting program..."
            exit
        }
        else {
            Write-Host "`nEnter correct option" -ForegroundColor Red
        }
    }
}

function Area-Square {
    Clear-Host
    Write-Host "Area of Square`n"
    $side = [double](Read-Host "Enter the side of the square")
    $area = $side * $side
    Write-Host "`nArea of the square = $area"
    Next-Menu
}

function Area-Rectangle {
    Clear-Host
    Write-Host "Area of Rectangle`n"
    $length = [double](Read-Host "Enter the length")
    $width  = [double](Read-Host "Enter the width")
    $area = $length * $width
    Write-Host "`nArea of the rectangle = $area"
    Next-Menu
}

function Area-Circle {
    Clear-Host
    Write-Host "Area of Circle`n"
    $radius = [double](Read-Host "Enter the radius")
    $area = [Math]::PI * $radius * $radius
    Write-Host ("`nArea of the circle = {0:N2}" -f $area)
    Next-Menu
}


function Area-Triangle {
    Clear-Host
    Write-Host "Area of Triangle`n"
    $base   = [double](Read-Host "Enter the base")
    $height = [double](Read-Host "Enter the height")
    $area = 0.5 * $base * $height
    Write-Host "`nArea of the triangle = $area"
    Next-Menu
}
Show-MainMenu