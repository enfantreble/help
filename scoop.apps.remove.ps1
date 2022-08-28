scoop update
foreach ($currentItemName in ((Get-Content -Path scoop.apps.remove.list) -split '\n')) {
    scoop uninstall $currentItemName
}
scoop checkup
Wr
