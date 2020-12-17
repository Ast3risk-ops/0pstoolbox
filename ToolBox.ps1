Invoke-WebRequest https://raw.githubusercontent.com/omartube706/SteavenToolBox/main/SteavenToolBox.zip -OutFile C:\windows\temp\SteavenToolBox.zip
Expand-Archive -LiteralPath C:\windows\temp\SteavenToolBox.zip -DestinationPath C:\windows\temp\ InvoicesUnzipped

powershell.exe "C:\windows\temp\SteavenToolBox.cmd"