echo off
cls
title Install NotePad++
powershell.exe "Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))"
choco install notepadplusplus.commandline -y
choco install npppluginmanager -y
choco install notepadplusplus -y
choco install notepadplusplus.install -y
@pause
cd..
SteavenToolBox.cmd