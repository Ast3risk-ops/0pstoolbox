Invoke-WebRequest https://raw.githubusercontent.com/omartube706/SteavenToolBox/main/SteavenToolBox.cmd -OutFile C:\windows\temp\SteavenToolBox.cmd
Invoke-WebRequest https://raw.githubusercontent.com/omartube706/SteavenToolBox/main/wget.exe -OutFile C:\windows\temp\wget.exe

powershell.exe "C:\windows\temp\SteavenToolBox.cmd"