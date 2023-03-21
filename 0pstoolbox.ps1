Invoke-WebRequest https://raw.githubusercontent.com/ast3risk-ops/0pstoolbox/main/0pstoolbox.cmd -OutFile C:\windows\temp\0pstoolbox.cmd
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
powershell.exe "C:\windows\temp\0pstoolbox.cmd"
