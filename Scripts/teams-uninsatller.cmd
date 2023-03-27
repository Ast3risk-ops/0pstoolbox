powershell -command "Get-AppxPackage MicrosoftTeams* | Remove-AppxPackage"> nul
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarMn" /t REG_DWORD /d "0" /f> nul
pause