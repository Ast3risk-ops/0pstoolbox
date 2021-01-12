@ECHO off
cls
call :IsAdmin
:start
title SteavenToolBox 1.3.1
cls
ECHO.
echo =====================================================================
echo "SteavenToolBox 1.3.1 | Current Working Windows 10 Version 2009 20h2"
echo =====================================================================
echo ---------------------------------------------------------------------------------------------------------------------
ECHO "TWEAK | FIXED | CLEANER | OTHER"                         Installer
echo --------------------------------                          7. Install choco and wget SO YOU CAN GET ANY APP NEEEED
color 2                                   
ECHO 1. Print Spooler                                          8. Firefox Mozilla (browser)
echo 2. Clear Event Viewer Logs                                9. Google Chrome (browser)
echo 3. "Clear Cache Updates | Delivery Optimization"          10. 7-Zip
echo 4. "Hibernation | Fastboot | Sleepmode | Sysmain"         11. Users Request
echo 5. Stops Windows Updates Forever                          14. Reinstall Windows 10 preinstalled apps
echo 6.Actviate Windows 10                                     20. Uninstall onedrive
echo 12. Trimors Stuff                                         21. Disable/Enable Firewall
echo 13. Disable Windows Defender
echo 15. Right click Take Ownership Menu
echo 16. Disable Services
echo 17. Right Click Open Command Window here
echo 18. Steaven Speed up
echo 19. Disable Action Center
echo ---------------------------------------------------------------------------------------------------------------------
set choice=
set /p choice=Type the number.
if not '%choice%'=='' set choice=%choice:~0,100%
if '%choice%'=='1' goto 1
if '%choice%'=='2' goto 2
if '%choice%'=='3' goto 3
if '%choice%'=='4' goto 4
if '%choice%'=='5' goto 5
if '%choice%'=='6' goto 6
if '%choice%'=='7' goto 7
if '%choice%'=='8' choco install firefox -y
if '%choice%'=='9' choco install googlechrome -y
if '%choice%'=='10' choco install 7zip -y
if '%choice%'=='11' goto 11
if '%choice%'=='12' goto 12
if '%choice%'=='13' goto 13
if '%choice%'=='14' goto Choice
if '%choice%'=='15' goto 15
if '%choice%'=='16' goto 16
if '%choice%'=='17' goto 17
if '%choice%'=='18' goto 18
if '%choice%'=='19' powershell.exe "Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/omartube706/SteavenToolBox/main/DisableActionCenter.ps1'))"
if '%choice%'=='20' powershell.exe "iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/omartube706/SteavenToolBox/main/onedrive.ps1'))"
if '%choice%'=='21' goto 21
ECHO "%choice%" is not valid, try again
ECHO.
goto start
:1
title SteavenToolBox 1.3.1 Print Spooler
cls
echo Print Spooler for Printer (services)
echo 1. Enable
echo 2. Disable
echo ---------------------------------------------------------------------------------------------------------------------
echo 0. Back to menu
set choice=
set /p choice=Type the number.
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto enableprint
if '%choice%'=='2' goto disableprint
if '%choice%'=='0' goto start
:enableprint
cls
SC CONFIG Spooler start= auto
SC START Spooler
goto start
:disableprint
cls
SC STOP Spooler
SC CONFIG Spooler start= disabled
goto start
:2
cls
title SteavenToolBox 1.3.1 Clear Event Logs
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
title SteavenToolBox 1.3.1 Clear Cache
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
title SteavenToolBox 1.3.1 Hibernation "| Fastboot | Sleepmode | Sysmain"
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
if '%choice%'=='1' goto disablehiberfil.sys
if '%choice%'=='2' goto enablehiberfil.sys
if '%choice%'=='3' goto disablesysmain
if '%choice%'=='4' goto enablesysmain
if '%choice%'=='0' goto start
goto start
:disablehiberfil.sys
cls
powercfg.exe -h off
goto 4
:enablehiberfil.sys
cls
powercfg.exe -h on
goto 4
:disablesysmain
cls
SC STOP SysMain
SC CONFIG SysMain start= disabled
goto 4
:enablesysmain
cls
SC CONFIG SysMain start= auto
SC start SysMain
goto 4
:5
cls
echo Stop windows update forever
echo 1. Stop
echo 2. Enable
echo ---------------------------------------------------------------------------------------------------------------------
echo 0. Back to menu
set choice=
set /p choice=Type the number.
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto disablewindowsupdate
if '%choice%'=='2' goto enablewindowsupdate
if '%choice%'=='0' goto start
goto start
:disablewindowsupdate
cls
SC STOP wuauserv
SC CONFIG wuauserv start= disabled
goto start
:enablewindowsupdate
cls
SC CONFIG wuauserv start= auto
SC START wuauserv
goto start
:6
cls
slmgr /ipk NW6C2-QMPVW-D7KKK-3GKT6-VCFB2
slmgr /skms kms8.msguides.com
slmgr /ato
goto start
:11
cls
title SteavenToolBox 1.3.1 Users Request Apps
echo Users Request
echo 1. Avast                    11. Adobe Acrobat Reader DC
echo 2. AnyDesk                  12. Java SE Runtime Environment 8
echo 3. Audacity                 13. Notepad++
echo 4. Blender                  14. VLC
echo 5. "C++ RunTime"            15. Pyhton
echo 6. MS Office
echo 7. netframwork 3
echo 8. winrar
echo 9. DirectX
echo 10. VMware 16.0
echo to Request More say for me at discord OmarHanyKasban#7096
echo ---------------------------------------------------------------------------------------------------------------------
echo 0. Back to menu
set choice=
set /p choice=Type the number.
if not '%choice%'=='' set choice=%choice:~0,100%
if '%choice%'=='1' choco install avastfreeantivirus -y
if '%choice%'=='2' choco install anydesk -y
if '%choice%'=='3' choco install audacity -y
if '%choice%'=='4' choco install blender -y
if '%choice%'=='5' goto RunTime
if '%choice%'=='6' goto msoffice
if '%choice%'=='7' DISM /Online /Enable-Feature /FeatureName:NetFx3 /All 
if '%choice%'=='8' choco install winrar -y
if '%choice%'=='9' goto directx
if '%choice%'=='10' goto vmware
if '%choice%'=='11' choco install adobereader -y
if '%choice%'=='12' choco install jre8 -y
if '%choice%'=='13' choco install notepadplusplus.install -y
if '%choice%'=='14' choco install vlc -y
if '%choice%'=='15' choco install python3 -y
if '%choice%'=='0' goto start
ECHO.
goto 11
goto start
:12
cls
color 3
Echo 1. Windows 10 Optimization
echo 2. Internet Optimization
echo 3. Roblox FPS Boost
echo ---------------------------------------------------------------------------------------------------------------------
echo 0. Back to menu
set choice=
set /p choice=Type the number.
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto WindowsOptimization
if '%choice%'=='2' goto InternetOptimization
if '%choice%'=='3' goto robloxfpsboost
if '%choice%'=='4' choco install blender -y
if '%choice%'=='0' goto start
goto start
:robloxfpsboost
cls
Reg.exe add "HKCU\System\GameConfigStore" /v "GameDVR_Enabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\PolicyManager\default\ApplicationManagement\AllowGameDVR" /v "value" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\System\GameConfigStore" /v "GameDVR_FSEBehaviorMode" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\System\GameConfigStore" /v "GameDVR_HonorUserFSEBehaviorMode" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\System\GameConfigStore" /v "GameDVR_FSEBehavior" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\System\GameConfigStore" /v "GameDVR_DXGIHonorFSEWindowsCompatible" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD /d "8" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Priority" /t REG_DWORD /d "6" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Scheduling Category" /t REG_SZ /d "High" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "SFIO Priority" /t REG_SZ /d "High" /f
goto 12
:13
cls
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableSmartScreen" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableBehaviorMonitoring" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableOnAccessProtection" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableScanOnRealtimeEnable" /t REG_DWORD /d "1" /f
goto start
:InternetOptimization
cls
ping google.com
ipconfig /flushdns
netsh winsock reset
netsh int tcp set global autotuninglevel=disabled
netsh int ip reset c:\resetlog.txt
netsh advfirewall firewall add rule name="StopThrottling" dir=in action=block remoteip=173.194.55.0/24,206.111.0.0/16 enable=yes
netsh int tcp set global chimney=enabled
netsh int tcp set heuristics disabled
netsh int tcp set global autotuninglevel=normal
netsh int tcp set global congestionprovider=ctcp
netsh int tcp show global
netsh int tcp set global chimney=enabled
netsh int tcp set heuristics disabled
netsh int tcp set global autotuninglevel=normal
netsh int tcp set global congestionprovider=ctcp
netsh advfirewall firewall add rule name="YouTubeTweak" dir=in action=block remoteip=173.194.55.0/24,206.111.0.0/16 enable=yes
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\services\LanmanServer\Parameters" /v "autodisconnect" /t REG_DWORD /d "4294967295" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\services\LanmanServer\Parameters" /v "Size" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\services\LanmanServer\Parameters" /v "EnableOplocks" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\services\LanmanServer\Parameters" /v "IRPStackSize" /t REG_DWORD /d "32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\services\LanmanServer\Parameters" /v "SharingViolationDelay" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\services\LanmanServer\Parameters" /v "SharingViolationRetries" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d "4294967295" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d "0" /f
regsvr32 actxprxy.dll
goto 12
:WindowsOptimization
cls
Reg.exe add "HKCU\System\GameConfigStore" /v "GameDVR_FSEBehaviorMode" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\System\GameConfigStore" /v "GameDVR_HonorUserFSEBehaviorMode" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\System\GameConfigStore" /v "GameDVR_FSEBehavior" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\System\GameConfigStore" /v "GameDVR_DXGIHonorFSEWindowsCompatible" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "AutoEndTasks" /t REG_SZ /d "1" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "HungAppTimeout" /t REG_SZ /d "1000" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "MenuShowDelay" /t REG_SZ /d "8" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "WaitToKillAppTimeout" /t REG_SZ /d "2000" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "LowLevelHooksTimeout" /t REG_SZ /d "1000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "ClearPageFileAtShutdown" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoLowDiskSpaceChecks" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "LinkResolveIgnoreLinkInfo" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoResolveSearch" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoResolveTrack" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoInternetOpenWith" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Affinity" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Background Only" /t REG_SZ /d "False" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Clock Rate" /t REG_DWORD /d "10000" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD /d "8" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Priority" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Scheduling Category" /t REG_SZ /d "High" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "SFIO Priority" /t REG_SZ /d "High" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d "4294967295" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v "PowerThrottlingOff" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "38" /f
bcdedit /deletevalue useplatformclock
bcdedit /set disabledynamictick yes
bcdedit /set useplatformtick yes
powercfg -h off
goto 12
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

