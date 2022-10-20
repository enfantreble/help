scoop update
foreach ($currentItemName in ((Get-Content -Path scoop.apps.remove.list) -split '\n')) {
    scoop uninstall $currentItemName
}
scoop checkup
Wr
https://github.com/enfantreble/configuration-script-win/blob/main/install.ps1