function GetAtRiskUsers() {
    # Prompt user for days
    $days = Read-Host -Prompt "Enter the number of days to retrieve logs for"

    $failedLogins = getFailedLogins $days

    # Group by user and count failed attempts
    $userGroups = $failedLogins | Group-Object -Property User | Where-Object {$_.Count -gt 10}

    # Display users with more than 10 failed logins
    if ($userGroups.Count -gt 0) {
        $userGroups | ForEach-Object {
            Write-Host ($userGroups.Name | Format-Table | Out-String)
        }
    }
    else {
        Write-Host "No at risk users found." | Out-String
    }
}