echo off
cls
C:\Windows\system32\ctfmon.exe
SC Start WSearch
SC CONFIG WSearch start= auto
powershell.exe "Get-AppXPackage -AllUsers |Where-Object {$_.InstallLocation -like "*SystemApps*"} | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}"
powershell.exe "$manifest = (Get-AppxPackage Microsoft.WindowsStore).InstallLocation + '\AppxManifest.xml' ; Add-AppxPackage -DisableDevelopmentMode -Register $manifest"
powershell.exe "Get-AppXPackage -AllUsers | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}"
C:\Windows\System32\ctfmon.exe
SC Start WSearch
SC CONFIG WSearch start= auto
cd..
SteavenToolBox.cmd