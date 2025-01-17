Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$ErrorActionPreference = 'SilentlyContinue'
$wshell = New-Object -ComObject Wscript.Shell
$Button = [System.Windows.MessageBoxButton]::YesNoCancel
$ErrorIco = [System.Windows.MessageBoxImage]::Error
Set-ExecutionPolicy RemoteSigned -scope CurrentUser
scoop install git | Out-Null
scoop bucket add extras | Out-Null
Write-Output "Scoop is now installed"
scoop install sudo aria2 wget git grep | Out-Null
Write-Output "Sudo and Aria2 and Wget and Git is now installed"