Invoke-WebRequest https://raw.githubusercontent.com/omartube706/SteavenToolBox/main/SteavenToolBox.cmd -OutFile C:\windows\temp\SteavenToolBox.cmd
Invoke-WebRequest https://raw.githubusercontent.com/omartube706/SteavenToolBox/main/RunTime-no-admin.cmd -OutFile C:\windows\temp\RunTime-no-admin.cmd
cmd /k "C:\windows\temp\RunTime-no-admin.cmd"
powershell.exe "C:\windows\temp\SteavenToolBox.cmd"