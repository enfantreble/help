$wg = Get-WGInstalled
foreach ($item in ($wg.id | Sort-Object)) {
    Write-Host "ITEM : $($item.id)" -ErrorAction SilentlyContinue
    try {
        $i = $item.id.split('.')
    } catch { Write-Host "EROROR $item" }
    Write-Host "$item :::  $($i[1..-1])" -ErrorAction SilentlyContinue
}