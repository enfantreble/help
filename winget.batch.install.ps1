winget update
foreach ($currentItemName in ((Get-Content -Path wingetinimal.lst) -split '\n')) {
    winget install $currentItemName 
}
winget upgrade --all