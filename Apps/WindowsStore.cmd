echo off
cls
title Install WindowsStore
powershell.exe "Get-AppxPackage -allusers Microsoft.WindowsStore | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}"
powershell.exe "Get-AppxPackage -allusers Microsoft.WindowsStore"
@pause
cd..
SteavenToolBox.cmd