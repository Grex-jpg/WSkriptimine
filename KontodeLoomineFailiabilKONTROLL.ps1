function Translit {
    param([string] $inputString)

    $Translit = @{
        [char]'ä' = "a"
        [char]'ö' = "o"
        [char]'ü' = "u"
        [char]'õ' = "o"
    }

    $outputString = ""
    foreach ($character in $inputString.ToCharArray()) {
        if ($Translit[$character]) {
            $outputString += $Translit[$character]
        } else {
            $outputString += $character
        }
    }
    return $outputString
}


$file = "C:\Users\Administrator\Desktop\adusers.csv"
$users = Import-Csv $file -Encoding Default -Delimiter ";"

foreach ($user in $users){

    $username = ($user.FirstName + "." + $user.LastName).ToLower()
    $username = Translit $username

    $upnname = $username + "@sv-kool.local"
    $displayname = $user.FirstName + " " + $user.LastName

    $existingUser = Get-ADUser -Filter "SamAccountName -eq '$username'"

    if ($existingUser) {
        Write-Host "Kasutaja '$username' on juba AD-s olemas. Loomist ei tehtud."
    }
    else {
        try {
            New-ADUser -Name $username `
                -SamAccountName $username `
                -DisplayName $displayname `
                -GivenName $user.FirstName `
                -Surname $user.LastName `
                -Department $user.Department `
                -Title $user.Role `
                -UserPrincipalName $upnname `
                -AccountPassword (ConvertTo-SecureString $user.Password -AsPlainText -Force) `
                -Enabled $true `
                -ErrorAction Stop

            if ($?) {
                Write-Host "Kasutaja '$username' lisati edukalt AD-sse."
            }
        }
        catch {
            Write-Host "Kasutaja '$username' loomine ebaõnnestus: $($_.Exception.Message)"
        }
    }
}