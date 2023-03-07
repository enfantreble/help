# https://gist.githubusercontent.com/ay65535/6a5eb2c6b943c7243706dd2df715b5f2/raw/1f72154bea8836fe75684894baabad48f15340cd/after_cleaninstall.md
# <!-- vim: set fileencoding=utf-8 ff=unix expandtab ts=4 sw=4 ft=markdown : -->

```powershell
# Change network profile
$privNwIfIdx = Get-NetConnectionProfile | Where-Object -Property Name -Like 'eoRT*' | Select-Object -ExpandProperty 'InterfaceIndex'
Set-NetConnectionProfile -InterfaceIndex $privNwIfIdx -NetworkCategory Private
```

```bat
Start-Process ms-settings:about
Start-Process ms-settings:activation
Start-Process ms-settings:windowsupdate
Start-Process ms-settings:windowsupdate-options
Start-Process ms-settings:windowsupdate-action
Start-Process ms-settings:developers
Start-Process ms-settings:optionalfeatures
Start-Process ms-settings:windowsinsider
Start-Process ms-settings:network-status
```

Start-Process ms-settings:about







#Log in with MSA and activate using C47GP-QHPMX-VY6QK-GJ3CK-RDJR7

Start-Process Powershell as admin
# $pwsh=((Invoke-WebRequest 'https://api.github.com/repos/powershell/powershell/releases' | ConvertFrom-Json | Sort-Object -Property published_at -Descending) | where-object {($_.prerelease)} | Select-Object -First 1 -ExpandProperty assets |  Where-Object { $_.browser_download_url -like '*x64.msi'})
# Start-BitsTransfer -Source $pwsh.browser_download_url -Destination $pwsh.name

Invoke-Expression "& { $(Invoke-RestMethod 'https://aka.ms/install-powershell.ps1') } -Destination C:\Powershell\7-preview -AddToPath -Preview"

$tag = Invoke-WebRequest 'https://api.github.com/repos/microsoft/winget-cli/releases' | ConvertFrom-Json | Where-Object { $_.prerelease } | Sort-Object -Property published_at -Descending | Select-Object -First 1 -ExpandProperty tag_name
Start-BitsTransfer -Source "https://github.com/microsoft/winget-cli/releases/download/$tag/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle" -Description Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle
Add-AppxPackage Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle

#wunget
$modules_before = (winget list | Measure-Object -Line).lines
# List of built-in apps to remove
$UninstallPackages = @(
    'Clipchamp.Clipchamp',
    'Microsoft.549981C3F5F10',
    'Microsoft.BingNews'
    'Microsoft.BingWeather',
    'Microsoft.GamingApp',
    'Microsoft.GetHelp',
    'Microsoft.Getstarted',
    'Microsoft.MicrosoftJournal',
    'Microsoft.MicrosoftSolitaireCollection',
    'Microsoft.MicrosoftStickyNotes',
    'Microsoft.MicrosoftOfficeHub',
    'Microsoft.Paint',
    'Microsoft.People',
    'Microsoft.PowerAutomateDesktop',
    'Microsoft.RawImageExtension',
    'Microsoft.SecHealthUI',
    'Microsoft.ScreenSketch',
    'Microsoft.Todos',
    'Microsoft.Whiteboard',
    'Microsoft.Windows.Photos',
    'Microsoft.WindowsAlarms',
    'Microsoft.WindowsFeedbackHub',
    'Microsoft.WindowsMaps',
    'Microsoft.WindowsNotepad',
    'Microsoft.WindowsSoundRecorder',
    'Microsoft.WindowsTerminal',
    'Microsoft.Xbox.TCUI',
    'Microsoft.XboxGameOverlay',
    'Microsoft.XboxGameCallableUI',
    'Microsoft.XboxGamingOverlay',
    'Microsoft.XboxIdentityProvider',
    'Microsoft.XboxSpeechToTextOverlay',
    'Microsoft.YourPhone',
    'Microsoft.ZuneMusic',
    'Microsoft.ZuneVideo',
    'Microsoft.WindowsCamera',
    'MicrosoftCorporationII.QuickAssist',
    'MicrosoftTeams',
    'BytedancePte.Ltd.TikTok',
    'OneNoteFreeRetail - en-us'
)

