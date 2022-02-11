@ECHO off
cls
call :IsAdmin
echo off
echo Enabling NDIS And Acpi To Avoid BlueScreen of death!
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\NDIS" /v "Start" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\ACPI" /v "Start" /t REG_DWORD /d "0" /f
echo Installing Toolbox Runtime
powershell.exe "iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/SteavenGamerYT/SteavenToolBox/main/runtime.ps1'))"
echo finshed
:start
title SteavenToolbox 1.8
cls
echo =====================================================================
echo "SteavenToolbox 1.8 | We care about your pc!" "Windows 10 only!"
echo =====================================================================
echo ---------------------------------------------------------------------------------------------------------------------
ECHO "TWEAK | FIXED | CLEANER | OTHER"                         Installer
echo --------------------------------                          ---------
color a                                    
ECHO 1. Enable / Disable Windows 10 Apps                       10. Reload Toolbox
echo 2. Clear Event Viewer Logs                                11. Install Apps that you need
echo 3. "Clear Cache Updates | Delivery Optimization"          12. Reinstall Windows 10 preinstalled apps
echo 4. "Hibernation | Fastboot | Sleepmode | Sysmain"         13. Game Launchers
echo 5. Steaven Recommended Settings                           14. Office
echo 6. Disable Services                                       15. Uninstall onedrive 	
echo 7. Uninstall Some Preloaded packages forever!             16. Full RunTime
echo 8. Windows Update Fix                                     17. Themes
echo 9. Right Click Tweaks                                     18. Install Store (after removing it)                                                                                   
echo ---------------------------------------------------------------------------------------------------------------------
set choice=
set /p choice=Type the number.
if not '%choice%'=='' set choice=%choice:~0,100%
if '%choice%'=='1' goto 1
if '%choice%'=='2' goto 2
if '%choice%'=='3' goto 3
if '%choice%'=='4' goto 4
if '%choice%'=='5' goto steavensetup
if '%choice%'=='6' goto 6
if '%choice%'=='7' goto 15
if '%choice%'=='8' goto updatefix
if '%choice%'=='9' goto rightclick
if '%choice%'=='10' goto powershell iex ((New-Object System.Net.WebClient).DownloadString('https://github.com/SteavenGamerYT/SteavenToolBox/raw/main/ToolBox.ps1'))
if '%choice%'=='11' goto 11
if '%choice%'=='12' goto Choice
if '%choice%'=='13' goto 17
if '%choice%'=='14' goto 18
if '%choice%'=='15' powershell.exe "iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/omartube706/SteavenToolBox/main/onedrive.ps1'))"
if '%choice%'=='16' choco install vcredist2005 vcredist2008 vcredist2010  vcredist2012 msvisualcplusplus2012-redist vcredist2013 vcredist2017 vcredist140 vcredist-all jre8 directx -y & DISM /Online /Enable-Feature /FeatureName:NetFx3 & DISM /Online /Enable-Feature /FeatureName:NetFx4 /All & dism /Online /enable-feature /FeatureName:"LegacyComponents" /All & dism /Online /enable-feature /FeatureName:"DirectPlay" /All
if '%choice%'=='17' goto themes
if '%choice%'=='18' goto store22
ECHO "%choice%" is not valid, try again
ECHO.
goto start
:1
title SteavenToolbox 1.8
cls
echo ---------------------------------------------------------------------------------------------------------------------
echo Print Spooler for Printer (services)
echo 1. Enable
echo 2. Disable
echo ---------------------------------------------------------------------------------------------------------------------
echo Windows Updates (Regedit)
echo 3. Enable
echo 4. Disable
echo ---------------------------------------------------------------------------------------------------------------------
echo Windows Firewall
echo 5. Enable
echo 6. Disable
echo ---------------------------------------------------------------------------------------------------------------------
echo Windows Defender (using app)
echo 7. "Enable & Disable"
echo ---------------------------------------------------------------------------------------------------------------------
echo Internet Explorer
echo 9. Enable
echo 10. Disable
echo ---------------------------------------------------------------------------------------------------------------------
echo Windows Media Player
echo 11. Enable
echo 12. Disable
echo ---------------------------------------------------------------------------------------------------------------------
echo Printing APPS
echo 13. Enable all
echo 14. Disable all
echo ---------------------------------------------------------------------------------------------------------------------
echo 0. Back to menu
set choice=
set /p choice=Type the number.
if not '%choice%'=='' set choice=%choice:~0,10%
if '%choice%'=='1' SC CONFIG Spooler start= auto & SC START Spooler
if '%choice%'=='2' C STOP Spooler & SC CONFIG Spooler start= disabled
if '%choice%'=='3' Reg.exe delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "DoNotConnectToWindowsUpdateInternetLocations" /f & Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /f
if '%choice%'=='4' Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "DoNotConnectToWindowsUpdateInternetLocations" /t REG_DWORD /d "1" /f
if '%choice%'=='5' NetSh Advfirewall set allprofiles state on
if '%choice%'=='6' NetSh Advfirewall set allprofiles state off
if '%choice%'=='7' wget -P c: https://github.com/SteavenGamerYT/SteavenToolBox/raw/main/dControl.exe & start /wait c:\dControl.exe
if '%choice%'=='9' dism /online /NoRestart /Enable-Feature /FeatureName:Internet-Explorer-Optional-amd64
if '%choice%'=='10' dism /online /NoRestart /Disable-Feature /FeatureName:Internet-Explorer-Optional-amd64
if '%choice%'=='11' DISM /online /NoRestart /Enable-feature /featurename:WindowsMediaPlayer
if '%choice%'=='12' DISM /online /NoRestart /disable-feature /featurename:WindowsMediaPlayer
if '%choice%'=='13' dism /online /NoRestart /Enable-Feature /FeatureName:Printing-PrintToPDFServices-Features & dism /online /NoRestart /Enable-Feature /FeatureName:Printing-XPSServices-Features & dism /online /NoRestart /Enable-Feature /FeatureName:Printing-Foundation-Features & dism /online /NoRestart /Enable-Feature /FeatureName:Printing-Foundation-InternetPrinting-Client & dism /online /NoRestart /Enable-Feature /FeatureName:Printing-Foundation-LPDPrintService & dism /online /NoRestart /Enable-Feature /FeatureName:Printing-Foundation-LPRPortMonitor & dism /online /NoRestart /Enable-Feature /FeatureName:Printing-Foundation-Features
if '%choice%'=='14' dism /online /NoRestart /Disable-Feature /FeatureName:Printing-PrintToPDFServices-Features & dism /online /NoRestart /Disable-Feature /FeatureName:Printing-XPSServices-Features & dism /online /NoRestart /Disable-Feature /FeatureName:Printing-Foundation-Features & dism /online /NoRestart /Disable-Feature /FeatureName:Printing-Foundation-InternetPrinting-Client & dism /online /NoRestart /Disable-Feature /FeatureName:Printing-Foundation-LPDPrintService & dism /online /NoRestart /Disable-Feature /FeatureName:Printing-Foundation-LPRPortMonitor & dism /online /NoRestart /Disable-Feature /FeatureName:Printing-Foundation-Features
if '%choice%'=='0' goto start
ECHO "%choice%" is not valid, try again
ECHO.
goto 1
:2
cls
title SteavenToolBox 1.6.0 Clear Event Logs
color 7
FOR /F "tokens=1, 2 * " %%V IN ('bcdedit') DO SET adminTest=%%V
IF (%adminTest%)==(Access) goto noAdmin
for /F " tokens=*" %%G in ('wevtutil.exe el') DO (call :do_clear "%%G")
goto theEnd
:do_clear
echo clearing %1
wevtutil.exe cl %1
goto :eof
goto start
:3
cls
title SteavenToolBox 1.6.0 Clear Cache
color 4
SC stop DoSvc
del c:\WIN386.SWP
del /s /f /q c:\windows\temp\*.*
del /s /f /q C:\WINDOWS\Prefetch
del /s /f /q %temp%\*.*
del /s /f /q %userprofile%\Recent\*.*
del /s /f /q C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Recent Items*.*
del /s /f /q %windir%\temp\*.*  
del /s /f /q %windir%\Prefetch\*.*      
del /s /f /q "%SysteDrive%\Temp"\*.*  
del /s /f /q %temp%\*.*  
del /s /f /q "%USERPROFILE%\Local Settings\History"\*.*  
del /s /f /q "%USERPROFILE%\Local Settings\Temporary Internet Files"\*.* 
del /s /f /q "%USERPROFILE%\Local Settings\Temp"\*.*       
del /s /f /q "%USERPROFILE%\Recent"\*.*    
del /s /f /q "%USERPROFILE%\Cookies"\*.* 
goto start
:4
cls
title SteavenToolBox 1.6.0 Hibernation "| Fastboot | Sleepmode | Sysmain"
echo Hibernation / Fastboot / Sleep mode
echo 1. Disable : hiberfil.sys
echo 2. Enable  : hiberfil.sys
echo ---------------------------------------------------------------------------------------------------------------------
echo Sysmain / Superfetch
echo 3. Disable : Sysmain / Superfetch
echo 4. Enable : Sysmain / Superfetch
echo ---------------------------------------------------------------------------------------------------------------------
echo 0. Back to menu
echo NOTE: for laptop users can enable hibernation if you want using sleepmode/standby mode
echo NOTE: for HDD users enable Sysmain and hibernation for better boot up times and application.
echo NOTE: A computer with 4GB of RAM would have a 3.5GB hiberfil.sys file on your Drives.
set choice=
set /p choice=Type the number.
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' powercfg.exe -h off & goto 4
if '%choice%'=='2' powercfg.exe -h on & goto 4
if '%choice%'=='3' SC STOP SysMain & SC CONFIG SysMain start= disabled & goto 4
if '%choice%'=='4' SC CONFIG SysMain start= auto & SC start SysMain & goto 4
if '%choice%'=='0' goto start
goto start
:11
cls
color d
echo Install Apps
echo 1. Firefox
echo 2. Brave
echo 3. Chrome
echo 4. Vlc
echo 5. Github
echo 6. Discord
echo 7. Notepad Plus Plus
echo 8. Vs Code
echo 9. Paint.net
echo 10. Search Deflector
echo 11. AnyDesk
echo 0. Back to menu
set choice=
set /p choice=Type the number.
if not '%choice%'=='' set choice=%choice:~0,100%
if '%choice%'=='1' powershell -command "winget install --id Mozilla.Firefox"
if '%choice%'=='2' powershell -command "winget install --id BraveSoftware.BraveBrowser"
if '%choice%'=='3' powershell -command "winget install --id Google.Chrome"
if '%choice%'=='4' powershell -command "winget install --id VideoLAN.VLC"
if '%choice%'=='5' powershell -command "winget install --id GitHub.GitHubDesktop"
if '%choice%'=='6' powershell -command "winget install --id Discord.Discord"
if '%choice%'=='7' powershell -command "winget install --id Notepad++.Notepad++"
if '%choice%'=='8' powershell -command "winget install --id Microsoft.VisualStudioCode"
if '%choice%'=='9' powershell -command "choco install paint.net -y"
if '%choice%'=='10' powershell -command "winget install --id SearchDeflector.SearchDeflector"
if '%choice%'=='11' powershell -command "winget install --id AnyDeskSoftwareGmbH.AnyDesk"
if '%choice%'=='0' goto start
ECHO.
goto 11
goto start
:end
pause
:Choice
Cls 
Echo.
Echo 1. Reinstall and Re-Register All Windows Apps for Current Account Only
Echo.
Echo 2. Reinstall and Re-Register All Windows Apps for All Accounts
Echo.
Echo 3. Reinstall and Re-Register 3D Builder
Echo.
Echo 4. Reinstall and Re-Register 3D Viewer
Echo.
Echo 5. Reinstall and Re-Register Alarms and Clock
Echo.
Echo 6. Reinstall and Re-Register App Connector
Echo.
Echo 7. Reinstall and Re-Register Calculator
Echo.
Echo 8. Reinstall and Re-Register Calendar and Mail
Echo.
Echo 9. Reinstall and Re-Register Camera
Echo.
Echo 10. Reinstall and Re-Register Candy Crush Soda Saga
Echo.
Echo 11. Reinstall and Re-Register Connect
Echo.
Echo 12. Reinstall and Re-Register Contact Support
Echo.
Echo 13. Reinstall and Re-Register Cortana
Echo.
Echo 14. Reinstall and Re-Register Drawboard PDF
Echo.
Echo 15. Reinstall and Re-Register Feedback Hub
Echo.
Echo 16. Reinstall and Re-Register Get Help
Echo.
Echo 17. Reinstall and Re-Register Get Office
Echo.
Echo 18. Reinstall and Re-Register Get Started
Echo.
Echo 19. Reinstall and Re-Register Groove Music
Echo.
Echo 20. Reinstall and Re-Register Mail and Calendar
Echo.
Echo 21. Reinstall and Re-Register Maps
Echo.
Echo 22. Reinstall and Re-Register Messaging
Echo.
Echo 23. Reinstall and Re-Register Microsoft Edge
Echo.
Echo 24. Reinstall and Re-Register Microsoft Solitaire Collection
Echo.
Echo 25. Reinstall and Re-Register Microsoft Store
Echo.
Echo 26. Reinstall and Re-Register Microsoft Whiteboad
Echo.
Echo 27. Reinstall and Re-Register Mixed Reality Portal
Echo.
Echo 28. Reinstall and Re-Register Money
Echo.
Echo 29. Reinstall and Re-Register Movies and TV
Echo.
Echo 30. Reinstall and Re-Register News
Echo.
Echo 31. Reinstall and Re-Register OneDrive 
Echo.
Echo 32. Reinstall and Re-Register OneNote
Echo.
Echo 33. Reinstall and Re-Register Paint 3D
Echo.
Echo 34. Reinstall and Re-Register People
Echo.
Echo 35. Reinstall and Re-Register Phone
Echo.
Echo 36. Reinstall and Re-Register Phone Companion
Echo.
Echo 37. Reinstall and Re-Register Photos
Echo.
Echo 38. Reinstall and Re-Register Settings
Echo.
Echo 39. Reinstall and Re-Register Skype
Echo.
Echo 40. Reinstall and Re-Register Snip and Sketch
Echo.
Echo 41. Reinstall and Re-Register Sports
Echo.
Echo 42. Reinstall and Re-Register Sticky Notes
Echo.
Echo 43. Reinstall and Re-Register Sway
Echo.
Echo 44. Reinstall and Re-Register Tips
Echo.
Echo 45. Reinstall and Re-Register Twitter
Echo.
Echo 46. Reinstall and Re-Register Voice Recorder
Echo.
Echo 47. Reinstall and Re-Register Weather
Echo.
Echo 48. Reinstall and Re-Register Xbox Console Companion
Echo.
Echo 49. Reinstall and Re-Register Xbox Game Bar
Echo.
Echo 50. Reinstall and Re-Register Xbox One SmartGlass
Echo.
Echo 51. Reinstall and Re-Register Your Phone
Echo.
echo ---------------------------------------------------------------------------------------------------------------------
echo 0. Back to menu

