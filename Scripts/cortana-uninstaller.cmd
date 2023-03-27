echo off
cls
echo Hiding Cortana From Taskbar
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowCortanaButton" /t REG_DWORD /d "0" /f> nul
echo Uninstalling Cortana
powershell -command "Get-AppxPackage Microsoft.549981C3F5F10 | Remove-AppxPackage"> nul
pause