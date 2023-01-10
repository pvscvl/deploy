
$WebClient = New-Object System.Net.WebClient
Write-Host "Aktuellstes Firefox Setup wird geladen..."
$WebClient.DownloadFile("https://cdn.watchguard.com/SoftwareCenter/Files/WSM/12_9/wsm_12_9.exe")
Write-Host "Aktuellstes Firefox Setup wurde geladen..."
Start-Process -FilePath ./wsm_12_9.exe -Args "/SILENT" -Verb RunAs -Wait