Set /p input= Type a number: 

If %input%==1 Goto :Current
If %input%==2 Goto :All
If %input%==3 Goto :3DBuilder
If %input%==4 Goto :3DViewer
If %input%==5 Goto :Alarms
If %input%==6 Goto :Connector
If %input%==7 Goto :Calculator
If %input%==8 Goto :Communications
If %input%==9 Goto :Camera
If %input%==10 Goto :Candy
If %input%==11 Goto :PPIProjection
If %input%==12 Goto :ContactSupport
If %input%==13 Goto :Cortana
If %input%==14 Goto :DrawboardPDF
If %input%==15 Goto :FeedbackHub
If %input%==16 Goto :ContactSupport
If %input%==17 Goto :Office
If %input%==18 Goto :GetStarted
If %input%==19 Goto :ZuneMusic
If %input%==20 Goto Communicationsapps
If %input%==21 Goto :Maps
If %input%==22 Goto :Messaging
If %input%==23 Goto :Edge
If %input%==24 Goto :Solitaire
If %input%==25 Goto :Store
If %input%==26 Goto :Whiteboard
If %input%==27 Goto :MixedReality
If %input%==28 Goto :BingFinance
If %input%==29 Goto :ZuneVideo
If %input%==30 Goto :BingNews
If %input%==31 Goto :OneDrive
If %input%==32 Goto :OneNote
If %input%==33 Goto :MSPaint
If %input%==34 Goto :People
If %input%==35 Goto :Phone
If %input%==36 Goto :WindowsPhone
If %input%==37 Goto :Photos
If %input%==38 Goto :Settings
If %input%==39 Goto :Skype
If %input%==40 Goto :ScreenSketch
If %input%==41 Goto :BingSports
If %input%==42 Goto :StickyNotes
If %input%==43 Goto :Sway
If %input%==44 Goto :Tips
If %input%==45 Goto :Twitter
If %input%==46 Goto :SoundRecorder
If %input%==47 Goto :Weather
If %input%==48 Goto :XboxApp
If %input%==49 Goto :XboxGamingOverlay
If %input%==50 Goto :XboxOneSmartGlass
If %input%==51 Goto :YourPhone
If %input%==0 Goto start

Goto :EOF




:Current

Cd %TMP%

Echo Get-AppXPackage ^| Foreach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"} > Current.ps1

Powershell -ExecutionPolicy ByPass -File Current.ps1

Del Current.ps1

Goto :Choice
:All

Cd %TMP%

Echo Get-AppXPackage -AllUsers ^| Foreach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"} > All.ps1

Powershell -ExecutionPolicy ByPass -File All.ps1

Del All.ps1

Goto :Choice


:3DBuilder

PowerShell -ExecutionPolicy Unrestricted -Command "& {$manifest = (Get-AppxPackage *3DBuilder*).InstallLocation + '\AppxManifest.xml' ; Add-AppxPackage -DisableDevelopmentMode -Register $manifest}"

Goto :Choice


:3DViewer

PowerShell -ExecutionPolicy Unrestricted -Command "& {$manifest = (Get-AppxPackage *Microsoft3DViewer*).InstallLocation + '\AppxManifest.xml' ; Add-AppxPackage -DisableDevelopmentMode -Register $manifest}"

Goto :Choice

:Alarms

PowerShell -ExecutionPolicy Unrestricted -Command "& {$manifest = (Get-AppxPackage *WindowsAlarms*).InstallLocation + '\AppxManifest.xml' ; Add-AppxPackage -DisableDevelopmentMode -Register $manifest}"

Goto :Choice


:Connector

PowerShell -ExecutionPolicy Unrestricted -Command "& {$manifest = (Get-AppxPackage *AppConnector*).InstallLocation + '\AppxManifest.xml' ; Add-AppxPackage -DisableDevelopmentMode -Register $manifest}"

Goto :Choice

:Calculator

PowerShell -ExecutionPolicy Unrestricted -Command "& {$manifest = (Get-AppxPackage *WindowsCalculator*).InstallLocation + '\AppxManifest.xml' ; Add-AppxPackage -DisableDevelopmentMode -Register $manifest}"

Goto :Choice

:Communications

PowerShell -ExecutionPolicy Unrestricted -Command "& {$manifest = (Get-AppxPackage *windowscommunicationsapps*).InstallLocation + '\AppxManifest.xml' ; Add-AppxPackage -DisableDevelopmentMode -Register $manifest}"

Goto :Choice


:Camera

PowerShell -ExecutionPolicy Unrestricted -Command "& {$manifest = (Get-AppxPackage *WindowsCamera*).InstallLocation + '\AppxManifest.xml' ; Add-AppxPackage -DisableDevelopmentMode -Register $manifest}"

Goto :Choice


:Candy

PowerShell -ExecutionPolicy Unrestricted -Command "& {$manifest = (Get-AppxPackage *CandyCrushSodaSaga*).InstallLocation + '\AppxManifest.xml' ; Add-AppxPackage -DisableDevelopmentMode -Register $manifest}"

Goto :Choice


:PPIProjection

PowerShell -ExecutionPolicy Unrestricted -Command "& {$manifest = (Get-AppxPackage *PPIProjection*).InstallLocation + '\AppxManifest.xml' ; Add-AppxPackage -DisableDevelopmentMode -Register $manifest}"

Goto :Choice


:ContactSupport

PowerShell -ExecutionPolicy Unrestricted -Command "& {$manifest = (Get-AppxPackage *ContactSupport*).InstallLocation + '\AppxManifest.xml' ; Add-AppxPackage -DisableDevelopmentMode -Register $manifest}"

Goto :Choice


:Cortana

PowerShell -ExecutionPolicy Unrestricted -Command "& {$manifest = (Get-AppxPackage *Windows.Cortana*).InstallLocation + '\AppxManifest.xml' ; Add-AppxPackage -DisableDevelopmentMode -Register $manifest}"

Goto :Choice


:DrawboardPDF

PowerShell -ExecutionPolicy Unrestricted -Command "& {$manifest = (Get-AppxPackage *DrawboardPDF*).InstallLocation + '\AppxManifest.xml' ; Add-AppxPackage -DisableDevelopmentMode -Register $manifest}"

Goto :Choice


:FeedbackHub

PowerShell -ExecutionPolicy Unrestricted -Command "& {$manifest = (Get-AppxPackage *WindowsFeedbackHub*).InstallLocation + '\AppxManifest.xml' ; Add-AppxPackage -DisableDevelopmentMode -Register $manifest}"

Goto :Choice


:ContactSupport

PowerShell -ExecutionPolicy Unrestricted -Command "& {$manifest = (Get-AppxPackage *ContactSupport*).InstallLocation + '\AppxManifest.xml' ; Add-AppxPackage -DisableDevelopmentMode -Register $manifest}"


Goto :Choice

:Office

PowerShell -ExecutionPolicy Unrestricted -Command "& {$manifest = (Get-AppxPackage *MicrosoftOfficeHub*).InstallLocation + '\AppxManifest.xml' ; Add-AppxPackage -DisableDevelopmentMode -Register $manifest}"

Goto :Choice

:GetStarted

PowerShell -ExecutionPolicy Unrestricted -Command "& {$manifest = (Get-AppxPackage *GetStarted*).InstallLocation + '\AppxManifest.xml' ; Add-AppxPackage -DisableDevelopmentMode -Register $manifest}"


Goto :Choice

:ZuneMusic

PowerShell -ExecutionPolicy Unrestricted -Command "& {$manifest = (Get-AppxPackage *ZuneMusic*).InstallLocation + '\AppxManifest.xml' ; Add-AppxPackage -DisableDevelopmentMode -Register $manifest}"


