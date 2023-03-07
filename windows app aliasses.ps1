mklink %LOCALAPPDATA%\Microsoft\WindowsApps\prg.exe 'C:\Windows\System32\control.exe'
mklink %LOCALAPPDATA%\Microsoft\WindowsApps\rdp.exe 'C:\Windows\system32\mstsc.exe'

# HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\App Paths

Remove-Item $env:LOCALAPPDATA\Microsoft\WindowsApps\python.exe


https://www.anycodings.com/1questions/5270065/batch-how-to-mklink-with-arguments