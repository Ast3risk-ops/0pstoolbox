echo off
cls
powershell.exe "iex ((New-Object System.Net.WebClient).DownloadString('https://git.io/debloat'))"
cd..
SteavenToolBox.cmd