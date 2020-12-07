echo off
cls
title Install WindowsStore
powershell.exe "Get-AppxPackage -allusers Microsoft.WindowsStore | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}"
@pause
cd..
SteavenToolBox.cmd