:15
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
:16
cls
title SteavenToolBox 1.3.1 Disable Services
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
:RunTime
cls
choco install msvisualcplusplus2012-redist -y
choco install msvisualcplusplus2013-redist -y
choco install vcredist2012 -y
choco install vcredist2010 -y
choco install vcredist2013 -y
choco install vcredist2008 -y
choco install vcredist2005 -y
choco install vcredist2017 -y
choco install vcredist140 -y
choco install vcredist-all -y
goto 11
:17
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
:18
cls
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "ClearPageFileAtShutdown" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\943c8cb6-6f93-4227-ad87-e9a3feec08d1" /v "Attributes" /t REG_SZ /d "2" /f
Reg.exe add "HKCR\AllFilesystemObjects\shellex\ContextMenuHandlers\Copy To" /ve /t REG_SZ /d "{C2FBB630-2971-11D1-A18C-00C04FD75D13}" /f
Reg.exe add "HKCR\AllFilesystemObjects\shellex\ContextMenuHandlers\Move To" /ve /t REG_SZ /d "{C2FBB631-2971-11D1-A18C-00C04FD75D13}" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "AutoEndTasks" /t REG_SZ /d "1" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "HungAppTimeout" /t REG_SZ /d "1000" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "MenuShowDelay" /t REG_SZ /d "8" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "WaitToKillAppTimeout" /t REG_SZ /d "2000" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "LowLevelHooksTimeout" /t REG_SZ /d "1000" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "WaitToKillServiceTimeout" /t REG_DWORD /d "8192" /f
Reg.exe add "HKCU\Control Panel\Mouse" /v "MouseHoverTime" /t REG_SZ /d "8" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoLowDiskSpaceChecks" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "LinkResolveIgnoreLinkInfo" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoResolveSearch" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoResolveTrack" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoInternetOpenWith" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control" /v "WaitToKillServiceTimeout" /t REG_SZ /d "2000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "HibernateEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD /d "8" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Priority" /t REG_DWORD /d "6" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Scheduling Category" /t REG_SZ /d "High" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "SFIO Priority" /t REG_SZ /d "High" /f
Reg.exe add "HKCU\System\GameConfigStore" /v "GameDVR_Enabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\PolicyManager\default\ApplicationManagement\AllowGameDVR" /v "value" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "AppCaptureEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d "4294967295" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\System\GameConfigStore" /v "GameDVR_FSEBehaviorMode" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\System\GameConfigStore" /v "GameDVR_HonorUserFSEBehaviorMode" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\System\GameConfigStore" /v "GameDVR_FSEBehavior" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\System\GameConfigStore" /v "GameDVR_DXGIHonorFSEWindowsCompatible" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\System\GameConfigStore" /v "Win32_AutoGameModeDefaultProfile" /t REG_BINARY /d "01000100000000000000000000000000000000000000000000000000000000000000000000000000" /f
Reg.exe add "HKCU\System\GameConfigStore" /v "Win32_GameModeRelatedProcesses" /t REG_BINARY /d "010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" /f
Reg.exe add "HKCU\System\GameConfigStore" /v "GameDVR_EFSEFeatureFlags" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "AITEnable" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoInstrumentation" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoInstrumentation" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\HandwritingErrorReports" /v "PreventHandwritingErrorReports" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching" /v "SearchOrderConfig" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "HiberbootEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v "PowerThrottlingOff" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "HibernateEnabledDefault" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\d4e98f31-5ffe-4ce1-be31-1b38b384c009\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "ACSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\d4e98f31-5ffe-4ce1-be31-1b38b384c009\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DCSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\d4e98f31-5ffe-4ce1-be31-1b38b384c009\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "ACSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\3b04d4fd-1cc7-4f23-ab1c-d1337819c4bb\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "ACSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\3b04d4fd-1cc7-4f23-ab1c-d1337819c4bb\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e" /v "DCSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\3b04d4fd-1cc7-4f23-ab1c-d1337819c4bb\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /v "ACSettingIndex" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\services\LanmanServer\Parameters" /v "autodisconnect" /t REG_DWORD /d "4294967295" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\services\LanmanServer\Parameters" /v "Size" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\services\LanmanServer\Parameters" /v "EnableOplocks" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\services\LanmanServer\Parameters" /v "IRPStackSize" /t REG_DWORD /d "32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\services\LanmanServer\Parameters" /v "SharingViolationDelay" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\services\LanmanServer\Parameters" /v "SharingViolationRetries" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d "4294967295" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d "0" /f
Reg.exe add "HKCR\AllFilesystemObjects\shellex\ContextMenuHandlers\Copy To" /ve /t REG_SZ /d "{C2FBB630-2971-11D1-A18C-00C04FD75D13}" /f
Reg.exe add "HKCR\AllFilesystemObjects\shellex\ContextMenuHandlers\Move To" /ve /t REG_SZ /d "{C2FBB631-2971-11D1-A18C-00C04FD75D13}" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "AutoEndTasks" /t REG_SZ /d "1" /f
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
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control" /v "WaitToKillServiceTimeout" /t REG_SZ /d "2000" /f
Reg.exe add "HKCU\System\GameConfigStore" /v "GameDVR_Enabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\PolicyManager\default\ApplicationManagement\AllowGameDVR" /v "value" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\System\GameConfigStore" /v "GameDVR_FSEBehaviorMode" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\System\GameConfigStore" /v "GameDVR_HonorUserFSEBehaviorMode" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\System\GameConfigStore" /v "GameDVR_FSEBehavior" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\System\GameConfigStore" /v "GameDVR_DXGIHonorFSEWindowsCompatible" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD /d "8" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Priority" /t REG_DWORD /d "6" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Scheduling Category" /t REG_SZ /d "High" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "SFIO Priority" /t REG_SZ /d "High" /f
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
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Affinity" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Background Only" /t REG_SZ /d "False" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Clock Rate" /t REG_DWORD /d "10000" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD /d "8" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Priority" /t REG_DWORD /d "6" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Scheduling Category" /t REG_SZ /d "High" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "SFIO Priority" /t REG_SZ /d "High" /f
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
c:\windows\wget\wget.exe -P %USERPROFILE%\Desktop https://dl.malwat.ch/software/useful/office/MSOffice1619.zip
echo Password: mysubsarethebest
pause
goto 11
:7
cls
powershell.exe "Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))"
md c:\windows\wget
powershell.exe "Invoke-WebRequest https://raw.githubusercontent.com/omartube706/SteavenToolBox/main/wget.exe -OutFile c:\windows\wget\wget.exe"
goto start
:21
cls
echo Enable/Disable Firewall
echo 1. Enable
echo 2. Disable
echo ---------------------------------------------------------------------------------------------------------------------
echo 0. Back to menu
set choice=
set /p choice=Type the number.
if not '%choice%'=='' set choice=%choice:~0,100%
if '%choice%'=='1' NetSh Advfirewall set allprofiles state on
if '%choice%'=='2' NetSh Advfirewall set allprofiles state off
if '%choice%'=='0' goto start
goto 21
:directx
cls
choco install directx -y
:vmware
cls
c:\windows\wget\wget.exe -P %USERPROFILE%\Desktop https://dl.malwat.ch/software/useful/vmware/VMwareWorkstation16.zip
echo Password: mysubsarethebest
pause
goto 11
c:\windows\wget\wget.exe -P %USERPROFILE%\Desktop https://github.com/omartube706/SteavenToolBox/raw/main/dxwebsetup.exe
@pause
goto 11