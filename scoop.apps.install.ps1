scoop update
foreach ($currentItemName in ((Get-Content -Path C:\Code\powershell\help\scoop.apps.nirsoft.list) -split '\n')) {
    scoop uninstall $currentItemName
    scoop install $currentItemName -g
}
scoop checkup
