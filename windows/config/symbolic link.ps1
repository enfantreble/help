New-Item -ItemType SymbolicLink -Path ${code}\PROFILE.ps1 -target $PROFILE
New-Item -ItemType SymbolicLink -Path ${code}\terminal.settings.json -target "C:\Users\Dan Lucaci\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
New-Item -ItemType SymbolicLink -Path ${code}\TERMINAL.json -target "C:\Users\Dan Lucaci\AppData\Local\Packages\Microsoft.WindowsTerminalPreview_8wekyb3d8bbwe\LocalState\settings.json"


# Write-Host $n.days+"d", $n.hours+"h", $n.minutes+"m", $n.seconds+"s"


#C:\Users\Dan Lucaci\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json

#C:\Users\Dan Lucaci\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json


New-Item -ItemType SymbolicLink -Path . -target  "$code"
