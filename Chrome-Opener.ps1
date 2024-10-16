function OpenChrome() {
    $chromeRunning = Get-Process -Name chrome -ErrorAction SilentlyContinue

    if ($chromeRunning) {
        Write-Host "Closing Chrome"
        Stop-Process -Name chrome -Force
    }
    else {
        Write-Host "Opening Chrome"
        Start-Process "chrome.exe" "https://www.champlain.edu"
    }

}