Goto :Choice


:Communicationsapps

PowerShell -ExecutionPolicy Unrestricted -Command "& {$manifest = (Get-AppxPackage *windowscommunicationsapps*).InstallLocation + '\AppxManifest.xml' ; Add-AppxPackage -DisableDevelopmentMode -Register $manifest}"


Goto :Choice

:Maps

PowerShell -ExecutionPolicy Unrestricted -Command "& {$manifest = (Get-AppxPackage *WindowsMaps*).InstallLocation + '\AppxManifest.xml' ; Add-AppxPackage -DisableDevelopmentMode -Register $manifest}"

Goto :Choice

:Messaging

PowerShell -ExecutionPolicy Unrestricted -Command "& {$manifest = (Get-AppxPackage *Messaging*).InstallLocation + '\AppxManifest.xml' ; Add-AppxPackage -DisableDevelopmentMode -Register $manifest}"


Goto :Choice

:Edge

PowerShell -ExecutionPolicy Unrestricted -Command "& {$manifest = (Get-AppxPackage *MicrosoftEdge*).InstallLocation + '\AppxManifest.xml' ; Add-AppxPackage -DisableDevelopmentMode -Register $manifest}"


Goto :Choice

:Solitaire

PowerShell -ExecutionPolicy Unrestricted -Command "& {$manifest = (Get-AppxPackage *MicrosoftSolitaireCollection*).InstallLocation + '\AppxManifest.xml' ; Add-AppxPackage -DisableDevelopmentMode -Register $manifest}"


Goto :Choice


:Store

PowerShell -ExecutionPolicy Unrestricted -Command "& {$manifest = (Get-AppxPackage *WindowsStore*).InstallLocation + '\AppxManifest.xml' ; Add-AppxPackage -DisableDevelopmentMode -Register $manifest}"



Goto :Choice


:Whiteboard

PowerShell -ExecutionPolicy Unrestricted -Command "& {$manifest = (Get-AppxPackage *Microsoft.Whiteboard*).InstallLocation + '\AppxManifest.xml' ; Add-AppxPackage -DisableDevelopmentMode -Register $manifest}"


Goto :Choice


:MixedReality

PowerShell -ExecutionPolicy Unrestricted -Command "& {$manifest = (Get-AppxPackage *Microsoft.MixedReality.Portal*).InstallLocation + '\AppxManifest.xml' ; Add-AppxPackage -DisableDevelopmentMode -Register $manifest}"


Goto :Choice

:BingFinance

PowerShell -ExecutionPolicy Unrestricted -Command "& {$manifest = (Get-AppxPackage *BingFinance*).InstallLocation + '\AppxManifest.xml' ; Add-AppxPackage -DisableDevelopmentMode -Register $manifest}"


Goto :Choice

:ZuneVideo

PowerShell -ExecutionPolicy Unrestricted -Command "& {$manifest = (Get-AppxPackage *ZuneVideo*).InstallLocation + '\AppxManifest.xml' ; Add-AppxPackage -DisableDevelopmentMode -Register $manifest}"


Goto :Choice


:BingNews

PowerShell -ExecutionPolicy Unrestricted -Command "& {$manifest = (Get-AppxPackage *BingNews*).InstallLocation + '\AppxManifest.xml' ; Add-AppxPackage -DisableDevelopmentMode -Register $manifest}"


Goto :Choice


:OneDrive

PowerShell -ExecutionPolicy Unrestricted -Command "& {$manifest = (Get-AppxPackage *microsoft.microsoftskydrive*).InstallLocation + '\AppxManifest.xml' ; Add-AppxPackage -DisableDevelopmentMode -Register $manifest}"


Goto :Choice


:OneNote

PowerShell -ExecutionPolicy Unrestricted -Command "& {$manifest = (Get-AppxPackage *Office.OneNote*).InstallLocation + '\AppxManifest.xml' ; Add-AppxPackage -DisableDevelopmentMode -Register $manifest}"


Goto :Choice


:MSPaint

PowerShell -ExecutionPolicy Unrestricted -Command "& {$manifest = (Get-AppxPackage *MSPaint*).InstallLocation + '\AppxManifest.xml' ; Add-AppxPackage -DisableDevelopmentMode -Register $manifest}"


Goto :Choice

:People

PowerShell -ExecutionPolicy Unrestricted -Command "& {$manifest = (Get-AppxPackage *People*).InstallLocation + '\AppxManifest.xml' ; Add-AppxPackage -DisableDevelopmentMode -Register $manifest}"


Goto :Choice

:Phone

PowerShell -ExecutionPolicy Unrestricted -Command "& {$manifest = (Get-AppxPackage *CommsPhone*).InstallLocation + '\AppxManifest.xml' ; Add-AppxPackage -DisableDevelopmentMode -Register $manifest}"


Goto :Choice

:WindowsPhone

PowerShell -ExecutionPolicy Unrestricted -Command "& {$manifest = (Get-AppxPackage *WindowsPhone*).InstallLocation + '\AppxManifest.xml' ; Add-AppxPackage -DisableDevelopmentMode -Register $manifest}"


Goto :Choice

:Photos

PowerShell -ExecutionPolicy Unrestricted -Command "& {$manifest = (Get-AppxPackage *Photos*).InstallLocation + '\AppxManifest.xml' ; Add-AppxPackage -DisableDevelopmentMode -Register $manifest}"


Goto :Choice


:Settings

PowerShell -ExecutionPolicy Unrestricted -Command "& {$manifest = (Get-AppxPackage *immersivecontrolpanel*).InstallLocation + '\AppxManifest.xml' ; Add-AppxPackage -DisableDevelopmentMode -Register $manifest}"


Goto :Choice


:Skype

PowerShell -ExecutionPolicy Unrestricted -Command "& {$manifest = (Get-AppxPackage *SkypeApp*).InstallLocation + '\AppxManifest.xml' ; Add-AppxPackage -DisableDevelopmentMode -Register $manifest}"


Goto :Choice

:ScreenSketch

PowerShell -ExecutionPolicy Unrestricted -Command "& {$manifest = (Get-AppxPackage *Microsoft.ScreenSketch*).InstallLocation + '\AppxManifest.xml' ; Add-AppxPackage -DisableDevelopmentMode -Register $manifest}"

Goto :Choice


:BingSports

PowerShell -ExecutionPolicy Unrestricted -Command "& {$manifest = (Get-AppxPackage *BingSports*).InstallLocation + '\AppxManifest.xml' ; Add-AppxPackage -DisableDevelopmentMode -Register $manifest}"


Goto :Choice


:StickyNotes

PowerShell -ExecutionPolicy Unrestricted -Command "& {$manifest = (Get-AppxPackage *MicrosoftStickyNotes*).InstallLocation + '\AppxManifest.xml' ; Add-AppxPackage -DisableDevelopmentMode -Register $manifest}"


Goto :Choice


:Sway

PowerShell -ExecutionPolicy Unrestricted -Command "& {$manifest = (Get-AppxPackage *Office.Sway*).InstallLocation + '\AppxManifest.xml' ; Add-AppxPackage -DisableDevelopmentMode -Register $manifest}"


Goto :Choice


:Tips

PowerShell -ExecutionPolicy Unrestricted -Command "& {$manifest = (Get-AppxPackage *Microsoft.Getstarted*).InstallLocation + '\AppxManifest.xml' ; Add-AppxPackage -DisableDevelopmentMode -Register $manifest}"


Goto :Choice

:Twitter

PowerShell -ExecutionPolicy Unrestricted -Command "& {$manifest = (Get-AppxPackage *Twitter*).InstallLocation + '\AppxManifest.xml' ; Add-AppxPackage -DisableDevelopmentMode -Register $manifest}"


Goto :Choice


:SoundRecorder

PowerShell -ExecutionPolicy Unrestricted -Command "& {$manifest = (Get-AppxPackage *WindowsSoundRecorder*).InstallLocation + '\AppxManifest.xml' ; Add-AppxPackage -DisableDevelopmentMode -Register $manifest}"


Goto :Choice


:Weather

PowerShell -ExecutionPolicy Unrestricted -Command "& {$manifest = (Get-AppxPackage *BingWeather*).InstallLocation + '\AppxManifest.xml' ; Add-AppxPackage -DisableDevelopmentMode -Register $manifest}"



Goto :Choice


:XboxApp

PowerShell -ExecutionPolicy Unrestricted -Command "& {$manifest = (Get-AppxPackage *XboxApp*).InstallLocation + '\AppxManifest.xml' ; Add-AppxPackage -DisableDevelopmentMode -Register $manifest}"



Goto :Choice


:XboxGamingOverlay

PowerShell -ExecutionPolicy Unrestricted -Command "& {$manifest = (Get-AppxPackage *Microsoft.XboxGamingOverlay*).InstallLocation + '\AppxManifest.xml' ; Add-AppxPackage -DisableDevelopmentMode -Register $manifest}"



Goto :Choice


:XboxOneSmartGlass

PowerShell -ExecutionPolicy Unrestricted -Command "& {$manifest = (Get-AppxPackage *XboxOneSmartGlass*).InstallLocation + '\AppxManifest.xml' ; Add-AppxPackage -DisableDevelopmentMode -Register $manifest}"


Goto :Choice


:YourPhone

PowerShell -ExecutionPolicy Unrestricted -Command "& {$manifest = (Get-AppxPackage *Microsoft.YourPhone*).InstallLocation + '\AppxManifest.xml' ; Add-AppxPackage -DisableDevelopmentMode -Register $manifest}"

Goto :Choice

:IsAdmin
Reg.exe query "HKU\S-1-5-19\Environment"
If Not %ERRORLEVEL% EQU 0 (
 Cls & Echo You must have administrator rights to continue ... 
 Pause & Exit
)
Cls
goto:eof

