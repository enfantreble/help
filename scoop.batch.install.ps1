scoop update
foreach ($currentItemName in ((Get-Content -Path scoop.apps.lst) -split '\n')) {
    scoop install $currentItemName 
}
scoop checkup