$scoops = @(
    'DEV-Tools/Czkawka-gui',
    'DEV-Tools/Czkawka',
    'DEV-Tools/Font-Awesome',
    'DEV-Tools/hitomi-downloader',
    'DEV-Tools/quick-access-popup',
    'extras/appbuster',
    'extras/baretail',
    'extras/caesium-image-compressor',
    'extras/calibre',
    'extras/carnac',
    'extras/copyq',
    'extras/ddu',
    'extras/dupeguru',
    'extras/echoargs',
    'extras/everything',
    'extras/fclones',
    'extras/ffmpeg-batch',
    'extras/fontforge',
    'extras/hostsman',
    'extras/joe',
    'extras/lockhunter',
    'extras/mc',
    'extras/mkcert',
    'extras/nexusfont',
    'extras/nirlauncher',
    'extras/notepadplusplus',
    'extras/openvpn-connect',
    'extras/paint.net',
    'extras/peazip',
    'extras/Q-dir',
    'extras/rclone-browser',
    'extras/renderdoc',
    'extras/runcat',
    'extras/scoop-completion',
    'extras/so',
    'extras/terminal-icons',
    'extras/totalcommander',
    'extras/util-linux-ng',
    'extras/vcredist-aio',
    'extras/vcredist2022',
    'extras/vncviewer',
    'extras/winauth',
    'extras/windiff',
    'extras/wingetui',
    'extras/winmerge',
    'extras/winscp',
    'extras/wsa-pacman',
    'extras/xkill',
    'extras/ydl-ui',
    'extras/ytdlp-interface',
    'main/7zip',
    'main/ack',
    'main/adb',
    'main/aria2',
    'main/bat',
    'main/binutils',
    'main/bottom',
    'main/broot',
    'main/cacert',
    'main/ccat',
    'main/chezmoi',
    'main/cmake',
    'main/coreutils',
    'main/csview',
    'main/curl',
    'main/dark',
    'main/diffutils',
    'main/dmg2img',
    'main/dos2unix',
    'main/everything-cli',
    'main/far',
    'main/fd',
    'main/ffmpeg',
    'main/fontreg',
    'main/fselect',
    'main/fsviewer',
    'main/fx',
    'main/fzf',
    'main/gcc',
    'main/gdu',
    'main/git',
    'main/grep',
    'main/grex',
    'main/gzip',
    'main/htmlq',
    'main/hyperfine',
    'main/imagemagick',
    'main/iperf3',
    'main/jdupes',
    'main/jo',
    'main/jq',
    'main/less',
    'main/links',
    'main/lsd',
    'main/lux',
    'main/make',
    'main/mediainfo',
    'main/micro',
    'main/mosh-client',
    'main/naiveproxy',
    'main/nano',
    'main/navi',
    'main/neofetch',
    'main/neovim',
    'main/netcat',
    'main/ngrok',
    'main/nircmd',
    'main/nmap',
    'main/nodejs',
    'main/openssl',
    'main/pastel',
    'main/pdftk',
    'main/perl',
    'main/pget',
    'main/poetry',
    'main/procs',
    'main/psutils',
    'main/python',
    'main/qr',
    'main/rclone',
    'main/ripgrep',
    'main/ruby',
    'main/rust',
    'main/rustup-msvc',
    'main/s',
    'main/scoop-search',
    'main/sd',
    'main/sed',
    'main/selenium',
    'main/shasum',
    'main/speedtest-cli',
    'main/sqlite',
    'main/sudo',
    'main/tldr',
    'main/touch',
    'main/tre-command',
    'main/trid',
    'main/unrar',
    'main/vcpkg',
    'main/vmaf',
    'main/vt-cli',
    'main/watchexec',
    'main/wget',
    'main/which',
    'main/wttop',
    'main/youtube-dl',
    'main/zip',
    'main/zoxide'
)


Write-Output 'List of programs to uninstall', $UninstallPackages
$UninstallPrograms = @(
    'Microsoft.Terminal',
    'aaa'
)

