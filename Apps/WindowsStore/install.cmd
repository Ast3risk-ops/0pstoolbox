echo off
cls
powershell.exe "Add-AppxPackage Microsoft.NET.Native.Framework.1.7_1.7.27413.0_x64__8wekyb3d8bbwe.appx"
powershell.exe "Add-AppxPackage Microsoft.NET.Native.Runtime.1.7_1.7.27422.0_x64__8wekyb3d8bbwe.appx"
powershell.exe "Add-AppxPackage Microsoft.VCLibs.140.00_14.0.29231.0_x64__8wekyb3d8bbwe.appx"
powershell.exe "Add-AppxPackage Microsoft.DesktopAppInstaller_2019.1019.1.0_neutral_~_8wekyb3d8bbwe.AppxBundle"
powershell.exe "Add-AppxPackage Microsoft.WindowsStore_11811.1001.2713.0_neutral_~_8wekyb3d8bbwe.appxbundle"
cd..
cd..
SteavenToolBox.cmd