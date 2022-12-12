Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$ErrorActionPreference = 'SilentlyContinue'
$wshell = New-Object -ComObject Wscript.Shell
$Button = [System.Windows.MessageBoxButton]::YesNoCancel
$ErrorIco = [System.Windows.MessageBoxImage]::Error
Set-ExecutionPolicy RemoteSigned -scope CurrentUser
scoop bucket add extras
Write-Output "Scoop is now installed"
scoop install sudo aria2 wget git
Write-Output "Sudo and Aria2 and Wget and Git is now installed"