echo off
cls
title Install GitHub
powershell.exe "Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))"
choco install github-desktop -y
choco install hub -y
choco install gh -y
@pause
cd..
SteavenToolBox.cmd