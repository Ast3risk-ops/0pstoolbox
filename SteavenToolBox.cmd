@ECHO off
cls
call :IsAdmin
echo off
powershell.exe "iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/SteavenGamerYT/SteavenToolBox/main/Scripts/runtime.ps1'))"
powershell.exe "iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/SteavenGamerYT/SteavenToolBox/main/Scripts/runtime2.ps1'))"
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "VerboseStatus" /t REG_DWORD /d "1" /f
:start
title SteavenToolbox 2.0
cls
color b
echo ==========================================================================
echo "SteavenToolbox 2.0 | We care about your pc!" "Windows 10 and Windows 11!"
echo ==========================================================================
echo ---------------------------------------------------------------------------------------------------------------------                                    
echo 1. Optmize windows (not finshed but it dose some)
echo 2. Update All Installed Apps To Thair Lastest Versions
echo 3. Install Features, Programs and Apps
echo 4. Windows Update Fix 
echo 5. Crack Windows and Office
echo 6. Uninstall Edge
echo ---------------------------------------------------------------------------------------------------------------------
set choice=
set /p choice=Type the number.
if not '%choice%'=='' set choice=%choice:~0,100%
if '%choice%'=='1' goto optmizewindows
if '%choice%'=='2' goto update
if '%choice%'=='3' goto installapps
if '%choice%'=='4' goto updatefix
if '%choice%'=='5' goto crack
if '%choice%'=='6' powershell -command "Invoke-WebRequest https://github.com/SteavenGamerYT/SteavenToolBox/raw/main/Scripts/edge-uninstaller.cmd -OutFile C:\windows\temp\edge-uninstaller.cmd" && powershell.exe -command "C:\windows\temp\edge-uninstaller.cmd"
ECHO "%choice%" is not valid, try again
ECHO.
goto start
:update
cls
echo Updateing All Apps
echo ToolBox May Close 
echo Dont forget to run it again
pause
winget upgrade --all
choco upgrade all
scoop update
goto start
:optmizewindows
cls
color b
echo ---------------------------------------------------------------------------------------------------------------------
echo Optmize Windows
echo 1. Desktop
echo 2. Laptop
echo 3. Chris Titus Tech Optmize Windows (Recommaded)
echo 0. Go back
echo ---------------------------------------------------------------------------------------------------------------------
set choice=
set /p choice=Type the number.
if not '%choice%'=='' set choice=%choice:~0,100%
if '%choice%'=='1' goto optmizedesktop && goto optmize
if '%choice%'=='2' goto optmizelaptop && goto optmize
if '%choice%'=='3' powershell -command "irm christitus.com/win | iex"
if '%choice%'=='0' goto start
ECHO "%choice%" is not valid, try again
ECHO.
goto optmizewindows
:optmizedesktop
cls
echo  Disabling Power Thrttling
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v "PowerThrottlingOff" /t REG_DWORD /d "0" /f> nul
echo Disabling automatic Maps updates...
Reg.exe add "HKLM\SYSTEM\Maps" /v "AutoUpdateEnabled" /t REG_DWORD /d "0" /f> nul
echo Uninstalling Maps app
powershell -command "Get-AppxPackage *WindowsMaps* | Remove-AppxPackage"> nul
:optmizelaptop
cls
echo Enabling automatic Maps updates...
Reg.exe add "HKLM\SYSTEM\Maps" /v "AutoUpdateEnabled" /t REG_DWORD /d "1" /f> nul
echo Installing Maps app
winget install --id 9WZDNCRDTBVB> nul
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "EnableAutoTray" /t REG_DWORD /d "1" /f> nul
echo Enabling NumLock after startup...
echo  Enabling Power Thrttling
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v "PowerThrottlingOff" /t REG_DWORD /d "1" /f> nul
:optmize
cls
echo Disabling Telemetry...
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f> nul
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "DoNotShowFeedbackNotifications" /t REG_DWORD /d "0" /f> nul
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f> nul
schtasks /Change /TN "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /Disable> nul
schtasks /Change /TN "Microsoft\Windows\Application Experience\ProgramDataUpdater" /Disable> nul
schtasks /Change /TN "Microsoft\Windows\Autochk\Proxy" /Disable> nul
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /Disable> nul
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /Disable> nul
schtasks /Change /TN "Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /Disable> nul
echo Disabling Wi-Fi Sense...
Reg.exe add "HKLM\SOFTWARE\Microsoft\PolicyManager\default\Wifi\AllowAutoConnectToWiFiSenseHotspots" /v "value" /t REG_DWORD /d "0" /f> nul
Reg.exe add "HKLM\SOFTWARE\Microsoft\PolicyManager\default\Wifi\AllowWiFiHotSpotReporting" /v "Value" /t REG_DWORD /d "0" /f> nul
echo Disabling Application suggestions...
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "ContentDeliveryAllowed" /t REG_DWORD /d "0" /f> nul
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "OemPreInstalledAppsEnabled" /t REG_DWORD /d "0" /f> nul
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledAppsEnabled" /t REG_DWORD /d "0" /f> nul
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledAppsEverEnabled" /t REG_DWORD /d "0" /f> nul
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SilentInstalledAppsEnabled" /t REG_DWORD /d "0" /f> nul
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338387Enabled" /t REG_DWORD /d "0" /f> nul
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338388Enabled" /t REG_DWORD /d "0" /f> nul
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338389Enabled" /t REG_DWORD /d "0" /f> nul
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353698Enabled" /t REG_DWORD /d "0" /f> nul
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338393Enabled" /t REG_DWORD /d "0" /f> nul
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353694Enabled" /t REG_DWORD /d "0" /f> nul
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353696Enabled" /t REG_DWORD /d "0" /f> nul
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SystemPaneSuggestionsEnabled" /t REG_DWORD /d "0" /f> nul
Reg.exe add "HKLM\SOFTWARE\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableWindowsConsumerFeatures" /t REG_DWORD /d "1" /f> nul
echo Disabling Activity History...
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableActivityFeed" /t REG_DWORD /d "0" /f> nul
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "PublishUserActivities" /t REG_DWORD /d "0" /f> nul
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "UploadUserActivities" /t REG_DWORD /d "0" /f> nul
echo Disabling Location Tracking...
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" /v "Value" /t REG_SZ /d "Deny" /f> nul
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Sensor\Overrides\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}" /v "SensorPermissionState" /t REG_DWORD /d "0" /f> nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\lfsvc\Service\Configuration" /v "Status" /t REG_DWORD /d "0" /f> nul
echo Disabling Feedback...
Reg.exe add "HKCU\SOFTWARE\Microsoft\Siuf\Rules" /v "NumberOfSIUFInPeriod" /t REG_DWORD /d "0" /f> nul
schtasks /Change /TN "Microsoft\Windows\Feedback\Siuf\DmClient" /Disable> nul
schtasks /Change /TN "Microsoft\Windows\Feedback\Siuf\DmClientOnScenarioDownload" /Disable> nul
echo Uninstalling Feedback Hub
powershell -command "Get-AppxPackage *WindowsFeedbackHub* | Remove-AppxPackage"> nul
echo Disabling Advertising ID...
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" /v "DisabledByGroupPolicy" /t REG_DWORD /d "1" /f> nul
echo Disabling Error reporting...
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d "1" /f> nul
echo Restricting Windows Update P2P only to local network...
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" /v "DODownloadMode" /t REG_DWORD /d "1" /f> nul
echo Stopping and disabling Diagnostics Tracking Service...
sc stop DiagTrack> nul
sc config "DiagTrack" start=disabled> nul
echo Stopping and disabling WAP Push Service...
sc stop dmwappushservice> nul
sc config "dmwappushservice" start=disabled> nul
echo Enabling F8 boot menu options...
bcdedit /set {current} bootmenupolicy Legacy> nul
echo Stopping and disabling Home Groups services...
sc stop HomeGroupListener> nul
sc config "HomeGroupListener" start=disabled> nul
sc stop HomeGroupProvider> nul
sc config "HomeGroupProvider" start=disabled> nul
echo Disabling Remote Assistance...
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Remote Assistance" /v "fAllowToGetHelp" /t REG_DWORD /d "0" /f> nul
echo Disabling Storage Sense...
powershell -command "Remove-Item -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy" -Recurse -ErrorAction SilentlyContinue" > nul
echo Stopping and disabling Superfetch service...
sc stop SysMain> nul
sc config "SysMain" start=disabled> nul
echo Disabling Hibernation...
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "HibernteEnabled" /t REG_DWORD /d "0" /f> nul
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FlyoutMenuSettings" /v "ShowHibernateOption" /t REG_DWORD /d "0" /f
echo Showing task manager details...
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\TaskManager" /v "Preferences" /t REG_BINARY /d "0d00000060000000600000008200000082000000fd010000f6010000000000000000008000000080d8010080df01008000010001c9020000d10000007105000029030000e80300000000000000000000000000000f000000010000000000000068aa9ed8f67f0000000000000000000000000000ea0000001e0000008990000000000000ff00000001015002000000000d00000000000000a8aa9ed8f67f00000000000000000000ffffffff960000001e0000008b900000010000000000000000101001000000000300000000000000c0aa9ed8f67f00000000000000000000ffffffff780000001e0000008c900000020000000000000001021200000000000400000000000000d8aa9ed8f67f00000000000000000000ffffffff960000001e0000008d900000030000000000000000011001000000000200000000000000f8aa9ed8f67f00000000000000000000ffffffff320000001e0000008a90000004000000000000000008200100000000050000000000000010ab9ed8f67f00000000000000000000ffffffffc80000001e0000008e90000005000000000000000001100100000000060000000000000038ab9ed8f67f00000000000000000000ffffffff040100001e0000008f90000006000000000000000001100100000000070000000000000060ab9ed8f67f00000000000000000000ffffffff49000000490000009090000007000000010000000004250000000000080000000000000090aa9ed8f67f00000000000000000000ffffffff49000000490000009190000008000000000000000004250000000000090000000000000080ab9ed8f67f00000000000000000000ffffffff490000004900000092900000090000000000000000042508000000000a0000000000000098ab9ed8f67f00000000000000000000ffffffff4900000049000000939000000a0000000000000000042508000000000b00000000000000b8ab9ed8f67f00000000000000000000ffffffff490000004900000039a000000b0000000000000000042508000000001c00000000000000d8ab9ed8f67f00000000000000000000ffffffffc8000000490000003aa000000c0000000000000000011008000000001d0000000000000000ac9ed8f67f00000000000000000000ffffffff64000000490000004ca000000d0000000000000000021508000000001e0000000000000020ac9ed8f67f00000000000000000000ffffffff64000000490000004da000000e000000000000000002150800000000030000000a000000010000000000000068aa9ed8f67f0000000000000000000000000000d70000001e0000008990000000000000ff00000001015000000000000400000000000000d8aa9ed8f67f0000000000000000000001000000960000001e0000008d900000010000000000000001011000000000000300000000000000c0aa9ed8f67f00000000000000000000ffffffff640000001e0000008c900000020000000100000000021002000000000c0000000000000050ac9ed8f67f0000000000000000000003000000640000001e00000094900000030000000000000001021000000000000d0000000000000078ac9ed8f67f00000000000000000000ffffffff640000001e00000095900000040000000000000000011001000000000e00000000000000a0ac9ed8f67f0000000000000000000005000000320000001e00000096900000050000000000000001042001000000000f00000000000000c8ac9ed8f67f0000000000000000000006000000320000001e00000097900000060000000000000001042001000000001000000000000000e8ac9ed8f67f0000000000000000000007000000460000001e0000009890000007000000000000000101100100000000110000000000000008ad9ed8f67f00000000000000000000ffffffff640000001e0000009990000008000000000000000001100100000000060000000000000038ab9ed8f67f0000000000000000000009000000040100001e0000008f9000000900000000000000010110010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000040000000b000000010000000000000068aa9ed8f67f0000000000000000000000000000d7000000000000009e90000000000000ff0000000101500200000000120000000000000030ad9ed8f67f00000000000000000000ffffffff2d000000000000009b90000001000000000000000004200100000000140000000000000050ad9ed8f67f00000000000000000000ffffffff64000000000000009d90000002000000000000000001100100000000130000000000000078ad9ed8f67f00000000000000000000ffffffff64000000000000009c900000030000000000000000011001000000000300000000000000c0aa9ed8f67f00000000000000000000ffffffff64000000000000008c90000004000000000000000102100000000000070000000000000060ab9ed8f67f000000000000000000000500000049000000490000009090000005000000000000000104210000000000080000000000000090aa9ed8f67f000000000000000000000600000049000000490000009190000006000000000000000104210000000000090000000000000080ab9ed8f67f0000000000000000000007000000490000004900000092900000070000000000000001042108000000000a0000000000000098ab9ed8f67f0000000000000000000008000000490000004900000093900000080000000000000001042108000000000b00000000000000b8ab9ed8f67f0000000000000000000009000000490000004900000039a00000090000000000000001042108000000001c00000000000000d8ab9ed8f67f000000000000000000000a00000064000000000000003aa000000a00000000000000000110080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000200000008000000010000000000000068aa9ed8f67f0000000000000000000000000000c600000000000000b090000000000000ff0000000101500200000000150000000000000098ad9ed8f67f00000000000000000000ffffffff6b00000000000000b1900000010000000000000000042500000000001600000000000000c8ad9ed8f67f00000000000000000000ffffffff6b00000000000000b2900000020000000000000000042500000000001800000000000000f0ad9ed8f67f00000000000000000000ffffffff6b00000000000000b490000003000000000000000004250000000000170000000000000018ae9ed8f67f00000000000000000000ffffffff6b00000000000000b390000004000000000000000004250000000000190000000000000050ae9ed8f67f00000000000000000000ffffffffa000000000000000b5900000050000000000000000042001000000001a0000000000000080ae9ed8f67f00000000000000000000ffffffff7d00000000000000b6900000060000000000000000042001000000001b00000000000000b0ae9ed8f67f00000000000000000000ffffffff7d00000000000000b790000007000000000000000004200100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000da000000000000000000000000000000000000009d200000220000003e010000640000003200000081000000eb00000032000000320000002d000000500000003c000000500000005000000032000000a90000005000000050000000500000005000000050000000500000002800000050000000230000002300000023000000230000005000000050000000500000003200000032000000320000007800000053020000500000003c00000050000000d0000000780000003200000078000000780000003200000050000000500000005000000050000000c8000000000000000100000002000000030000000400000005000000060000000700000008000000090000000a0000000b0000000c0000000d0000000e0000000f000000100000001100000012000000130000001400000015000000160000001700000018000000190000001a0000001b0000001c0000001d0000001e0000001f000000200000002100000022000000230000002400000025000000260000002700000028000000290000002a0000002b0000002c0000002d0000002e0000002f00000000000000000000001f00000000000000640000003200000078000000500000005000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000002000000030000000400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" /f> nul
echo Showing file operations details...
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\OperationStatusManager" /v "EnthusiastMode" /t REG_DWORD /d "1" /f> nul
echo Hiding Cortana Button...
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowCortanaButton" /t REG_DWORD /d "0" /f> nul
echo Hiding Task View button...
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowTaskViewButton" /t REG_DWORD /d "0" /f> nul
echo Hiding People icon...
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" /v "PeopleBand" /t REG_DWORD /d "0" /f> nul
echo Hide tray icons...
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "EnableAutoTray" /t REG_DWORD /d "1" /f> nul
echo Enabling NumLock after startup...
Reg.exe add "HKU\.DEFAULT\Control Panel\Keyboard" /v "InitialKeyboardIndicators" /t REG_DWORD /d "558319670" /f> nul
echo Changing default Explorer view to This PC...
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "LaunchTo" /t REG_DWORD /d "1" /f> nul
echo Using regedit to improve RAM 
echo Disabling Game Bar (Game Dvr)
Reg.exe add "HKLM\SYSTEM\GameConfigStore" /v "GameDVR_DXGIHonorFSEWindowsCompatible" /t REG_DWORD /d "0" /f> nul
Reg.exe add "HKLM\SYSTEM\GameConfigStore" /v "GameDVR_HonorUserFSEBehaviorMode" /t REG_DWORD /d "0" /f> nul
Reg.exe add "HKLM\SYSTEM\GameConfigStore" /v "GameDVR_EFSEFeatureFlags" /t REG_DWORD /d "0" /f> nul
Reg.exe add "HKLM\SYSTEM\GameConfigStore" /v "GameDVR_Enabled" /t REG_DWORD /d "0" /f> nul
echo Disabling Driver Searching
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching" /v "SearchOrderConfig" /t REG_DWORD /d "0" /f> nul
echo Making System Responsiveness Better using regedit
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d "10" /f> nul
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d "20" /f> nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control" /v "WaitToKillServiceTimeout" /t REG_DWORD /d "2000" /f> nul
Reg.exe add "HKCU\Control Panel\Desktop" /v "AutoEndTasks" /t REG_SZ /d "1" /f> nul
Reg.exe add "HKCU\Control Panel\Desktop" /v "HungAppTimeout" /t REG_SZ /d "1000" /f> nul
Reg.exe add "HKCU\Control Panel\Desktop" /v "MenuShowDelay" /t REG_SZ /d "8" /f> nul
Reg.exe add "HKCU\Control Panel\Desktop" /v "WaitToKillAppTimeout" /t REG_SZ /d "2000" /f> nul
Reg.exe add "HKCU\Control Panel\Desktop" /v "LowLevelHooksTimeout" /t REG_SZ /d "1000" /f> nul
Reg.exe add "HKCU\Control Panel\Mouse" /v "MouseHoverTime" /t REG_SZ /d "8" /f> nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control" /v "WaitToKillServiceTimeout" /t REG_SZ /d "2000" /f> nul
pause
goto optmizewindows
:installapps
cls
color b
echo ---------------------------------------------------------------------------------------------------------------------
echo 1. Browsers
echo 2. 7zip
echo 3. Winrar
echo 4. VLC
echo 5. Full Runtime
echo 6. Install Windows Subsystem for Linux
echo 0. Go back
echo ---------------------------------------------------------------------------------------------------------------------
set choice=
set /p choice=Type the number.
if not '%choice%'=='' set choice=%choice:~0,100%
if '%choice%'=='1' goto browsers
if '%choice%'=='2' winget install -e --id 7zip.7zip
if '%choice%'=='3' winget install -e --id RARLab.WinRAR
if '%choice%'=='4' winget install -e --id VideoLAN.VLC
if '%choice%'=='5' choco install vcredist2005 vcredist2008 vcredist2010  vcredist2012 msvisualcplusplus2012-redist vcredist2013 vcredist2017 vcredist140 vcredist-all adoptopenjdk8openj9jre adoptopenjdk11openj9jre directx -y & DISM /Online /Enable-Feature /FeatureName:NetFx3 & DISM /Online /Enable-Feature /FeatureName:NetFx4 /All & dism /Online /enable-feature /FeatureName:"LegacyComponents" /All & dism /Online /enable-feature /FeatureName:"DirectPlay" /All
if '%choice%'=='6' wsl --install
if '%choice%'=='0' goto start
ECHO "%choice%" is not valid, try again
ECHO.
goto installapps
:browsers
cls
color b
echo ---------------------------------------------------------------------------------------------------------------------
echo 1. Firefox
echo 2. Chrome
echo 3. Brave
echo 4. Chromium
echo 5. Edge
echo 0. Go back
echo ---------------------------------------------------------------------------------------------------------------------
set choice=
set /p choice=Type the number.
if not '%choice%'=='' set choice=%choice:~0,100%
if '%choice%'=='1' winget install -e --id Mozilla.Firefox
if '%choice%'=='2' winget install -e --id Google.Chrome
if '%choice%'=='3' winget install -e --id BraveSoftware.BraveBrowser
if '%choice%'=='4' winget install -e --id eloston.ungoogled-chromium
if '%choice%'=='5' winget install -e --id Microsoft.Edge
if '%choice%'=='0' goto installapps
ECHO "%choice%" is not valid, try again
ECHO.
goto installapps
:updatefix
cls
color 9
echo ---------------------------------------------------------------------------------------------------------------------
echo 0. Go Back
echo ---------------------------------------------------------------------------------------------------------------------
echo 1. Get Windows 11 on unsupported devices!
echo ---------------------------------------------------------------------------------------------------------------------
echo Chose your build that you are in right now
echo That will make you never upgrade to newer build that mean stable pc stable performace!
echo 2. 22H2 (Works on Windows 11)
echo 3. 21h2 (Works on Windows 11)
echo 4. 21h1
echo 5. 20h2 (2009)
echo 6. 20h1 (2004)
echo 7. 19h2 (1909)
echo 8. 19h1 (1903)
echo 9. 1809
echo 10. 1607
echo 11. Undo
echo ---------------------------------------------------------------------------------------------------------------------
echo Chose If you want to not get non security and security updates or security updates only!
echo Note: this wont remove the frist setting
echo 12. Security Updates only
echo 13. Security and non
echo ---------------------------------------------------------------------------------------------------------------------
set choice=
set /p choice=Type the number.
if not '%choice%'=='' set choice=%choice:~0,100%
if '%choice%'=='1' del C:\Skip_TPM_Check_on_Dynamic_Update.cmd && wget -P c: https://github.com/AveYo/MediaCreationTool.bat/raw/main/bypass11/Skip_TPM_Check_on_Dynamic_Update.cmd  & start C:\Skip_TPM_Check_on_Dynamic_Update.cmd 
if '%choice%'=='2' reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate /f /v TargetReleaseVersion /t REG_DWORD /d 1 & reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate /f /v TargetReleaseVersionInfo /t REG_SZ /d 21h2
if '%choice%'=='3' reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate /f /v TargetReleaseVersion /t REG_DWORD /d 1 & reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate /f /v TargetReleaseVersionInfo /t REG_SZ /d 21h2
if '%choice%'=='4' reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate /f /v TargetReleaseVersion /t REG_DWORD /d 1 & reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate /f /v TargetReleaseVersionInfo /t REG_SZ /d 21h1
if '%choice%'=='5' reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate /f /v TargetReleaseVersion /t REG_DWORD /d 1 & reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate /f /v TargetReleaseVersionInfo /t REG_SZ /d 20h2
if '%choice%'=='6' reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate /f /v TargetReleaseVersion /t REG_DWORD /d 1 & reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate /f /v TargetReleaseVersionInfo /t REG_SZ /d 2004
if '%choice%'=='7' reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate /f /v TargetReleaseVersion /t REG_DWORD /d 1 & reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate /f /v TargetReleaseVersionInfo /t REG_SZ /d 1903
if '%choice%'=='8' reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate /f /v TargetReleaseVersion /t REG_DWORD /d 1 & reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate /f /v TargetReleaseVersionInfo /t REG_SZ /d 1903
if '%choice%'=='9' reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate /f /v TargetReleaseVersion /t REG_DWORD /d 1 & reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate /f /v TargetReleaseVersionInfo /t REG_SZ /d 1809
if '%choice%'=='10' reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate /f /v TargetReleaseVersion /t REG_DWORD /d 1 & reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate /f /v TargetReleaseVersionInfo /t REG_SZ /d 1607
if '%choice%'=='11' reg delete  HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate /v TargetReleaseVersion /f & reg delete HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate /v TargetReleaseVersionInfo /f
if '%choice%'=='12' Reg.exe add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "AllowAutoWindowsUpdateDownloadOverMeteredNetwork" /t REG_DWORD /d "0" /f & Reg.exe add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "DeferFeatureUpdatesPeriodInDays" /t REG_DWORD /d "869" /f & Reg.exe add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "DeferQualityUpdatesPeriodInDays" /t REG_DWORD /d "4" /f & Reg.exe add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "BranchReadinessLevel" /t REG_DWORD /d "32" /f
if '%choice%'=='13' Reg.exe delete "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "AllowAutoWindowsUpdateDownloadOverMeteredNetwork" /f & Reg.exe delete "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "DeferFeatureUpdatesPeriodInDays" /f & Reg.exe delete "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "DeferQualityUpdatesPeriodInDays" /f & Reg.exe delete "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "BranchReadinessLevel" /f
if '%choice%'=='0' goto start
ECHO "%choice%" is not valid, try again
ECHO.
goto updatefix
:crack
cls
echo 1. Crack Windows and Office
echo 0. Go Back
set choice=
set /p choice=Type the number.
if not '%choice%'=='' set choice=%choice:~0,100%
if '%choice%'=='1' powershell -command "irm https://massgrave.dev/get | iex"
if '%choice%'=='0' goto start
ECHO "%choice%" is not valid, try again
ECHO.
goto start

:IsAdmin
Reg.exe query "HKU\S-1-5-19\Environment"
If Not %ERRORLEVEL% EQU 0 (
 Cls & Echo You must have administrator rights to continue ... 
 Pause & Exit
)
Cls
goto:eof
pause
goto :start