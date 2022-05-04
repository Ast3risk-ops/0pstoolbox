Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()
$ErrorActionPreference = 'SilentlyContinue'
$wshell = New-Object -ComObject Wscript.Shell
$Button = [System.Windows.MessageBoxButton]::YesNoCancel
$ErrorIco = [System.Windows.MessageBoxImage]::Error
If (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]'Administrator')) {
	Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
	Exit
}

# GUI Specs
# Check if winget is installed
Write-Host "Checking if Winget is Installed..."
if (Test-Path ~\AppData\Local\Microsoft\WindowsApps\winget.exe){    Write-Host "Winget Already Installed"
}else{
    if(((((Get-ComputerInfo).OSName.IndexOf("LTSC")) -ne -1) -or ((Get-ComputerInfo).OSName.IndexOf("Server") -ne -1)) -and (((Get-ComputerInfo).WindowsVersion) -ge "1809")){#Checks if Windows edition is LTSC 2019+
        #Manually Installing Winget
        Write-Host "Running Alternative Installer for LTSC/Server Editions"
        $ResultText.Text = "`r`n" +"`r`n" + "Running Alternative Installer for LTSC/Server Editions"

        #Download Needed Files
        Write-Host "Downloading Needed Files..."
        $ResultText.Text = "`r`n" +"`r`n" + "Downloading Needed Files..."
        Start-BitsTransfer -Source "https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx" -Destination "./Microsoft.VCLibs.x64.14.00.Desktop.appx"
        Start-BitsTransfer -Source "https://github.com/microsoft/winget-cli/releases/download/v1.2.10271/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle" -Destination "./Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle"
        Start-BitsTransfer -Source "https://github.com/microsoft/winget-cli/releases/download/v1.2.10271/b0a0692da1034339b76dce1c298a1e42_License1.xml" -Destination "./b0a0692da1034339b76dce1c298a1e42_License1.xml"

        #Installing Packages
        Write-Host "Installing Packages..."
        $ResultText.Text = "`r`n" +"`r`n" + "Installing Packages..."
        Add-AppxProvisionedPackage -Online -PackagePath ".\Microsoft.VCLibs.x64.14.00.Desktop.appx" -SkipLicense
        Add-AppxProvisionedPackage -Online -PackagePath ".\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle" -LicensePath ".\b0a0692da1034339b76dce1c298a1e42_License1.xml"
        Write-Host "winget Installed (Reboot might be required before winget will work)"
        $ResultText.Text = "`r`n" +"`r`n" + "winget Installed (Reboot might be required before winget will work)"

        #Sleep for 5 seconds to maximize chance that winget will work without reboot
        Write-Host "Sleeping for 5 seconds to maximize chance that winget will work without reboot"
        $ResultText.Text = "`r`n" +"`r`n" + "Sleeping for 5 seconds to maximize chance that winget will work without reboot"
        Start-Sleep -s 5

        #Removing Unneeded Files
        Write-Host "Removing Unneeded Files..."
        $ResultText.Text = "`r`n" +"`r`n" + "Removing Unneeded Files..."
        Remove-Item -Path ".\Microsoft.VCLibs.x64.14.00.Desktop.appx" -Force
        Remove-Item -Path ".\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle" -Force
        Remove-Item -Path ".\b0a0692da1034339b76dce1c298a1e42_License1.xml" -Force
        Write-Host "Unneeded Files Removed"
        $ResultText.Text = "`r`n" +"`r`n" + "Unneeded Files Removed"
    }elseif(((Get-ComputerInfo).WindowsVersion) -lt "1809"){#Checks if Windows Version is too old for winget
        Write-Host "Winget is not supported on this version of Windows"
    }else{
        #Installing Winget from the Microsoft Store
	    Write-Host "Winget not found, installing it now."
        $ResultText.text = "`r`n" +"`r`n" + "Installing Winget..."
	    Start-Process "ms-appinstaller:?source=https://aka.ms/getwinget"
	    $nid = (Get-Process AppInstaller).Id
	    Wait-Process -Id $nid
	    Write-Host "Winget Installed"
        $ResultText.text = "`r`n" +"`r`n" + "Winget Installed"
    }
}