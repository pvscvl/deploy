@echo off
:: requires Administrator privileges.
call :isAdmin
if %errorlevel% == 0 (
  goto :run
) else if "%1" == "admin_session" (
  goto :run
) else if %errorlevel% == 1 (
  goto :UACPrompt
) else (
  echo "Could not get administrative privileges"
  pause
  exit /b
)

:isAdmin
  fsutil dirty query %systemdrive% >nul 2>&1
  exit /b

:run


:UACPrompt
powershell "New-Item -ItemType Directory -Force -Path .\setups"
rem powershell -ExecutionPolicy Bypass -f .\ps\npp.ps1
rem powershell -ExecutionPolicy Bypass -f .\ps\firefox.ps1
rem powershell -ExecutionPolicy Bypass -f .\ps\adobe.ps1
rem powershell -NonInteractive -Command 'Start-Process -FilePath $scriptfolder\setups\AcroRdrDC.exe -Args "/sAll /rs /msi EULA_ACCEPT=YES"'
rem powershell -ExecutionPolicy Bypass -f .\ps\winscp.ps1
rem powershell -ExecutionPolicy Bypass -f .\ps\7zip.ps1
powershell -ExecutionPolicy Bypass -f .\ps\vsc.ps1

pause
exit /b

