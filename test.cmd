:: Reinstall and Re-register All Built-in Windows Apps in Windows 10


@Echo Off & Color 0E


(Net session >nul 2>&1)||(PowerShell start """%~0""" -verb RunAs & Exit /B)



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