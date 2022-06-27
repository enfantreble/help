# https://gist.githubusercontent.com/ay65535/6a5eb2c6b943c7243706dd2df715b5f2/raw/1f72154bea8836fe75684894baabad48f15340cd/after_cleaninstall.md
<!-- vim: set fileencoding=utf-8 ff=unix expandtab ts=4 sw=4 ft=markdown : -->

```powershell
# Change network profile
```

```bat
start ms-settings:about
start ms-settings:activation
start ms-settings:windowsupdate
start ms-settings:windowsupdate-options
start ms-settings:windowsupdate-action
start ms-settings:developers
start ms-settings:optionalfeatures
start ms-settings:windowsinsider
start ms-settings:network-status
```

start ms-settings:about







#Log in with MSA and activate using C47GP-QHPMX-VY6QK-GJ3CK-RDJR7

Start Powershell as admin
Start-BitsTransfer -Source https://github.com/PowerShell/PowerShell/releases/download/v7.3.0-preview.5/PowerShell-7.3.0-preview.5-win-x64.msi -Destination PowerShell-7.3.0-preview.5-win-x64.msi
Start-BitsTransfer -Source https://github.com/microsoft/winget-cli/releases/download/v1.3.1681/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle

//should be in powershell
echo 'starting to install unwanted windows apps'
//REMOVE.uwp.list
//add uwp.list

mkdir c:\Tools\
mkdir c:\Tools\Scoop\

New-Item -Path Env:SCOOP_GLOBAL -Value 'c:\Tools\Scoop\'
new-item -Path Env:SCOOP_CACHE -Value 'C:\Tools\Scoop\cache'
New-Item -Path Env:SCOOP -Value 'c:\Tools\Scoop'

iex "& {$(irm get.scoop.sh)} -RunAsAdmin -ScoopDir c:\Tools\Scoop -ScoopGlobalDir c:\Tools\Scoop -ScoopCacheDir c:\Tools\Scoop\cache"
scoop install -g git vim less grep openssh
cd c:\Tools
mkdir Code
cd Code
got clone https://github.com/enfantreble/help.git
cd help

scoop bucket add extras
scoop bucket add nirsoft
. scoop.batch.install.ps1


cmd setx GOOGLE_API_KEY AIzaSyAx0XSzIrVGEaJGD60EVryh6q5J3BrruS8
cmd setx GOOGLE_DEFAULT_CLIENT_ID 63706570987-074g991bolcljh44an8jrhjsn559sjc5.apps.googleusercontent.com
cmd setx GOOGLE_DEFAULT_CLIENT_SECRET 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


.\install.ps1 -RunAsAdmin [-OtherParameters ...]
# I don't care about other parameters and want an one-line command


Set-ExecutionPolicy RemoteSigned -scope CurrentUser

scoop install sudo wget curl git
sudo C:\Tools\Scoop\apps\openssh\current\install-sshd.ps1
ssh-keygen.exe -t ed25519

New-ItemProperty -Path "HKLM:\SOFTWARE\OpenSSH" -Name DefaultShell -Value "C:\\Tools\\PowerShell\\7-preview\\pwsh.EXE" -PropertyType String -Force
New-ItemProperty -Path "HKLM:\SOFTWARE\OpenSSH" -Name DefaultShellCommandOption -Value "/c" -PropertyType String -Force

//edit sshd confog
//open port

scoop bucket add extras
scoop bucket add nirsoft

foreach($line in [System.IO.File]::ReadLines("scoop.list")) {
        scoop install $line.split(" ")[0] -g
}


# Windows environment variable
[System.Environment]::SetEnvironmentVariable("http_proxy", "$proxyUrl", "Machine")
[System.Environment]::SetEnvironmentVariable("https_proxy", "$proxyUrl", "Machine")
[System.Environment]::SetEnvironmentVariable("ftp_proxy", "$proxyUrl", "Machine")
[System.Environment]::SetEnvironmentVariable("no_proxy", "$($bypassList -join ',')", "Machine")

# WinHTTP proxy
netsh winhttp set proxy proxy-server="199.19.250.205:80" bypass-list="<local>;$($bypassList -join ';')"
netsh winhttp show proxy

