. (Join-Path $PSScriptRoot Event-Logs.ps1)
. (Join-Path $PSScriptRoot Log-Parser.ps1)
. (Join-Path $PSScriptRoot Chrome-Opener.ps1)
. (Join-Path $PSScriptRoot At-Risk-Users.ps1)
. (Join-Path $PSScriptRoot String-Helper.ps1)

clear

$Prompt = "`n"
$Prompt += "Please choose your operation:`n"
$Prompt += "1 - Display last ten apache logs`n"
$Prompt += "2 - Display last ten failed logins for all users`n"
$Prompt += "3 - Display at risk users`n"
$Prompt += "4 - Start Chrome and navigate to champlain.edu`n"
$Prompt += "5 - Exit`n"

$loop = $true

while($loop){

    
    Write-Host $Prompt | Out-String
    $choice = Read-Host

    if ($choice -eq 5) {
        Write-Host "Exiting Program" | Out-String
        exit
        $loop = $false
    }

    elseif ($choice -eq 1) {
        $ApacheLogs = ApacheLogs1 | Select-Object -Last 10

        Write-Host ($ApacheLogs | Format-Table | Out-String)

    }

    elseif ($choice -eq 2) {
        $FailedLogins = getFailedLogins 180 | Select-Object -Last 10

        Write-Host ($FailedLogins | Format-Table | Out-String)

    }

    elseif ($choice -eq 3) {
        $AtRiskUsers = GetAtRiskUsers | Select-Object -Last 10

        Write-Host ($AtRiskUsers | Format-Table | Out-String)
    }

    elseif ($choice -eq 4) {
        OpenChrome
    }

    else {
        Write-Host "Invalid input, please try again" | Out-String
    }


}