$InstalledPackages = Get-AppxPackage -AllUsers | Where-Object { ($UninstallPackages -contains $_.Name) }
$ProvisionedPackages = Get-AppxProvisionedPackage -Online | Where-Object { ($UninstallPackages -contains $_.DisplayName) }

# Remove provisioned packages first
ForEach ($ProvPackage in $ProvisionedPackages) {
    Write-Host -Object "Attempting to remove provisioned package: [$($ProvPackage.DisplayName)]..."
    Try {
        $Null =
        eName $ProvPackage.PackageName -Online -ErrorAction Stop
        Write-Host -Object "Successfully removed provisioned package: [$($ProvPackage.DisplayName)]"
    } Catch { Write-Warning -Message "Failed to remove provisioned package: [$($ProvPackage.DisplayName)]" }
}

# Remove appx packages
ForEach ($AppxPackage in $InstalledPackages) {
    Write-Host -Object "Attempting to remove Appx package: [$($AppxPackage.Name)]..."
    Try {
        $Null = Remove-AppxPackage -Package $AppxPackage.PackageFullName -AllUsers -ErrorAction Stop
        Write-Host -Object "Successfully removed Appx package: [$($AppxPackage.Name)]"
    } Catch { Write-Warning -Message "Failed to remove Appx package: [$($AppxPackage.Name)]" }
}

# Check for unwanted software via Get-Package
$InstalledPrograms = Get-Package | Where-Object { $UninstallPrograms -contains $_.Name }
$InstalledPrograms | ForEach-Object {
    Write-Host -Object "Attempting to uninstall: [$($_.Name)]..."
    Try {
        $Null = $_ | Uninstall-Package -AllVersions -Force -ErrorAction Stop
        Write-Host -Object "Successfully uninstalled: [$($_.Name)]"
    } Catch { Write-Warning -Message "Failed to uninstall: [$($_.Name)]" }
}
Write-Output "there were $modules_before , now there are  $((winget list | Measure-Object -Line).lines)"


winget install Hibbiki.Chromium
# winget install Microsoft.WindowsTerminal.Preview
# winget install Microsoft.PowerShell
# winget install Google.ChromeRemoteDesktop
winget install Google.Chrome
# winget install Microsoft.OpenSSH.Beta
winget install Microsoft.MouseWithoutBorders


New-Item -Path Env:SCOOP_GLOBAL -Value 'c:\Scoop\Global\'
New-Item -Path Env:SCOOP_CACHE -Value 'C:\Scoop\cache'
New-Item -Path Env:SCOOP_GLOBAL -Value 'c:\Scoop\'
New-Item -Path Env:SCOOP -Value 'c:\Scoop'

Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod get.scoop.sh | Invoke-Expression

scoop install sudo wget curl git innounp dark aria2
scoop config aria2-warning-enabled false
sudo scoop install -g Font-Awesome
sudo Set-ItemProperty 'HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem' -Name 'LongPathsEnabled' -Value 1

New-ItemProperty -Path 'HKLM:\SOFTWARE\OpenSSH' -Name DefaultShell -Value 'C:\\Tools\\PowerShell\\7\\pwsh.EXE' -PropertyType String -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\OpenSSH' -Name DefaultShellCommandOption -Value '/c' -PropertyType String -Force

Write-Output 'ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIL6es28QoqCgB0Ptl+BO++xdFry6uQi9t5I1N4m2AKcZ DanLucaci@NOR' > C:\ProgramData\ssh\administrators_authorized_keys

//edit sshd confog
//open port

scoop bucket add extras
scoop bucket add DEV-Tools https://github.com/anderlli0053/DEV-tools.git
scoop bucket add nerd-fonts https://github.com/matthewjberger/scoop-nerd-fonts
scoop bucket add fonts https://github.com/KnotUntied/scoop-fonts.git
scoop bucket add nonportable https://github.com/ScoopInstaller/Nonportable
scoop bucket add java https://github.com/ScoopInstaller/Java
scoop bucket add echoscoop https://github.com/echoiron/echo-scoop
scoop bucket add naderi https://github.com/naderi/scoop-bucket

scoop update
scoop status
scoop update scoop
scoop update '*'
scoop cleanup '*'
scoop cache rm '*'
scoop checkup '*'