# Git config
git config --file $HOME/.config/git/config https.proxy http://199.19.250.205:80/
git config --file $HOME/.config/git/config http.proxy http://199.19.250.205:80/
C47GP-QHPMX-VY6QK-GJ3CK-RDJR7
# erase proxy settings
## Temporary
Remove-Item Env:\https_proxy
Remove-Item Env:\http_proxy
Remove-Item Env:\ftp_proxy
Remove-Item Env:\no_proxy
## Permanently
[System.Environment]::SetEnvironmentVariable("http_proxy", $null, "Machine")
[System.Environment]::SetEnvironmentVariable("https_proxy", $null, "Machine")
[System.Environment]::SetEnvironmentVariable("ftp_proxy", $null, "Machine")
[System.Environment]::SetEnvironmentVariable("no_proxy", $null, "Machine")
netsh winhttp reset proxy
git config --file $HOME/.config/git/config --unset https.proxy
git config --file $HOME/.config/git/config --unset http.proxy
```

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
Set-ExecutionPolicy Bypass -Scope process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
Find-PackageProvider Chocolatey -Verbose
Get-PackageProvider Chocolatey -Verbose -ForceBootstrap
Install-PackageProvider Chocolatey -Verbose

choco config set proxy "$proxyServer"

# https://github.com/jianyunt/ChocolateyGet
Get-PackageProvider
Find-PackageProvider ChocolateyGet -Verbose
Install-PackageProvider ChocolateyGet -Verbose
Import-PackageProvider ChocolateyGet -Verbose
Get-PackageProvider -Verbose

Get-Command -Module PowerShellGet
Get-Command Find-Module
Get-Command -Module PackageManagement
Get-Module PSReadline
Find-Module PSReadline
Find-Module PSReadline -AllowPrerelease
Install-Module PSReadline -AllowPrerelease -Scope CurrentUser -Force -SkipPublisherCheck

we wait for afea hours


Find-Package -ProviderName ChocolateyGet -Name git
choco info docker-desktop
if ($env:PROCESSOR_ARCHITECTURE.Contains('64')) {
    #Install-Package -ProviderName ChocolateyGet -Name docker-desktop -AdditionalArguments '--pre'
    winget install "Docker Desktop Edge"
}
else {
    Install-Package -ProviderName ChocolateyGet -Name docker-machine, openssh
}
#   "features": {
#    "buildkit": true
#  }
choco feature enable -n allowGlobalConfirmation
## fonts
Install-Package -ProviderName ChocolateyGet -Name FiraCode, fonts-ricty-diminished
## platforms
#Install-Package -ProviderName ChocolateyGet -Name powershell-core    -AdditionalArguments '--install-arguments="REGISTER_MANIFEST=1 ENABLE_PSREMOTING=1" --packageparameters "/CleanUpPath"'
#Install-Package -ProviderName ChocolateyGet -Name powershell-preview -AdditionalArguments '--install-arguments="REGISTER_MANIFEST=1 ENABLE_PSREMOTING=1" --packageparameters "/CleanUpPath"'
cinst powershell-preview --install-arguments="REGISTER_MANIFEST=1 ENABLE_PSREMOTING=1" --packageparameters "/CleanUpPath"
$POWERSHELL_TELEMETRY_OPTOUT = $TRUE
$POWERSHELL_TELEMETRY_OPTOUT
Enable-PSRemoting -SkipNetworkProfileCheck

Install-Package -ProviderName ChocolateyGet -Name msys2 -AdditionalArguments '--params "/NoUpdate /InstallDir:C:\tools\msys64"'
# choco install ruby --version=1.8.7.37402
Install-Package -ProviderName ChocolateyGet -Name ruby -AdditionalArguments '--version=1.8.71.37402'
Install-Package -ProviderName ChocolateyGet -Name ruby
ridk install 2 3
# rbenv-win
Invoke-WebRequest -Uri https://gist.githubusercontent.com/nak1114/7ea63204203883c5884d/raw/2dfeab2798cb54170cd872a1068aa19b9bef10dc/install-rbenv-win.bat -OutFile ~/Downloads/install-rbenv-win.bat
Start-process ~/Downloads/install-rbenv-win.bat

Install-Package -ProviderName ChocolateyGet -Name git -AdditionalArguments '--params "/GitAndUnixToolsOnPath /NoAutoCrlf /NoShellIntegration"'
Set-Location $HOME\OneDrive\Documents
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
cmd /c "dir" | sls SYM
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
Start-process 'https://aka.ms/wslstore'
wsl --list --verbose

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
## Download Git for Windows SDK
$url = 'https://github.com/git-for-windows/build-extra/releases/latest/'
$request = [System.Net.WebRequest]::Create($url)
$request.AllowAutoRedirect = $FALSE
$response = $request.GetResponse()
$uri = $([String]$response.GetResponseHeader("Location")).Replace('tag', 'download')
$uri -match '-[\d\.]+'
if ($env:PROCESSOR_ARCHITECTURE.Contains('64')) {
    $arch = '64'
}
else {
    $arch = '32'
}
$filename = 'git-sdk-installer' + $Matches[0] + '-' + $arch + '.7z.exe'
$uri = "${uri}/${filename}"
Invoke-WebRequest -Uri "$uri" -OutFile "$HOME\Downloads\$filename"
Start-process $HOME\Downloads\$filename
$oldSystemPath = [System.Environment]::GetEnvironmentVariable("Path", "Machine")
$oldSystemPath += ";C:\git-sdk-64\mingw64\bin"
[System.Environment]::SetEnvironmentVariable("Path", $oldSystemPath, "Machine")
refreshenv
$env:Path -creplace ";", "`r`n"
```

