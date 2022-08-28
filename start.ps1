function prompt {
    $host.ui.RawUI.WindowTitle = (Get-Location).ToString().Replace($Z, '~')
    $version = $Host.Version.tostring()
    $version = $version.replace('-preview.', '-')
    Write-Host $version -ForegroundColor White -NoNewline
    $CmdPromptUser = [Security.Principal.WindowsIdentity]::GetCurrent();
    $IsAdmin = (New-Object Security.Principal.WindowsPrincipal ([Security.Principal.WindowsIdentity]::GetCurrent())).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)

    $username = "$($PSStyle.ForeGround.FromRgb(0x209cec))`b`u{FA6F}$($PSStyle.Reset)$($PSStyle.ForeGround.FromRgb(0xf69d58))`u{1d49F}`u{1d4B6}`u{1d4C3} `u{1d4A7}`u{1d4CA}`u{1d4B8}`u{1d4B6}`u{1d4B8}`u{1d4BE} "
    Write-Host "$($PSStyle.ForeGround.FromRgb(0xcec889))$username$RESET" -ForegroundColor White -NoNewline
    Write-Host "$($PSStyle.BackGround.FromRgb(0x209cec))$($PSStyle.ForeGround.FromRgb(0xb4009e)) ℕ 𝕌 𝕋 $($PSStyle.Reset)" -NoNewline
    $historycount = ((Get-Content -Path (Get-PSReadLineOption).HistorySavePath) | Measure-Object –Line).Lines
    $currentSesisonhistory = (Get-History).length
    Write-Host "`b`b[$currentSesisonhistory/$historycount]" -ForegroundColor Magenta -NoNewline
    $location = Get-Location
    if ($location.Path.StartsWith($HOME)) {
        $location = $location.Path.Replace($HOME, '~')
    }
    Write-Host "$location\" -ForegroundColor DarkCyan -NoNewline
    return '> '
}



#converts string to MD5 hash in hyphenated and uppercase format

# $fore = (& pip install colorhash;  python a.py $env:USERNAME)
# $back = (& pip install colorhash;python a.py $env:COMPUTERNAME)
# echo $back
# Write-Host "$($PSStyle.Foreground.FromRgb($fore)) $($PSStyle.Background.FromRgb($back)) Dan Lucaci"