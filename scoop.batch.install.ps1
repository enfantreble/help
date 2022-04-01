scoop update
foreach ($currentItemName in ((Get-Content -Path scoop.apps.list) -split '\n')) {
    scoop install $currentItemName 
}
scoop checkup