```bash
/mingw64/libexec/git-core/git-credential-manager.exe install
```

```powershell
# https://github.com/lukesampson/scoop#installation
iex (new-object net.webclient).downloadstring('https://get.scoop.sh')
scoop install aria2 sudo

scoop checkup '*'

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

## Download PowerShell 6
$url = 'https://github.com/PowerShell/PowerShell/releases/latest/'
$request = [System.Net.WebRequest]::Create($url)
$request.AllowAutoRedirect = $FALSE
$response = $request.GetResponse()
$uri = $([String]$response.GetResponseHeader("Location")).Replace('tag', 'download')
$uri -match '[\d\.]+$'
$filename = 'PowerShell-' + $Matches[0] + '-win-x86.msi'
$uri = "${uri}/${filename}"
Invoke-WebRequest -Uri "$uri" -OutFile "$HOME\Downloads\$filename"
"$HOME\Downloads\$filename"
Remove-Item $PSHome\DELETE_ME_TO_DISABLE_CONSOLEHOST_TELEMETRY

## Rust
Start-process 'https://win.rustup.rs'
Start-process ~/Downloads/rustup-init.exe
# starship
cargo install starship

## Download GitBucket
$url = 'https://github.com/gitbucket/gitbucket/releases/latest/'
$request = [System.Net.WebRequest]::Create($url)
$request.AllowAutoRedirect = $FALSE
$response = $request.GetResponse()
$uri = $([String]$response.GetResponseHeader("Location")).Replace('tag', 'download')
$filename = 'gitbucket.war'
$uri = "${uri}/${filename}"
Invoke-WebRequest -Uri "$uri" -OutFile "$HOME\Downloads\$filename"
mkdir "$HOME\srv"
mkdir "$HOME\srv\tmp"
mv "$HOME\Downloads\$filename" "$HOME\srv\$filename"
java -jar "$HOME\srv\$filename" --prefix=gitbucket --gitbucket.home='\\path\to\file\server\user\srv' --temp_dir="$HOME\srv\tmp" --max_file_size=1073741824

$env:Path -creplace ";", "`r`n"
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
Start-process https://osdn.jp/downloads/users/8/8634/genshingothic-20150607.7z
Start-process https://osdn.jp/downloads/users/8/8636/genjyuugothic-20150607.7z
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
winget install 9NZTWSQNTD0S	 -s msstore
winget install 9NKSQGP7F2NH -s msstore
winget install 9NF8H0H7WMLT -s msstore