# foreach ($line in [System.IO.File]::ReadLines('scoop.list')) {
#     scoop install $line.split(' ')[0]
# }
reg import 'C:\Scoop\apps\everything\current\install-context.reg'
C:\Scoop\apps\scoop-completion\current\add-profile-content.ps1
'C:\Scoop\apps\wsa-pacman\current\install-associations.reg'
#"C:\Program Files\WindowsApps\Microsoft.PowerShellPreview_7.3.3.0_x64__8wekyb3d8bbwe\pwsh.EXE" -NoExit -noprofile -nologo  "c:\Users\Dan Lucaci\OneDrive\Code\Pwsh\icons\setIcon.ps1" %P%N "%T"
# WinHTTP proxy

# Git config
git config --file $HOME/.config/git/config https.proxy http://199.19.250.205:80/
git config --file $HOME/.config/git/config http.proxy http://199.19.250.205:80/

winkey
C47GP-QHPMX-VY6QK-GJ3CK-RDJR7
# erase proxy settings
## Temporary

```powershell
Get-ExecutionPolicy
Set-ExecutionPolicy RemoteSigned

#Get-PackageProvider -Name NuGet
#Get-PackageProvider -Name Chocolatey
Get-PackageProvider
Get-PackageSource

# https://blog.shibata.tech/entry/2017/12/18/004105
Get-Module PowerShellGet, PackageManagement
Get-Module PowerShellGet, PackageManagement -ListAvailable
Install-PackageProvider NuGet -Verbose
Get-PSRepository
Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
Get-PSRepository
Install-Module PowerShellGet -Scope CurrentUser -Force -AllowClobber
Get-InstalledModule
exit
Get-Module PowerShellGet, PackageManagement

# https://qiita.com/arachan@github/items/399da4a19ac3a20205a7#comment-dbc66aa8a1b35eb06fdb
# https://chocolatey.org/install#installing-chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

Install-Module PSReadline -AllowPrerelease -Scope CurrentUser -Force -SkipPublisherCheck

#we wait for afea hours

Find-Package -ProviderName ChocolateyGet -Name git
Install-Package -ProviderName ChocolateyGet -Name FiraCode, fonts-ricty-diminished

Enable-PSRemoting -SkipNetworkProfileCheck

git clone https://github.com/ay65535/dotfiles.git
Set-Location $HOME
mkdir .cache
if (!(Test-Path .\OneDrive\Documents\dotfiles\local)) {
    mkdir .\OneDrive\Documents\dotfiles\local
}
if (!(Test-Path .\OneDrive\Documents\dotfiles\bin)) {
    mkdir .\OneDrive\Documents\dotfiles\bin
}
#$dotfilesPath = 'OneDrive\Documents\dotfiles'
$dotfilesPath = 'dotfiles-work'
New-Item -Type SymbolicLink -Path bin -Value .\$dotfilesPath\bin
New-Item -Type SymbolicLink -Path .config -Value .\$dotfilesPath\config
New-Item -Type SymbolicLink -Path local -Value .\$dotfilesPath\local
New-Item -ItemType SymbolicLink -Path .profile -Value .\$dotfilesPath\profile
New-Item -ItemType SymbolicLink -Path .tmux.conf -Value .\$dotfilesPath\tmux.conf
New-Item -ItemType SymbolicLink -Path .zshenv -Value .\$dotfilesPath\zshenv
New-Item -ItemType SymbolicLink -Path .curlrc -Value .\$dotfilesPath\config\curl\curlrc
New-Item -ItemType SymbolicLink -Path .gitconfig -Value .\$dotfilesPath\config\git\config
cmd /c 'dir' | Select-String SYM
mkdir .cache/vim
mkdir .cache/vim/undo
mkdir .cache/vim/swap
mkdir .cache/vim/backup
mkdir .local/share/vim
mkdir .local/share/vim/after

New-Item -Type SymbolicLink -Path Documents -Value ドキュメント
New-Item -Type SymbolicLink -Path Desktop -Value デスクトップ
New-Item -Type SymbolicLink -Path Pictures -Value 画像

Install-Package -ProviderName ChocolateyGet -Name googlechromebeta -AdditionalArguments '--pre'
#Install-Package -ProviderName ChocolateyGet -Name 1password, cpu-z, fontforge, fzf, GoogleChrome, libreoffice-fresh, realtek-hd-audio-driver, sublimetext3, sumatrapdf, sysinternals, vagrant, virtualbox, vscode, winmerge-jp
sudo Install-Package -ProviderName ChocolateyGet -Name 7-taskbar-tweaker
Install-Package -ProviderName ChocolateyGet -Name 'virtualbox' -AdditionalArguments '--params "/CurrentUser /NoDesktopShortcut /NoQuickLaunch /ExtensionPack"'
Install-Package -ProviderName ChocolateyGet -Name 1password, hyper, fluent-terminal, xmind, cpu-z, fzf, GoogleChrome, libreoffice-fresh, winmerge-jp
Install-Package -ProviderName ChocolateyGet -Name line, dropbox, ChocolateyGUI, jetbrainstoolbox, git-fork
#sed -i -e "s/^LocalizedResourceName/;LocalizedResourceName/g" $HOME
#find $USERPROFILE -type f -iname 'Desktop.ini' -print0 | xargs -0 sed -i -e 's/^LocalizedResourceName/;LocalizedResourceName/g'
Install-Module -Name PowerTab -Scope CurrentUser
Install-Module -Name PSFzf
Install-Package -ProviderName ChocolateyGet -Name pandoc, pandoc-crossref
scoop install pandoc pandoc-crossref

Get-Package -ProviderName Chocolatey, ChocolateyGet, NuGet, PowerShellGet

## Enable WSL
# @see https://docs.microsoft.com/en-us/windows/wsl/install-on-server
# @see https://aka.ms/wsl2-install
#Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
restart
wsl --set-default-version 2
Start-Process 'https://aka.ms/wslstore'
wsl --list --verbose

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
## Download Git for Windows SDK
$url = 'https://github.com/git-for-windows/build-extra/releases/latest/'
$request = [System.Net.WebRequest]::Create($url)
$request.AllowAutoRedirect = $false
$response = $request.GetResponse()
$uri = $([String]$response.GetResponseHeader('Location')).Replace('tag', 'download')
$uri -match '-[\d\.]+'
if ($env:PROCESSOR_ARCHITECTURE.Contains('64')) {
    $arch = '64'
} else {
    $arch = '32'
}
$filename = 'git-sdk-installer' + $Matches[0] + '-' + $arch + '.7z.exe'
$uri = "${uri}/${filename}"
Invoke-WebRequest -Uri "$uri" -OutFile "$HOME\Downloads\$filename"
Start-Process $HOME\Downloads\$filename
$oldSystemPath = [System.Environment]::GetEnvironmentVariable('Path', 'Machine')
$oldSystemPath += ';C:\git-sdk-64\mingw64\bin'
[System.Environment]::SetEnvironmentVariable('Path', $oldSystemPath, 'Machine')
refreshenv
$env:Path -creplace ';', "`r`n"
```

