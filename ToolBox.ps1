Invoke-WebRequest https://raw.githubusercontent.com/omartube706/SteavenToolBox/main/SteavenToolBox.cmd -OutFile C:\windows\temp\SteavenToolBox.cmd
Invoke-WebRequest https://raw.githubusercontent.com/omartube706/SteavenToolBox/main/RunTime-no-admin.cmd -OutFile C:\windows\temp\RunTime-no-admin.ps1
cmd /k "C:\windows\temp\RunTime-no-admin.ps1"
powershell.exe "C:\windows\temp\SteavenToolBox.cmd"