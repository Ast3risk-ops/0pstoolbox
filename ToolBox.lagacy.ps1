Invoke-WebRequest https://raw.githubusercontent.com/omartube706/SteavenToolBox/main/SteavenToolBox.lagacy.cmd -OutFile C:\windows\temp\SteavenToolBox.lagacy.cmd
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
powershell.exe "C:\windows\temp\SteavenToolBox.lagacy.cmd"