```bash
/mingw64/libexec/git-core/git-credential-manager.exe install
```

```powershell
# https://github.com/lukesampson/scoop#installation
Invoke-Expression (New-Object net.webclient).downloadstring('https://get.scoop.sh')
scoop install aria2 git sudo

scoop config aria2-warning-enabled false

scoop checkup '*'
scoop config aria2-warning-enabled false curl jq fx
Invoke-WebRequest https://api.github.com/repos/powershell/powershell/releases | jq '.[].browser_download_url' | grep 'x64.msi'

# WARN  Windows Defender may slow down or disrupt installs with realtime scanning.
#   Consider running:
sudo Add-MpPreference -ExclusionPath "$HOME\scoop"
#   (Requires 'sudo' command. Run 'scoop install sudo' if you don't have it.)

# WARN  Windows Defender may slow down or disrupt installs with realtime scanning.
#   Consider running:
sudo Add-MpPreference -ExclusionPath "$env:ProgramData\scoop"
#   (Requires 'sudo' command. Run 'scoop install sudo' if you don't have it.)

# WARN  LongPaths support is not enabled.
# You can enable it with running:
Set-ItemProperty 'HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem' -Name 'LongPathsEnabled' -Value 1

# ERROR 'Inno Setup Unpacker' is not installed! It's required for unpacking InnoSetup files. Please run 'scoop install innounp'.
scoop install innounp

# ERROR 'dark' is not installed! It's required for unpacking installers created with the WiX Toolset. Please run 'scoop install dark' or 'scoop install wixtoolset'.
scoop install dark

#sudo scoop install 7zip git openssh --global
scoop install concfg gibo git-town
scoop bucket add jp https://github.com/rkbk60/scoop-for-jp
## for https://github.com/rkbk60/scoop-for-jp
if ($null -eq [Environment]::GetEnvironmentVariable('JP_FONT_DIR', 'User')) {
    #[Environment]::SetEnvironmentVariable('JP_FONT_DIR', "$env:LOCALAPPDATA\Microsoft\Windows\Fonts", 'User')
    [Environment]::SetEnvironmentVariable('JP_FONT_DIR', "$HOME\Library\Fonts", 'User')
}
scoop install myrica

scoop update
scoop status
scoop update scoop
scoop update '*'
scoop cleanup '*'
scoop cache rm '*'
scoop checkup '*'

scoop install echoscoop/idm -g
scoop install echoscoop/contextmenumanager -g
scoop install naderi/kmplayer -g


## Download PowerShell 6
$url = 'https://github.com/PowerShell/PowerShell/releases/latest/'
$request = [System.Net.WebRequest]::Create($url)
$request.AllowAutoRedirect = $false
$response = $request.GetResponse()
$uri = $([String]$response.GetResponseHeader('Location')).Replace('tag', 'download')
$uri -match '[\d\.]+$'
$filename = 'PowerShell-' + $Matches[0] + '-win-x86.msi'
$uri = "${uri}/${filename}"
Invoke-WebRequest -Uri "$uri" -OutFile "$HOME\Downloads\$filename"
"$HOME\Downloads\$filename"
Remove-Item $PSHome\DELETE_ME_TO_DISABLE_CONSOLEHOST_TELEMETRY

## Rust
Start-Process 'https://win.rustup.rs'
Start-Process ~/Downloads/rustup-init.exe
# starship
cargo install starship

## Download GitBucket
$url = 'https://github.com/gitbucket/gitbucket/releases/latest/'
$request = [System.Net.WebRequest]::Create($url)
$request.AllowAutoRedirect = $false
$response = $request.GetResponse()
$uri = $([String]$response.GetResponseHeader('Location')).Replace('tag', 'download')
$filename = 'gitbucket.war'
$uri = "${uri}/${filename}"
Invoke-WebRequest -Uri "$uri" -OutFile "$HOME\Downloads\$filename"
mkdir "$HOME\srv"
mkdir "$HOME\srv\tmp"
Move-Item "$HOME\Downloads\$filename" "$HOME\srv\$filename"
java -jar "$HOME\srv\$filename" --prefix=gitbucket --gitbucket.home='\\path\to\file\server\user\srv' --temp_dir="$HOME\srv\tmp" --max_file_size=1073741824

$env:Path -creplace ';', "`r`n"
sysdm.cpl

PowerShellGet\Install-Module posh-git -Scope CurrentUser -AllowPrerelease -Force
Import-Module posh-git

## printer driver
Push-Location $HOME\Downloads
Invoke-WebRequest -Uri 'https://www.epson.jp/dl_soft/file/21604/PX1600F_PX1700F_PX1200_159JA_64.exe' -OutFile "$HOME\Downloads\PX1600F_PX1700F_PX1200_159JA_64.exe"
Invoke-WebRequest https://noto-website-2.storage.googleapis.com/pkgs/NotoSansCJKjp-hinted.zip
Invoke-WebRequest https://github.com/adobe-fonts/source-han-code-jp/archive/2.011R.zip
Invoke-WebRequest https://github.com/miiton/Cica/releases/download/v3.0.0/Cica_v3.0.0.zip
Invoke-WebRequest https://launchpad.net/takao-fonts/trunk/15.03/+download/TakaoFonts_00303.01.tar.xz
Start-Process https://osdn.jp/downloads/users/8/8634/genshingothic-20150607.7z
Start-Process https://osdn.jp/downloads/users/8/8636/genjyuugothic-20150607.7z
```

