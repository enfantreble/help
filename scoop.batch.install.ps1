scoop update
foreach ($currentItemName in ((Get-Content -Path scoop.apps.txt) -split '\n')) {
    scoop install $currentItemName 
}
scoop checkup