:13
cls
Reg.exe delete "HKCR\*\shell\TakeOwnership" /f
Reg.exe delete "HKCR\*\shell\runas" /f
Reg.exe add "HKCR\*\shell\runas" /ve /t REG_SZ /d "Take Ownership" /f
Reg.exe delete "HKCR\*\shell\runas" /v "Extended" /f
Reg.exe add "HKCR\*\shell\runas" /v "HasLUAShield" /t REG_SZ /d "" /f
Reg.exe add "HKCR\*\shell\runas" /v "NoWorkingDirectory" /t REG_SZ /d "" /f
Reg.exe add "HKCR\*\shell\runas" /v "Position" /t REG_SZ /d "middle" /f
Reg.exe add "HKCR\*\shell\runas\command" /ve /t REG_SZ /d "cmd.exe /c takeown /f \"%%1\" && icacls \"%%1\" /grant *S-1-3-4:F /c /l" /f
Reg.exe add "HKCR\*\shell\runas\command" /v "IsolatedCommand" /t REG_SZ /d "cmd.exe /c takeown /f \"%%1\" && icacls \"%%1\" /grant *S-1-3-4:F /c /l" /f
Reg.exe add "HKCR\Directory\shell\TakeOwnership" /ve /t REG_SZ /d "Take Ownership" /f
Reg.exe add "HKCR\Directory\shell\TakeOwnership" /v "AppliesTo" /t REG_SZ /d "NOT (System.ItemPathDisplay:=\"C:\Users\" OR System.ItemPathDisplay:=\"C:\ProgramData\" OR System.ItemPathDisplay:=\"C:\Windows\" OR System.ItemPathDisplay:=\"C:\Windows\System32\" OR System.ItemPathDisplay:=\"C:\Program Files\" OR System.ItemPathDisplay:=\"C:\Program Files (x86)\")" /f
Reg.exe delete "HKCR\Directory\shell\TakeOwnership" /v "Extended" /f
Reg.exe add "HKCR\Directory\shell\TakeOwnership" /v "HasLUAShield" /t REG_SZ /d "" /f
Reg.exe add "HKCR\Directory\shell\TakeOwnership" /v "NoWorkingDirectory" /t REG_SZ /d "" /f
Reg.exe add "HKCR\Directory\shell\TakeOwnership" /v "Position" /t REG_SZ /d "middle" /f
Reg.exe add "HKCR\Directory\shell\TakeOwnership\command" /ve /t REG_SZ /d "powershell -windowstyle hidden -command \"Start-Process cmd -ArgumentList '/c takeown /f \\\"%%1\\\" /r /d y && icacls \\\"%%1\\\" /grant *S-1-3-4:F /t /c /l /q' -Verb runAs\"" /f
Reg.exe add "HKCR\Directory\shell\TakeOwnership\command" /v "IsolatedCommand" /t REG_SZ /d "powershell -windowstyle hidden -command \"Start-Process cmd -ArgumentList '/c takeown /f \\\"%%1\\\" /r /d y && icacls \\\"%%1\\\" /grant *S-1-3-4:F /t /c /l /q' -Verb runAs\"" /f
Reg.exe add "HKCR\Drive\shell\runas" /ve /t REG_SZ /d "Take Ownership" /f
Reg.exe delete "HKCR\Drive\shell\runas" /v "Extended" /f
Reg.exe add "HKCR\Drive\shell\runas" /v "HasLUAShield" /t REG_SZ /d "" /f
Reg.exe add "HKCR\Drive\shell\runas" /v "NoWorkingDirectory" /t REG_SZ /d "" /f
Reg.exe add "HKCR\Drive\shell\runas" /v "Position" /t REG_SZ /d "middle" /f
Reg.exe add "HKCR\Drive\shell\runas" /v "AppliesTo" /t REG_SZ /d "NOT (System.ItemPathDisplay:=\"C:\\\")" /f
Reg.exe add "HKCR\Drive\shell\runas\command" /ve /t REG_SZ /d "cmd.exe /c takeown /f \"%%1\\\" /r /d y && icacls \"%%1\\\" /grant *S-1-3-4:F /t /c" /f
Reg.exe add "HKCR\Drive\shell\runas\command" /v "IsolatedCommand" /t REG_SZ /d "cmd.exe /c takeown /f \"%%1\\\" /r /d y && icacls \"%%1\\\" /grant *S-1-3-4:F /t /c" /f
goto start
:6
cls
title SteavenToolBox 1.6.0 Disable Services
SC STOP Spooler
SC CONFIG Spooler start= disabled
SC STOP WMPNetworkSvc
SC CONFIG WMPNetworkSvc start= disabled
SC STOP wisvc
SC CONFIG wisvc start= disabled
SC STOP WerSvc
SC CONFIG WerSvc start= disabled
SC STOP WbioSrvc
SC CONFIG WbioSrvc start= disabled
SC STOP vmicvss
SC CONFIG vmicvss start= disabled
SC STOP vmicvmsession
SC CONFIG vmicvmsession start= disabled
SC STOP vmictimesync
SC CONFIG vmictimesync start= disabled
SC STOP vmicshutdown
SC CONFIG vmicshutdown start= disabled
SC STOP vmicrdv
SC CONFIG vmicrdv start= disabled
SC STOP vmickvpexchange
SC CONFIG vmickvpexchange start= disabled
SC STOP vmicheartbeat
SC CONFIG vmicheartbeat start= disabled
SC STOP vmicguestinterface
SC CONFIG vmicguestinterface start= disabled
SC STOP VMAuthdService
SC CONFIG VMAuthdService start= disabled
SC STOP ViGEmBusUpdater
SC CONFIG ViGEmBusUpdater start= disabled
SC STOP UevAgentService
SC CONFIG UevAgentService start= disabled
SC STOP tzautoupdate
SC CONFIG tzautoupdate start= disabled
SC STOP TrkWks
SC CONFIG TrkWks start= disabled
SC STOP TimeBrokerSvc
SC CONFIG TimeBrokerSvc start= disabled
SC STOP TermService
SC CONFIG TermService start= disabled
SC STOP SysMain
SC CONFIG SysMain start= disabled
SC STOP stisvc
SC CONFIG stisvc start= disabled
SC STOP ssh-agent
SC CONFIG ssh-agent start= disabled
SC STOP shpamsvc
SC CONFIG shpamsvc start= disabled
SC STOP SharedAccess
SC CONFIG SharedAccess start= disabled
SC STOP SessionEnv
SC CONFIG SessionEnv start= disabled
SC STOP seclogon
SC CONFIG seclogon start= disabled
SC STOP SCardSvr
SC CONFIG SCardSvr start= disabled
SC STOP RetailDemo
SC CONFIG RetailDemo start= disabled
SC STOP RemoteRegistry
SC CONFIG RemoteRegistry start= disabled
SC STOP RemoteAccess
SC CONFIG RemoteAccess start= disabled
SC STOP QMEmulatorService
SC CONFIG QMEmulatorService start= disabled
SC STOP PcaSvc
SC CONFIG PcaSvc start= disabled
SC STOP MapsBroker
SC CONFIG MapsBroker start= disabled
SC STOP lmhosts
SC CONFIG lmhosts start= disabled
SC STOP lfsvc
SC CONFIG lfsvc start= disabled
SC STOP iphlpsvc
SC CONFIG iphlpsvc start= disabled
SC STOP icssvc
SC CONFIG icssvc start= disabled
SC STOP Fax
SC CONFIG Fax start= disabled
SC STOP DPS
SC CONFIG DPS start= disabled
SC STOP CscService
SC CONFIG CscService start= disabled
SC STOP aspnet_state
SC CONFIG aspnet_state start= disabled
SC STOP Dnscache
SC CONFIG Dnscache start= disabled
SC STOP XboxGipSvc
SC CONFIG XboxGipSvc start = disabled
goto start
:14
cls
Reg.exe delete "HKCR\Directory\shell\runas" /f
Reg.exe add "HKCR\Directory\shell\runas" /ve /t REG_SZ /d "Open command window here as Administrator" /f
Reg.exe add "HKCR\Directory\shell\runas" /v "HasLUAShield" /t REG_SZ /d "" /f
Reg.exe add "HKCR\Directory\shell\runas\command" /ve /t REG_SZ /d "cmd.exe /s /k pushd \"%%V\"" /f
Reg.exe delete "HKCR\Directory\Background\shell\runas" /f
Reg.exe add "HKCR\Directory\Background\shell\runas" /ve /t REG_SZ /d "Open command window here as Administrator" /f
Reg.exe add "HKCR\Directory\Background\shell\runas" /v "HasLUAShield" /t REG_SZ /d "" /f
Reg.exe add "HKCR\Directory\Background\shell\runas\command" /ve /t REG_SZ /d "cmd.exe /s /k pushd \"%%V\"" /f
Reg.exe delete "HKCR\Drive\shell\runas" /f
Reg.exe add "HKCR\Drive\shell\runas" /ve /t REG_SZ /d "Open command window here as Administrator" /f
Reg.exe add "HKCR\Drive\shell\runas" /v "HasLUAShield" /t REG_SZ /d "" /f
Reg.exe add "HKCR\Drive\shell\runas\command" /ve /t REG_SZ /d "cmd.exe /s /k pushd \"%%V\"" /f
Reg.exe delete "HKCR\LibraryFolder\background\shell\runas" /f
Reg.exe add "HKCR\LibraryFolder\background\shell\runas" /v "HasLUAShield" /t REG_SZ /d "" /f
Reg.exe add "HKCR\LibraryFolder\background\shell\runas" /ve /t REG_SZ /d "Open command window here as Administrator" /f
Reg.exe add "HKCR\LibraryFolder\background\shell\runas\command" /ve /t REG_SZ /d "cmd.exe /s /k pushd \"%%V\"" /f
goto start
:16
cls
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "ClearPageFileAtShutdown" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\943c8cb6-6f93-4227-ad87-e9a3feec08d1" /v "Attributes" /t REG_SZ /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "HibernateEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "AppCaptureEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "AITEnable" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoInstrumentation" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoInstrumentation" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\HandwritingErrorReports" /v "PreventHandwritingErrorReports" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\services\LanmanServer\Parameters" /v "autodisconnect" /t REG_DWORD /d "4294967295" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\services\LanmanServer\Parameters" /v "Size" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\services\LanmanServer\Parameters" /v "EnableOplocks" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\services\LanmanServer\Parameters" /v "IRPStackSize" /t REG_DWORD /d "32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\services\LanmanServer\Parameters" /v "SharingViolationDelay" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\services\LanmanServer\Parameters" /v "SharingViolationRetries" /t REG_DWORD /d "0" /f
Reg.exe add "HKCR\AllFilesystemObjects\shellex\ContextMenuHandlers\Copy To" /ve /t REG_SZ /d "{C2FBB630-2971-11D1-A18C-00C04FD75D13}" /f
Reg.exe add "HKCR\AllFilesystemObjects\shellex\ContextMenuHandlers\Move To" /ve /t REG_SZ /d "{C2FBB631-2971-11D1-A18C-00C04FD75D13}" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "HungAppTimeout" /t REG_SZ /d "1000" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "MenuShowDelay" /t REG_SZ /d "8" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "WaitToKillAppTimeout" /t REG_SZ /d "2000" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "LowLevelHooksTimeout" /t REG_SZ /d "1000" /f
Reg.exe add "HKCU\Control Panel\Mouse" /v "MouseHoverTime" /t REG_SZ /d "8" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoLowDiskSpaceChecks" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "LinkResolveIgnoreLinkInfo" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoResolveSearch" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoResolveTrack" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoInternetOpenWith" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\PolicyManager\default\ApplicationManagement\AllowGameDVR" /v "value" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\System\GameConfigStore" /v "GameDVR_HonorUserFSEBehaviorMode" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\System\GameConfigStore" /v "GameDVR_FSEBehavior" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\System\GameConfigStore" /v "GameDVR_DXGIHonorFSEWindowsCompatible" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d "4294967295" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Audio" /v "Affinity" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Audio" /v "Background Only" /t REG_SZ /d "True" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Audio" /v "Clock Rate" /t REG_DWORD /d "10000" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Audio" /v "GPU Priority" /t REG_DWORD /d "8" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Audio" /v "Priority" /t REG_DWORD /d "6" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Audio" /v "Scheduling Category" /t REG_SZ /d "Medium" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Audio" /v "SFIO Priority" /t REG_SZ /d "Normal" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Capture" /v "Affinity" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Capture" /v "Background Only" /t REG_SZ /d "True" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Capture" /v "Clock Rate" /t REG_DWORD /d "10000" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Capture" /v "GPU Priority" /t REG_DWORD /d "8" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Capture" /v "Priority" /t REG_DWORD /d "5" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Capture" /v "Scheduling Category" /t REG_SZ /d "Medium" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Capture" /v "SFIO Priority" /t REG_SZ /d "Normal" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\DisplayPostProcessing" /v "Affinity" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\DisplayPostProcessing" /v "Background Only" /t REG_SZ /d "True" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\DisplayPostProcessing" /v "BackgroundPriority" /t REG_DWORD /d "8" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\DisplayPostProcessing" /v "Clock Rate" /t REG_DWORD /d "10000" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\DisplayPostProcessing" /v "GPU Priority" /t REG_DWORD /d "8" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\DisplayPostProcessing" /v "Priority" /t REG_DWORD /d "8" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\DisplayPostProcessing" /v "Scheduling Category" /t REG_SZ /d "High" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\DisplayPostProcessing" /v "SFIO Priority" /t REG_SZ /d "Normal" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Distribution" /v "Affinity" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Distribution" /v "Background Only" /t REG_SZ /d "True" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Distribution" /v "Clock Rate" /t REG_DWORD /d "10000" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Distribution" /v "GPU Priority" /t REG_DWORD /d "8" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Distribution" /v "Priority" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Distribution" /v "Scheduling Category" /t REG_SZ /d "Medium" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Distribution" /v "SFIO Priority" /t REG_SZ /d "Normal" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Playback" /v "Affinity" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Playback" /v "Background Only" /t REG_SZ /d "False" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Playback" /v "BackgroundPriority" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Playback" /v "Clock Rate" /t REG_DWORD /d "10000" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Playback" /v "GPU Priority" /t REG_DWORD /d "8" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Playback" /v "Priority" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Playback" /v "Scheduling Category" /t REG_SZ /d "Medium" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Playback" /v "SFIO Priority" /t REG_SZ /d "Normal" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Pro Audio" /v "Affinity" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Pro Audio" /v "Background Only" /t REG_SZ /d "False" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Pro Audio" /v "Clock Rate" /t REG_DWORD /d "10000" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Pro Audio" /v "GPU Priority" /t REG_DWORD /d "8" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Pro Audio" /v "Priority" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Pro Audio" /v "Scheduling Category" /t REG_SZ /d "High" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Pro Audio" /v "SFIO Priority" /t REG_SZ /d "Normal" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Window Manager" /v "Affinity" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Window Manager" /v "Background Only" /t REG_SZ /d "True" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Window Manager" /v "Clock Rate" /t REG_DWORD /d "10000" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Window Manager" /v "GPU Priority" /t REG_DWORD /d "8" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Window Manager" /v "Priority" /t REG_DWORD /d "5" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Window Manager" /v "Scheduling Category" /t REG_SZ /d "Medium" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Window Manager" /v "SFIO Priority" /t REG_SZ /d "Normal" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Affinity" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Background Only" /t REG_SZ /d "False" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Clock Rate" /t REG_DWORD /d "10000" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD /d "8" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Priority" /t REG_DWORD /d "6" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Scheduling Category" /t REG_SZ /d "High" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "SFIO Priority" /t REG_SZ /d "High" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching" /v "SearchOrderConfig" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "HiberbootEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v "PowerThrottlingOff" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\System\GameConfigStore" /v "GameDVR_Enabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\System\GameConfigStore" /v "GameDVR_FSEBehaviorMode" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\System\GameConfigStore" /v "Win32_AutoGameModeDefaultProfile" /t REG_BINARY /d "01000100000000000000000000000000000000000000000000000000000000000000000000000000" /f
Reg.exe add "HKCU\System\GameConfigStore" /v "Win32_GameModeRelatedProcesses" /t REG_BINARY /d "010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" /f
Reg.exe add "HKCU\System\GameConfigStore" /v "GameDVR_HonorUserFSEBehaviorMode" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\System\GameConfigStore" /v "GameDVR_DXGIHonorFSEWindowsCompatible" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\System\GameConfigStore" /v "GameDVR_EFSEFeatureFlags" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "HibernateEnabledDefault" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "MenuShowDelay" /t REG_SZ /d "0" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "WaitToKillAppTimeout" /t REG_SZ /d "5000" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "HungAppTimeout" /t REG_SZ /d "4000" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "AutoEndTasks" /t REG_SZ /d "1" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "LowLevelHooksTimeout" /t REG_DWORD /d "4096" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "WaitToKillServiceTimeout" /t REG_DWORD /d "8192" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control" /v "WaitToKillServiceTimeout" /t REG_SZ /d "2000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\943c8cb6-6f93-4227-ad87-e9a3feec08d1" /v "Attributes" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\d4e98f31-5ffe-4ce1-be31-1b38b384c009\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "ACSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\d4e98f31-5ffe-4ce1-be31-1b38b384c009\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DCSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\d4e98f31-5ffe-4ce1-be31-1b38b384c009\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "ACSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\3b04d4fd-1cc7-4f23-ab1c-d1337819c4bb\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "ACSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\3b04d4fd-1cc7-4f23-ab1c-d1337819c4bb\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DCSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\3b04d4fd-1cc7-4f23-ab1c-d1337819c4bb\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "ACSettingIndex" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v Disabled /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v Disabled /t REG_DWORD /d 1 /f
reg add "HKLM\Software\Policies\Microsoft\Windows\CloudContent" /v DisableSoftLanding /t REG_DWORD /d 1 /f
reg add "HKLM\Software\Policies\Microsoft\Windows\CloudContent" /v DisableWindowsSpotlightFeatures /t REG_DWORD /d 1 /f
reg add "HKLM\Software\Policies\Microsoft\Windows\CloudContent" /v DisableWindowsConsumerFeatures /t REG_DWORD /d 1 /f
reg add "HKLM\Software\Policies\Microsoft\Windows\DataCollection" /v DoNotShowFeedbackNotifications /t REG_DWORD /d 1 /f
reg add "HKLM\Software\Policies\Microsoft\WindowsInkWorkspace" /v AllowSuggestedAppsInWindowsInkWorkspace /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\MRT" /v "DontReportInfectionInformation" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\MRT" /v "DontOfferThroughWUAU" /t REG_DWORD /d 1 /f
REG ADD HKey_Local_Machine\System\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\ /v TcpAckFrequency /t REG_DWORD /d 0 /f
REG ADD HKey_Local_Machine\System\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\ /v TCPNoDelay /t REG_DWORD /d
schtasks /Change /TN "Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /disable
schtasks /Change /TN "Microsoft\Windows\FileHistory\File History (maintenance mode)" /disable
schtasks /Change /TN "Microsoft\Windows\Maintenance\WinSAT" /disable
schtasks /Change /TN "Microsoft\Windows\Windows Error Reporting\QueueReporting" /disable
schtasks /Change /TN "Microsoft\Windows\WindowsUpdate\Automatic App Update" /disable
schtasks /Change /TN "Microsoft\Windows\License Manager\TempSignedLicenseExchange" /disable
schtasks /Change /TN "\Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem" /disable
schtasks /Change /TN "\Microsoft\Windows\PushToInstall\LoginCheck" /disable
schtasks /Change /TN "\Microsoft\Windows\PushToInstall\Registration" /disable
schtasks /Change /TN "\Microsoft\Windows\Shell\FamilySafetyMonitor" /disable
schtasks /Change /TN "\Microsoft\Windows\Shell\FamilySafetyMonitorToastTask" /disable
schtasks /Change /TN "\Microsoft\Windows\Shell\FamilySafetyRefreshTask" /disable
schtasks /Change /TN "\Microsoft\Windows\Subscription\EnableLicenseAcquisition" /disable
schtasks /Change /TN "\Microsoft\Windows\Subscription\LicenseAcquisition" /disable
schtasks /Change /TN "\Microsoft\Windows\Diagnosis\RecommendedTroubleshootingScanner" /disable
schtasks /Change /TN "\Microsoft\Windows\Diagnosis\Scheduled" /disable
schtasks /Change /TN "\Microsoft\Windows\NetTrace\GatherNetworkInfo" /disable
bcdedit /deletevalue useplatformclock
bcdedit /set disabledynamictick yes
bcdedit /set useplatformtick yes
ipconfig /flushdns
regsvr32 actxprxy.dll
netsh int tcp set global autotuninglevel=disabled
netsh int ip reset c:\resetlog.txt
netsh winsock reset
netsh advfirewall firewall add rule name="StopThrottling" dir=in action=block remoteip=173.194.55.0/24,206.111.0.0/16 enable=yes
netsh int tcp show global
netsh int tcp set global chimney=enabled
netsh int tcp set heuristics disabled
netsh int tcp set global autotuninglevel=normal
netsh int tcp set global congestionprovider=ctcp
netsh advfirewall firewall add rule name="YouTubeTweak" dir=in action=block remoteip=173.194.55.0/24,206.111.0.0/16 enable=yes
SC STOP Spooler
SC CONFIG Spooler start= disabled
SC STOP WMPNetworkSvc
SC CONFIG WMPNetworkSvc start= disabled
SC STOP wisvc
SC CONFIG wisvc start= disabled
SC STOP WerSvc
SC CONFIG WerSvc start= disabled
SC STOP WbioSrvc
SC CONFIG WbioSrvc start= disabled
SC STOP vmicvss
SC CONFIG vmicvss start= disabled
SC STOP vmicvmsession
SC CONFIG vmicvmsession start= disabled
SC STOP vmictimesync
SC CONFIG vmictimesync start= disabled
SC STOP vmicshutdown
SC CONFIG vmicshutdown start= disabled
SC STOP vmicrdv
SC CONFIG vmicrdv start= disabled
SC STOP vmickvpexchange
SC CONFIG vmickvpexchange start= disabled
SC STOP vmicheartbeat
SC CONFIG vmicheartbeat start= disabled
SC STOP vmicguestinterface
SC CONFIG vmicguestinterface start= disabled
SC STOP VMAuthdService
SC CONFIG VMAuthdService start= disabled
SC STOP ViGEmBusUpdater
SC CONFIG ViGEmBusUpdater start= disabled
SC STOP UevAgentService
SC CONFIG UevAgentService start= disabled
SC STOP tzautoupdate
SC CONFIG tzautoupdate start= disabled
SC STOP TrkWks
SC CONFIG TrkWks start= disabled
SC STOP TimeBrokerSvc
SC CONFIG TimeBrokerSvc start= disabled
SC STOP TermService
SC CONFIG TermService start= disabled
SC STOP SysMain
SC CONFIG SysMain start= disabled
SC STOP stisvc
SC CONFIG stisvc start= disabled
SC STOP ssh-agent
SC CONFIG ssh-agent start= disabled
SC STOP shpamsvc
SC CONFIG shpamsvc start= disabled
SC STOP SharedAccess
SC CONFIG SharedAccess start= disabled
SC STOP SessionEnv
SC CONFIG SessionEnv start= disabled
SC STOP seclogon
SC CONFIG seclogon start= disabled
SC STOP SCardSvr
SC CONFIG SCardSvr start= disabled
SC STOP RetailDemo
SC CONFIG RetailDemo start= disabled
SC STOP RemoteRegistry
SC CONFIG RemoteRegistry start= disabled
SC STOP RemoteAccess
SC CONFIG RemoteAccess start= disabled
SC STOP QMEmulatorService
SC CONFIG QMEmulatorService start= disabled
SC STOP PcaSvc
SC CONFIG PcaSvc start= disabled
SC STOP MapsBroker
SC CONFIG MapsBroker start= disabled
SC STOP lmhosts
SC CONFIG lmhosts start= disabled
SC STOP lfsvc
SC CONFIG lfsvc start= disabled
SC STOP iphlpsvc
SC CONFIG iphlpsvc start= disabled
SC STOP icssvc
SC CONFIG icssvc start= disabled
SC STOP Fax
SC CONFIG Fax start= disabled
SC STOP DPS
SC CONFIG DPS start= disabled
SC STOP CscService
SC CONFIG CscService start= disabled
SC STOP aspnet_state
SC CONFIG aspnet_state start= disabled
SC STOP Dnscache
SC CONFIG Dnscache start= disabled
SC STOP XboxGipSvc
SC CONFIG XboxGipSvc start = disabled
taskkill /f /im explorer.exe
start explorer.exe
goto start
:msoffice
cls
wget -P c: https://dl.malwat.ch/software/useful/office/MSOffice1619.zip
echo Password: mysubsarethebest
pause
goto 11
:vmware
cls
wget -P c: https://dl.malwat.ch/software/useful/vmware/VMwareWorkstation16.zip
echo Password: mysubsarethebest
pause
goto 11
wget -P c: https://github.com/omartube706/SteavenToolBox/raw/main/dxwebsetup.exe
@pause
goto 11
:22
cls
Echo Welcome To Steaven Windows 10 Cleanup
Echo This will add users/apps/ delete apps/users/settings /modifie settings
echo Recommend in frecsh install of Steaven Windows 10
pause
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "ClearPageFileAtShutdown" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\943c8cb6-6f93-4227-ad87-e9a3feec08d1" /v "Attributes" /t REG_SZ /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "HibernateEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "AppCaptureEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "AITEnable" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoInstrumentation" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoInstrumentation" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\HandwritingErrorReports" /v "PreventHandwritingErrorReports" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\services\LanmanServer\Parameters" /v "autodisconnect" /t REG_DWORD /d "4294967295" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\services\LanmanServer\Parameters" /v "Size" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\services\LanmanServer\Parameters" /v "EnableOplocks" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\services\LanmanServer\Parameters" /v "IRPStackSize" /t REG_DWORD /d "32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\services\LanmanServer\Parameters" /v "SharingViolationDelay" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\services\LanmanServer\Parameters" /v "SharingViolationRetries" /t REG_DWORD /d "0" /f
Reg.exe add "HKCR\AllFilesystemObjects\shellex\ContextMenuHandlers\Copy To" /ve /t REG_SZ /d "{C2FBB630-2971-11D1-A18C-00C04FD75D13}" /f
Reg.exe add "HKCR\AllFilesystemObjects\shellex\ContextMenuHandlers\Move To" /ve /t REG_SZ /d "{C2FBB631-2971-11D1-A18C-00C04FD75D13}" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "HungAppTimeout" /t REG_SZ /d "1000" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "MenuShowDelay" /t REG_SZ /d "8" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "WaitToKillAppTimeout" /t REG_SZ /d "2000" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "LowLevelHooksTimeout" /t REG_SZ /d "1000" /f
Reg.exe add "HKCU\Control Panel\Mouse" /v "MouseHoverTime" /t REG_SZ /d "8" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoLowDiskSpaceChecks" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "LinkResolveIgnoreLinkInfo" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoResolveSearch" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoResolveTrack" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoInternetOpenWith" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\PolicyManager\default\ApplicationManagement\AllowGameDVR" /v "value" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\System\GameConfigStore" /v "GameDVR_HonorUserFSEBehaviorMode" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\System\GameConfigStore" /v "GameDVR_FSEBehavior" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\System\GameConfigStore" /v "GameDVR_DXGIHonorFSEWindowsCompatible" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d "4294967295" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Audio" /v "Affinity" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Audio" /v "Background Only" /t REG_SZ /d "True" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Audio" /v "Clock Rate" /t REG_DWORD /d "10000" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Audio" /v "GPU Priority" /t REG_DWORD /d "8" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Audio" /v "Priority" /t REG_DWORD /d "6" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Audio" /v "Scheduling Category" /t REG_SZ /d "Medium" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Audio" /v "SFIO Priority" /t REG_SZ /d "Normal" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Capture" /v "Affinity" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Capture" /v "Background Only" /t REG_SZ /d "True" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Capture" /v "Clock Rate" /t REG_DWORD /d "10000" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Capture" /v "GPU Priority" /t REG_DWORD /d "8" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Capture" /v "Priority" /t REG_DWORD /d "5" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Capture" /v "Scheduling Category" /t REG_SZ /d "Medium" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Capture" /v "SFIO Priority" /t REG_SZ /d "Normal" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\DisplayPostProcessing" /v "Affinity" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\DisplayPostProcessing" /v "Background Only" /t REG_SZ /d "True" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\DisplayPostProcessing" /v "BackgroundPriority" /t REG_DWORD /d "8" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\DisplayPostProcessing" /v "Clock Rate" /t REG_DWORD /d "10000" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\DisplayPostProcessing" /v "GPU Priority" /t REG_DWORD /d "8" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\DisplayPostProcessing" /v "Priority" /t REG_DWORD /d "8" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\DisplayPostProcessing" /v "Scheduling Category" /t REG_SZ /d "High" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\DisplayPostProcessing" /v "SFIO Priority" /t REG_SZ /d "Normal" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Distribution" /v "Affinity" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Distribution" /v "Background Only" /t REG_SZ /d "True" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Distribution" /v "Clock Rate" /t REG_DWORD /d "10000" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Distribution" /v "GPU Priority" /t REG_DWORD /d "8" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Distribution" /v "Priority" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Distribution" /v "Scheduling Category" /t REG_SZ /d "Medium" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Distribution" /v "SFIO Priority" /t REG_SZ /d "Normal" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Playback" /v "Affinity" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Playback" /v "Background Only" /t REG_SZ /d "False" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Playback" /v "BackgroundPriority" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Playback" /v "Clock Rate" /t REG_DWORD /d "10000" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Playback" /v "GPU Priority" /t REG_DWORD /d "8" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Playback" /v "Priority" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Playback" /v "Scheduling Category" /t REG_SZ /d "Medium" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Playback" /v "SFIO Priority" /t REG_SZ /d "Normal" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Pro Audio" /v "Affinity" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Pro Audio" /v "Background Only" /t REG_SZ /d "False" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Pro Audio" /v "Clock Rate" /t REG_DWORD /d "10000" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Pro Audio" /v "GPU Priority" /t REG_DWORD /d "8" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Pro Audio" /v "Priority" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Pro Audio" /v "Scheduling Category" /t REG_SZ /d "High" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Pro Audio" /v "SFIO Priority" /t REG_SZ /d "Normal" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Window Manager" /v "Affinity" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Window Manager" /v "Background Only" /t REG_SZ /d "True" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Window Manager" /v "Clock Rate" /t REG_DWORD /d "10000" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Window Manager" /v "GPU Priority" /t REG_DWORD /d "8" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Window Manager" /v "Priority" /t REG_DWORD /d "5" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Window Manager" /v "Scheduling Category" /t REG_SZ /d "Medium" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Window Manager" /v "SFIO Priority" /t REG_SZ /d "Normal" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Affinity" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Background Only" /t REG_SZ /d "False" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Clock Rate" /t REG_DWORD /d "10000" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD /d "8" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Priority" /t REG_DWORD /d "6" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Scheduling Category" /t REG_SZ /d "High" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "SFIO Priority" /t REG_SZ /d "High" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching" /v "SearchOrderConfig" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "HiberbootEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v "PowerThrottlingOff" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\System\GameConfigStore" /v "GameDVR_Enabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\System\GameConfigStore" /v "GameDVR_FSEBehaviorMode" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\System\GameConfigStore" /v "Win32_AutoGameModeDefaultProfile" /t REG_BINARY /d "01000100000000000000000000000000000000000000000000000000000000000000000000000000" /f
Reg.exe add "HKCU\System\GameConfigStore" /v "Win32_GameModeRelatedProcesses" /t REG_BINARY /d "010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" /f
Reg.exe add "HKCU\System\GameConfigStore" /v "GameDVR_HonorUserFSEBehaviorMode" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\System\GameConfigStore" /v "GameDVR_DXGIHonorFSEWindowsCompatible" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\System\GameConfigStore" /v "GameDVR_EFSEFeatureFlags" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "HibernateEnabledDefault" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "MenuShowDelay" /t REG_SZ /d "0" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "WaitToKillAppTimeout" /t REG_SZ /d "5000" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "HungAppTimeout" /t REG_SZ /d "4000" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "AutoEndTasks" /t REG_SZ /d "1" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "LowLevelHooksTimeout" /t REG_DWORD /d "4096" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "WaitToKillServiceTimeout" /t REG_DWORD /d "8192" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control" /v "WaitToKillServiceTimeout" /t REG_SZ /d "2000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\943c8cb6-6f93-4227-ad87-e9a3feec08d1" /v "Attributes" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\d4e98f31-5ffe-4ce1-be31-1b38b384c009\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "ACSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\d4e98f31-5ffe-4ce1-be31-1b38b384c009\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DCSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\d4e98f31-5ffe-4ce1-be31-1b38b384c009\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "ACSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\3b04d4fd-1cc7-4f23-ab1c-d1337819c4bb\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "ACSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\3b04d4fd-1cc7-4f23-ab1c-d1337819c4bb\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DCSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\3b04d4fd-1cc7-4f23-ab1c-d1337819c4bb\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "ACSettingIndex" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v Disabled /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v Disabled /t REG_DWORD /d 1 /f
reg add "HKLM\Software\Policies\Microsoft\Windows\CloudContent" /v DisableSoftLanding /t REG_DWORD /d 1 /f
reg add "HKLM\Software\Policies\Microsoft\Windows\CloudContent" /v DisableWindowsSpotlightFeatures /t REG_DWORD /d 1 /f
reg add "HKLM\Software\Policies\Microsoft\Windows\CloudContent" /v DisableWindowsConsumerFeatures /t REG_DWORD /d 1 /f
reg add "HKLM\Software\Policies\Microsoft\Windows\DataCollection" /v DoNotShowFeedbackNotifications /t REG_DWORD /d 1 /f
reg add "HKLM\Software\Policies\Microsoft\WindowsInkWorkspace" /v AllowSuggestedAppsInWindowsInkWorkspace /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\MRT" /v "DontReportInfectionInformation" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\MRT" /v "DontOfferThroughWUAU" /t REG_DWORD /d 1 /f
REG ADD HKey_Local_Machine\System\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\ /v TcpAckFrequency /t REG_DWORD /d 0 /f
REG ADD HKey_Local_Machine\System\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\ /v TCPNoDelay /t REG_DWORD /d
schtasks /Change /TN "Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /disable
schtasks /Change /TN "Microsoft\Windows\FileHistory\File History (maintenance mode)" /disable
schtasks /Change /TN "Microsoft\Windows\Maintenance\WinSAT" /disable
schtasks /Change /TN "Microsoft\Windows\Windows Error Reporting\QueueReporting" /disable
schtasks /Change /TN "Microsoft\Windows\WindowsUpdate\Automatic App Update" /disable
schtasks /Change /TN "Microsoft\Windows\License Manager\TempSignedLicenseExchange" /disable
schtasks /Change /TN "\Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem" /disable
schtasks /Change /TN "\Microsoft\Windows\PushToInstall\LoginCheck" /disable
schtasks /Change /TN "\Microsoft\Windows\PushToInstall\Registration" /disable
schtasks /Change /TN "\Microsoft\Windows\Shell\FamilySafetyMonitor" /disable
schtasks /Change /TN "\Microsoft\Windows\Shell\FamilySafetyMonitorToastTask" /disable
schtasks /Change /TN "\Microsoft\Windows\Shell\FamilySafetyRefreshTask" /disable
schtasks /Change /TN "\Microsoft\Windows\Subscription\EnableLicenseAcquisition" /disable
schtasks /Change /TN "\Microsoft\Windows\Subscription\LicenseAcquisition" /disable
schtasks /Change /TN "\Microsoft\Windows\Diagnosis\RecommendedTroubleshootingScanner" /disable
schtasks /Change /TN "\Microsoft\Windows\Diagnosis\Scheduled" /disable
schtasks /Change /TN "\Microsoft\Windows\NetTrace\GatherNetworkInfo" /disable
bcdedit /deletevalue useplatformclock
bcdedit /set disabledynamictick yes
bcdedit /set useplatformtick yes
ipconfig /flushdns
netsh int tcp set global autotuninglevel=disabled
netsh int ip reset c:\resetlog.txt
netsh winsock reset
netsh advfirewall firewall add rule name="StopThrottling" dir=in action=block remoteip=173.194.55.0/24,206.111.0.0/16 enable=yes
netsh int tcp show global
netsh int tcp set global chimney=enabled
netsh int tcp set heuristics disabled
netsh int tcp set global autotuninglevel=normal
netsh int tcp set global congestionprovider=ctcp
netsh advfirewall firewall add rule name="YouTubeTweak" dir=in action=block remoteip=173.194.55.0/24,206.111.0.0/16 enable=yes
SC STOP Spooler
SC CONFIG Spooler start= disabled
SC STOP WMPNetworkSvc
SC CONFIG WMPNetworkSvc start= disabled
SC STOP wisvc
SC CONFIG wisvc start= disabled
SC STOP WerSvc
SC CONFIG WerSvc start= disabled
SC STOP WbioSrvc
SC CONFIG WbioSrvc start= disabled
SC STOP vmicvss
SC CONFIG vmicvss start= disabled
SC STOP vmicvmsession
SC CONFIG vmicvmsession start= disabled
SC STOP vmictimesync
SC CONFIG vmictimesync start= disabled
SC STOP vmicshutdown
SC CONFIG vmicshutdown start= disabled
SC STOP vmicrdv
SC CONFIG vmicrdv start= disabled
SC STOP vmickvpexchange
SC CONFIG vmickvpexchange start= disabled
SC STOP vmicheartbeat
SC CONFIG vmicheartbeat start= disabled
SC STOP vmicguestinterface
SC CONFIG vmicguestinterface start= disabled
SC STOP VMAuthdService
SC CONFIG VMAuthdService start= disabled
SC STOP ViGEmBusUpdater
SC CONFIG ViGEmBusUpdater start= disabled
SC STOP UevAgentService
SC CONFIG UevAgentService start= disabled
SC STOP tzautoupdate
SC CONFIG tzautoupdate start= disabled
SC STOP TrkWks
SC CONFIG TrkWks start= disabled
SC STOP TimeBrokerSvc
SC CONFIG TimeBrokerSvc start= disabled
SC STOP TermService
SC CONFIG TermService start= disabled
SC STOP SysMain
SC CONFIG SysMain start= disabled
SC STOP stisvc
SC CONFIG stisvc start= disabled
SC STOP ssh-agent
SC CONFIG ssh-agent start= disabled
SC STOP shpamsvc
SC CONFIG shpamsvc start= disabled
SC STOP SharedAccess
SC CONFIG SharedAccess start= disabled
SC STOP SessionEnv
SC CONFIG SessionEnv start= disabled
SC STOP seclogon
SC CONFIG seclogon start= disabled
SC STOP SCardSvr
SC CONFIG SCardSvr start= disabled
SC STOP RetailDemo
SC CONFIG RetailDemo start= disabled
SC STOP RemoteRegistry
SC CONFIG RemoteRegistry start= disabled
SC STOP RemoteAccess
SC CONFIG RemoteAccess start= disabled
SC STOP QMEmulatorService
SC CONFIG QMEmulatorService start= disabled
SC STOP PcaSvc
SC CONFIG PcaSvc start= disabled
SC STOP MapsBroker
SC CONFIG MapsBroker start= disabled
SC STOP lmhosts
SC CONFIG lmhosts start= disabled
SC STOP lfsvc
SC CONFIG lfsvc start= disabled
SC STOP iphlpsvc
SC CONFIG iphlpsvc start= disabled
SC STOP icssvc
SC CONFIG icssvc start= disabled
SC STOP Fax
SC CONFIG Fax start= disabled
SC STOP DPS
SC CONFIG DPS start= disabled
SC STOP CscService
SC CONFIG CscService start= disabled
SC STOP aspnet_state
SC CONFIG aspnet_state start= disabled
SC STOP Dnscache
SC CONFIG Dnscache start= disabled
SC STOP XboxGipSvc
SC CONFIG XboxGipSvc start = disabled
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\NDIS" /v "Start" /t REG_DWORD /d "0" /f
regsvr32 actxprxy.dll
goto start
:23
cls
title Microsoft Office 2016 Activation (Muaz Ahmed)!&cls&echo ============================================================================&echo #Project: Microsoft Office Activation by Muaz Ahmed/Alpha_R&echo ============================================================================&echo.&echo #Supported products:&echo - Microsoft Office Standard 2016&echo - Microsoft Office Professional Plus 2016&echo.&echo.&(if exist "%ProgramFiles%\Microsoft Office\Office16\ospp.vbs" cd /d "%ProgramFiles%\Microsoft Office\Office16")&(if exist "%ProgramFiles(x86)%\Microsoft Office\Office16\ospp.vbs" cd /d "%ProgramFiles(x86)%\Microsoft Office\Office16")&(for /f %%x in ('dir /b ..\root\Licenses16\proplusvl_kms*.xrm-ms') do cscript ospp.vbs /inslic:"..\root\Licenses16\%%x" >nul)&(for /f %%x in ('dir /b ..\root\Licenses16\proplusvl_mak*.xrm-ms') do cscript ospp.vbs /inslic:"..\root\Licenses16\%%x" >nul)&echo.&echo ============================================================================&echo Activating your Office...&cscript //nologo ospp.vbs /unpkey:WFG99 >nul&cscript //nologo ospp.vbs /unpkey:DRTFM >nul&cscript //nologo ospp.vbs /unpkey:BTDRB >nul&cscript //nologo ospp.vbs /unpkey:CPQVG >nul&cscript //nologo ospp.vbs /inpkey:XQNVK-8JYDB-WJ9W3-YJ8YR-WFG99 >nul&set i=1
:server
if %i%==1 set KMS_Sev=kms7.MSGuides.com
if %i%==2 set KMS_Sev=kms8.MSGuides.com
if %i%==3 set KMS_Sev=kms9.MSGuides.com
if %i%==4 goto notsupported
cscript //nologo ospp.vbs /sethst:%KMS_Sev% >nul&echo ============================================================================&echo.&echo.
cscript //nologo ospp.vbs /act | find /i "successful" && (echo.&echo ============================================================================&echo.&echo #My official blog: www.muazforpc.wordpress.com&echo.&echo #Please feel free to contact me at if you have any questions or concerns.&echo.&echo #Please consider supporting this project: www.muazforpc.wordpress.com&echo #Your support is helping me keep my servers running everyday!&echo.&echo ============================================================================&choice /n /c YN /m "Would you like to visit my blog [Y,N]?" & if errorlevel 2 exit) || (echo The connection to my KMS server failed! Trying to connect to another one... & echo Please wait... & echo. & echo. & set /a i+=1 & goto server)
explorer "https://muazforpc.wordpress.com"&goto halt
:notsupported
echo.&echo ============================================================================&echo Sorry! Your version is not supported.&echo Please try installing the latest version here: bit.ly/odt2k16
:halt
pause >nul
goto start
:rufus
cls
wget -P c: https://dl.malwat.ch/software/advanced/Rufus.zip
echo Password: mysubsarethebest
pause
goto 11
:winrar2
cls
wget -P "C:\Program Files\WinRAR" https://github.com/omartube706/SteavenToolBox/raw/main/Themes.exe
cd C:\Program Files\WinRAR"
"C:\Program Files\WinRAR\Themes.exe" -s2
goto 11
:winphtoviewer
cls
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /v ".tif" /t REG_SZ /d "PhotoViewer.FileAssoc.Tiff" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /v ".tiff" /t REG_SZ /d "PhotoViewer.FileAssoc.Tiff" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /v ".bmp" /t REG_SZ /d "PhotoViewer.FileAssoc.Tiff" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /v ".dib" /t REG_SZ /d "PhotoViewer.FileAssoc.Tiff" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /v ".gif" /t REG_SZ /d "PhotoViewer.FileAssoc.Tiff" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /v ".jfif" /t REG_SZ /d "PhotoViewer.FileAssoc.Tiff" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /v ".jpe" /t REG_SZ /d "PhotoViewer.FileAssoc.Tiff" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /v ".jpeg" /t REG_SZ /d "PhotoViewer.FileAssoc.Tiff" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /v ".jpg" /t REG_SZ /d "PhotoViewer.FileAssoc.Tiff" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /v ".jxr" /t REG_SZ /d "PhotoViewer.FileAssoc.Tiff" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /v ".png" /t REG_SZ /d "PhotoViewer.FileAssoc.Tiff" /f
goto 11
:17
cls
echo 1. Steam
echo 2. Epic Games
echo 3. Parsec
echo 4. Origin
echo 5. Playnite
echo 6. Amazon Games
echo 7. Gameplay Time Tracker
echo 8. Console Classix
echo 9. Nvidia GeForce NOW
echo 10. GOG Galaxy
echo 11. Mupen64Plus
echo 12. Bethesda.Net
echo 13. PCSX2
echo 14. FS-UAE
echo 15. RetroArch
echo 16. Game Backup Monitor
echo 17. Steam Library Manager
echo 18. LaunchBox
echo 19. GameSave Manager
echo 20. BorderlessGaming
echo 21. itch.io
echo 22. EmulationStation
echo 23. DOSBox
echo 24. Steam Cleaner
echo 25. Battle.net
echo 26. Dolphin Emulator
echo 27. Joy To Key
echo 0. Back to menu
set choice=
set /p choice=Type the number.
if not '%choice%'=='' set choice=%choice:~0,10%
if '%choice%'=='1' choco install steam-client steamcmd -y
if '%choice%'=='2' choco install epicgameslauncher -y
if '%choice%'=='3' choco install parsec -y
if '%choice%'=='4' choco install origin -y
if '%choice%'=='5' choco install playnite -y
if '%choice%'=='6' choco install amazongames -y
if '%choice%'=='7' choco install gameplay-time-tracker -y
if '%choice%'=='8' choco install consoleclassix -y
if '%choice%'=='9' choco install nvidia-geforce-now -y
if '%choice%'=='10' choco install goggalaxy -y
if '%choice%'=='11' choco install mupen64plus -y
if '%choice%'=='12' choco install bethesdanet -y
if '%choice%'=='13' choco install pcsx2.install -y
if '%choice%'=='14' choco install fs-uae -y
if '%choice%'=='15' choco install retroarch -y
if '%choice%'=='16' choco install gbm -y
if '%choice%'=='17' choco install steamlibrarymanager.portable -y
if '%choice%'=='18' choco install launchbox -y
if '%choice%'=='19' choco install gamesavemanager -y
if '%choice%'=='20' choco install borderlessgaming -y
if '%choice%'=='21' choco install itch -y
if '%choice%'=='22' choco install emulationstation.install -y
if '%choice%'=='23' choco install dosbox -y
if '%choice%'=='24' choco install steam-cleaner -y
if '%choice%'=='25' choco install battle.net -y
if '%choice%'=='26' choco install dolphin -y
if '%choice%'=='27' choco install joytokey -y
if '%choice%'=='0' goto start
goto start
ECHO "%choice%" is not valid, try again
ECHO.
goto 17
:18
cls
echo 1. Kingsoft Office
echo 2. Office 365 ProPlus
echo 3. Microsoft Office 2019 ProPlus
echo 4. Microsoft Office Professional Plus 2013
echo 5. Office 365 Business
echo 6. WPS Office
echo 0. Back to menu
set choice=
set /p choice=Type the number.
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' choco install kingsoft-office-free -y
if '%choice%'=='2' choco install office365proplus -y
if '%choice%'=='3' choco install office2019proplus -y
if '%choice%'=='4' choco install officeproplus2013 -y
if '%choice%'=='5' choco install office365business -y
if '%choice%'=='6' choco install wps-office-free -y
if '%choice%'=='0' goto start
goto start
ECHO "%choice%" is not valid, try again
ECHO.
goto 18
:themes
cls
Echo 1. sonic
echo 2. Roblox
echo 3. Rocket League
echo 4. Steaven Theme
echo 5. Call of duty Black Ops 4
echo ---------------------------------------------------------------------------------------------------------------------
echo 0. Back to menu
set choice=
set /p choice=Type the number.
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' wget -P c: https://github.com/SteavenGamerYT/SteavenToolBox/raw/main/Themes/sonic.deskthemepack & start /wait c:\sonic.deskthemepack & goto themes
if '%choice%'=='2' wget -P c: https://github.com/SteavenGamerYT/SteavenToolBox/raw/main/Themes/roblox.deskthemepack & start /wait c:\roblox.deskthemepack & goto themes
if '%choice%'=='3' wget -P c: https://github.com/SteavenGamerYT/SteavenToolBox/raw/main/Themes/rocket-league.deskthemepack & start /wait c:\rocket-league.deskthemepack & goto themes
if '%choice%'=='4' wget -P c: https://github.com/SteavenGamerYT/SteavenToolBox/raw/main/Themes/Steaven.deskthemepack & start /wait c:\Steaven.deskthemepack & goto themes
if '%choice%'=='5' wget -P c: https://github.com/SteavenGamerYT/SteavenToolBox/raw/main/Themes/call-of-duty-black-ops-4.deskthemepack & start /wait c:\call-of-duty-black-ops-4.deskthemepack & goto themes
if '%choice%'=='0' goto start
goto themes
:15
cls
echo ---------------------------------------------------------------------------------------------------------------------
echo 1. Get Rid of Hyper-v Forever (removes subsystem for linux and android)
echo 2. Get Rid of Appx forever (store incloding it's apps)
echo 3. Get Rid of Internet Explorer Forever (removes that old ie 11 that no one uses)
echo 0. Back to Main
echo ---------------------------------------------------------------------------------------------------------------------
set choice=
set /p choice=Type the number.
if not '%choice%'=='' set choice=%choice:~0,100%
if '%choice%'=='1' goto uhyperv
if '%choice%'=='0' goto start
if '%choice%'=='2' powershell -command "Get-AppxPackage * | Remove-AppxPackage"
if '%choice%'=='3' goto ieremove
ECHO "%choice%" is not valid, try again
ECHO.
goto 15
:uhyperv
cls
wget -P c: https://github.com/SteavenGamerYT/SteavenToolBox/raw/main/install_wim_tweak.exe
cd c:\
cd \
install_wim_tweak.exe /o /c HyperV /r
install_wim_tweak.exe /o /c Microsoft-Hyper-V /r
install_wim_tweak.exe /o /c Microsoft-Windows-HyperV /r
goto 15
:ieremove
cls
wget -P c: https://github.com/SteavenGamerYT/SteavenToolBox/raw/main/install_wim_tweak.exe
cd c:\
cd \
install_wim_tweak.exe /o /c Microsoft-Windows-InternetExplorer /r
goto 15
:store22
cls
cd c:\
cd \
git clone https://github.com/kkkgo/LTSC-Add-MicrosoftStore.git
cd LTSC-Add-MicrosoftStore
Add-Store.cmd
goto start
:updatefix
cls
color 9
echo ---------------------------------------------------------------------------------------------------------------------
echo 0. Main
echo ---------------------------------------------------------------------------------------------------------------------
echo 1. Get Windows 11 on unsupported devices!
echo ---------------------------------------------------------------------------------------------------------------------
echo Chose your build that you are in right now
echo That will make you never upgrade to newer build that mean stable pc stable performace!
echo 2. 21h2
echo 3. 21h1
echo 4. 20h2 (2009)
echo 5. 20h1 (2004)
echo 6. 19h2 (1909)
echo 7. 19h1 (1903)
echo 8. 1809
echo 9. 1607
echo 10. Undo
echo ---------------------------------------------------------------------------------------------------------------------
echo Chose If you want to not get non security and security updates or security updates only!
echo Note: this wont remove the frist setting
echo 11. Security Updates only
echo 12. Security and non
echo ---------------------------------------------------------------------------------------------------------------------
set choice=
set /p choice=Type the number.
if not '%choice%'=='' set choice=%choice:~0,100%
if '%choice%'=='1' Reg.exe add "HKLM\SYSTEM\Setup\LabConfig" /v "BypassTPMCheck" /t REG_DWORD /d "1" /f & Reg.exe add "HKLM\SYSTEM\Setup\LabConfig" /v "BypassRAMCheck" /t REG_DWORD /d "1" /f & Reg.exe add "HKLM\SYSTEM\Setup\LabConfig" /v "BypassSecureBootCheck" /t REG_DWORD /d "1" /f
if '%choice%'=='3' reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate /f /v TargetReleaseVersion /t REG_DWORD /d 1 & reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate /f /v TargetReleaseVersionInfo /t REG_SZ /d 21h2
if '%choice%'=='3' reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate /f /v TargetReleaseVersion /t REG_DWORD /d 1 & reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate /f /v TargetReleaseVersionInfo /t REG_SZ /d 21h1
if '%choice%'=='4' reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate /f /v TargetReleaseVersion /t REG_DWORD /d 1 & reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate /f /v TargetReleaseVersionInfo /t REG_SZ /d 20h2
if '%choice%'=='5' reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate /f /v TargetReleaseVersion /t REG_DWORD /d 1 & reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate /f /v TargetReleaseVersionInfo /t REG_SZ /d 2004
if '%choice%'=='6' reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate /f /v TargetReleaseVersion /t REG_DWORD /d 1 & reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate /f /v TargetReleaseVersionInfo /t REG_SZ /d 1903
if '%choice%'=='7' reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate /f /v TargetReleaseVersion /t REG_DWORD /d 1 & reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate /f /v TargetReleaseVersionInfo /t REG_SZ /d 1903
if '%choice%'=='8' reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate /f /v TargetReleaseVersion /t REG_DWORD /d 1 & reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate /f /v TargetReleaseVersionInfo /t REG_SZ /d 1809
if '%choice%'=='9' reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate /f /v TargetReleaseVersion /t REG_DWORD /d 1 & reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate /f /v TargetReleaseVersionInfo /t REG_SZ /d 1607
if '%choice%'=='10' reg delete  HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate /v TargetReleaseVersion /f & reg delete HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate /v TargetReleaseVersionInfo /f
if '%choice%'=='11' Reg.exe add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "AllowAutoWindowsUpdateDownloadOverMeteredNetwork" /t REG_DWORD /d "0" /f & Reg.exe add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "DeferFeatureUpdatesPeriodInDays" /t REG_DWORD /d "869" /f & Reg.exe add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "DeferQualityUpdatesPeriodInDays" /t REG_DWORD /d "4" /f & Reg.exe add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "BranchReadinessLevel" /t REG_DWORD /d "32" /f
if '%choice%'=='12' Reg.exe delete "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "AllowAutoWindowsUpdateDownloadOverMeteredNetwork" /f & Reg.exe delete "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "DeferFeatureUpdatesPeriodInDays" /f & Reg.exe delete "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "DeferQualityUpdatesPeriodInDays" /f & Reg.exe delete "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "BranchReadinessLevel" /f
if '%choice%'=='0' goto start
ECHO "%choice%" is not valid, try again
ECHO.
goto start
:rightclick
cls
echo ---------------------------------------------------------------------------------------------------------------------
echo 1. Right click Take Ownership Menu
echo 2. Right Click Open Command Window here
echo 0. Main
set choice=
set /p choice=Type the number.
if not '%choice%'=='' set choice=%choice:~0,100%
if '%choice%'=='1' goto 13
if '%choice%'=='2' goto 14
if '%choice%'=='0' goto start
ECHO "%choice%" is not valid, try again
ECHO.
goto rightclick
:steavensetup
echo off
cls
echo adding new powerplane
powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61
echo.
echo making windows Faster
Reg.exe add "HKCU\Control Panel\Desktop" /v "MenuShowDelay" /t REG_SZ /d "0" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "WaitToKillAppTimeout" /t REG_SZ /d "5000" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "HungAppTimeout" /t REG_SZ /d "4000" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "AutoEndTasks" /t REG_SZ /d "1" /f
powercfg -h off
cls
echo making windows Faster
echo Games Tweaks
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD /d "8" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Priority" /t REG_DWORD /d "6" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "SFIO Priority" /t REG_SZ /d "High" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Scheduling Category" /t REG_SZ /d "High" /f
cls
echo making windows Faster
echo Games Tweaks
echo internet Tweaks
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d "0" /f
cls
echo making windows Faster
echo Games Tweaks
echo internet Tweaks
echo reinstalling Windows Photo Viewer
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /v ".tif" /t REG_SZ /d "PhotoViewer.FileAssoc.Tiff" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /v ".tiff" /t REG_SZ /d "PhotoViewer.FileAssoc.Tiff" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /v ".bmp" /t REG_SZ /d "PhotoViewer.FileAssoc.Tiff" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /v ".dib" /t REG_SZ /d "PhotoViewer.FileAssoc.Tiff" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /v ".gif" /t REG_SZ /d "PhotoViewer.FileAssoc.Tiff" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /v ".jfif" /t REG_SZ /d "PhotoViewer.FileAssoc.Tiff" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /v ".jpe" /t REG_SZ /d "PhotoViewer.FileAssoc.Tiff" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /v ".jpeg" /t REG_SZ /d "PhotoViewer.FileAssoc.Tiff" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /v ".jpg" /t REG_SZ /d "PhotoViewer.FileAssoc.Tiff" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /v ".jxr" /t REG_SZ /d "PhotoViewer.FileAssoc.Tiff" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /v ".png" /t REG_SZ /d "PhotoViewer.FileAssoc.Tiff" /f
cls
echo making windows Faster
echo Games Tweaks
echo internet Tweaks
echo reinstalling Windows Photo Viewer
echo Done
pause
goto :start