# Links

## fudemame 18 updater
- https://fudemame.net/re/fude-site/support/download/fude18/dl20/

- https://bitbucket.org/sdottaka/winmerge-v2/downloads/WinMerge-2.16.2-jp-3-x64-Setup.exe

## LINE
- https://desktop.line-scdn.net/win/new/LineInst.exe
- https://www.microsoft.com/store/apps/9WZDNCRFJ2G6

## other download links
- https://code.visualstudio.com/insiders/
- https://visualstudio.microsoft.com/ja/
- https://visualstudio.microsoft.com/ja/vs/preview/

### clibor
- https://chigusa-web.com/download/

- https://tools.google.com/dlpage/japaneseinput/eula.html?hl=ja&extra=dev
- https://github.com/mintty/wsltty.appx/releases
- https://www.docker.com/blog/5-things-docker-desktop-wsl2-tech-preview/
- https://www.microsoft.com/store/productId/9NBLGGH5R558
- https://www.microsoft.com/store/productId/9WZDNCRFJ3PS
- https://www.microsoft.com/store/productId/9NBLGGH4MSV6
- https://www.microsoft.com/store/productId/9WZDNCRDK3WP
- https://www.microsoft.com/store/productId/9MZ95KL8MR0L
- https://www.microsoft.com/ja-jp/download/details.aspx?id=39379
- https://www.microsoft.com/en-us/download/details.aspx?id=49117
- http://www.si-linux.co.jp/techinfo/index.php?DD%20for%20Windows

