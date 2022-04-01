winget update
foreach ($currentItemName in ((Get-Content -Path wingetinimal.list) -split '\n')) {
    winget install $currentItemName 
}
winget upgrade --all