```powershell
# cleanup
ms-settings:storagesense
ms-settings:storagepolicies

Pop-Location
```
winget install XP8C9QZMS2PC1T -s msstore
winget install XPFCWP0SQWXM3V -s msstore
winget install XPDM27W10192Q0 -s msstore
winget install 9PLHC123MQWT -s msstore
winget install 9NBHCS1LX4R0 -s msstore
winget install 9WZDNCRFJ364 -s msstore
winget install 9WZDNCRDNFK5 -s msstore
winget install 9PLHXDGSW1RJ -s msstore
winget install XPDM17HK323C4X -s msstore
winget install 9NZTWSQNTD0S	-s msstore
winget install 9NKSQGP7F2NH -s msstore
winget install 9NF8H0H7WMLT -s msstore


Install-Module -AllowPrerelease -Force -Verbose -Name 7Zip4Powershell
Install-Module -AllowPrerelease -Force -Verbose -Name AudioDeviceCmdlets
Install-Module -AllowPrerelease -Force -Verbose -Name Carbon
Install-Module -AllowPrerelease -Force -Verbose -Name ChocolateyGet
Install-Module -AllowPrerelease -Force -Verbose -Name CmdMode
Install-Module -AllowPrerelease -Force -Verbose -Name Cobalt
Install-Module -AllowPrerelease -Force -Verbose -Name CodeConversion
Install-Module -AllowPrerelease -Force -Verbose -Name Configuration
Install-Module -AllowPrerelease -Force -Verbose -Name Convert
Install-Module -AllowPrerelease -Force -Verbose -Name Crescendo
Install-Module -AllowPrerelease -Force -Verbose -Name DSCR_FileAssoc
Install-Module -AllowPrerelease -Force -Verbose -Name EditorServicesCommandSuite
Install-Module -AllowPrerelease -Force -Verbose -Name EzTheme
Install-Module -AllowPrerelease -Force -Verbose -Name Foil
Install-Module -AllowPrerelease -Force -Verbose -Name FontUtilities
Install-Module -AllowPrerelease -Force -Verbose -Name Get-ActiveSession
Install-Module -AllowPrerelease -Force -Verbose -Name Get-ChildItemColor
Install-Module -AllowPrerelease -Force -Verbose -Name Get-MediaInfo
Install-Module -AllowPrerelease -Force -Verbose -Name Graphical
Install-Module -AllowPrerelease -Force -Verbose -Name GuiCompletion
Install-Module -AllowPrerelease -Force -Verbose -Name IconForGUI
Install-Module -AllowPrerelease -Force -Verbose -Name Logging
Install-Module -AllowPrerelease -Force -Verbose -Name Metadata
Install-Module -AllowPrerelease -Force -Verbose -Name Microsoft.PowerShell.Archive
Install-Module -AllowPrerelease -Force -Verbose -Name Microsoft.PowerShell.ConsoleGuiTools
Install-Module -AllowPrerelease -Force -Verbose -Name Microsoft.PowerShell.Crescendo
Install-Module -AllowPrerelease -Force -Verbose -Name Microsoft.PowerShell.WhatsNew
Install-Module -AllowPrerelease -Force -Verbose -Name ModuleBuilder
Install-Module -AllowPrerelease -Force -Verbose -Name MSTerminalSettings
Install-Module -AllowPrerelease -Force -Verbose -Name oh-my-posh
Install-Module -AllowPrerelease -Force -Verbose -Name Pansies
Install-Module -AllowPrerelease -Force -Verbose -Name platyPS
Install-Module -AllowPrerelease -Force -Verbose -Name Posh-SSH
Install-Module -AllowPrerelease -Force -Verbose -Name posh-sshell
Install-Module -AllowPrerelease -Force -Verbose -Name PoshColor
Install-Module -AllowPrerelease -Force -Verbose -Name PoshHosts
Install-Module -AllowPrerelease -Force -Verbose -Name PoShLog
Install-Module -AllowPrerelease -Force -Verbose -Name PowerLine
Install-Module -AllowPrerelease -Force -Verbose -Name PowerRemoteDesktop_Server
Install-Module -AllowPrerelease -Force -Verbose -Name PowerRemoteDesktop_Viewer
Install-Module -AllowPrerelease -Force -Verbose -Name PowerShellCookbook
Install-Module -AllowPrerelease -Force -Verbose -Name PowerShellForGitHub
Install-Module -AllowPrerelease -Force -Verbose -Name PowerShellGet
Install-Module -AllowPrerelease -Force -Verbose -Name ps2exe
Install-Module -AllowPrerelease -Force -Verbose -Name PsComplete
Install-Module -AllowPrerelease -Force -Verbose -Name PSConsoleTheme
Install-Module -AllowPrerelease -Force -Verbose -Name PSDesiredStateConfiguration
Install-Module -AllowPrerelease -Force -Verbose -Name PSEverything
Install-Module -AllowPrerelease -Force -Verbose -Name PSExpandLine
Install-Module -AllowPrerelease -Force -Verbose -Name PSFzf
Install-Module -AllowPrerelease -Force -Verbose -Name PSGalleryExplorer
Install-Module -AllowPrerelease -Force -Verbose -Name PSOneTools
Install-Module -AllowPrerelease -Force -Verbose -Name PSParallel
Install-Module -AllowPrerelease -Force -Verbose -Name PSPGP
Install-Module -AllowPrerelease -Force -Verbose -Name PSReadLine
Install-Module -AllowPrerelease -Force -Verbose -Name PSScriptAnalyzer
Install-Module -AllowPrerelease -Force -Verbose -Name PSScriptMenuGui
Install-Module -AllowPrerelease -Force -Verbose -Name PSScriptTools
Install-Module -AllowPrerelease -Force -Verbose -Name PSStringTemplate
Install-Module -AllowPrerelease -Force -Verbose -Name PSWindowsTermina
Install-Module -AllowPrerelease -Force -Verbose -Name PSWindowsUpdate
Install-Module -AllowPrerelease -Force -Verbose -Name TerminalBlocks
Install-Module -AllowPrerelease -Force -Verbose -Name Theme.PowerShell
Install-Module -AllowPrerelease -Force -Verbose -Name Theme.PSReadLine
Install-Module -AllowPrerelease -Force -Verbose -Name Theme.WindowsConsole
Install-Module -AllowPrerelease -Force -Verbose -Name TreeSize
Install-Module -AllowPrerelease -Force -Verbose -Name WindowsConsoleFonts
Install-Module -AllowPrerelease -Force -Verbose -Name WTToolBox
Install-Module -AllowPrerelease -Force -Verbose -Name xRobocopy
Install-Module -AllowPrerelease -Force -Verbose -Name xWindowsUpdate