# Set the local timezone, I don't know why it's always incorrectly set
Invoke-Expression 'tzutil /s "AUS Eastern Standard Time"'

# Power management
powercfg /h off
powercfg -change -hibernate-timeout-dc 0
powercfg -change -hibernate-timeout-ac 0
powercfg -change -standby-timeout-dc 0
powercfg -change -standby-timeout-ac 0
powercfg -change -monitor-timeout-dc 0
powercfg -change -monitor-timeout-ac 30
powercfg -change -disk-timeout-dc 180
powercfg -change -disk-timeout-ac 180

# Setting Windows Explorer settings: Show Hidden Files, Show File Extension, Open Explorer default to This PC
Set-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon' -Name AutoRestartShell -Value 0
$key = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced'
Set-ItemProperty $key Hidden 1
Set-ItemProperty $key HideFileExt 0
Set-ItemProperty $key LaunchTo 1
Set-ItemProperty $key ShowTaskViewButton 0

# Hide Search button / box
Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Search' -Name 'SearchboxTaskbarMode' -Type DWord -Value 0

# Show all tray icons
Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer' -Name 'EnableAutoTray' -Type DWord -Value 0

# Remove "People Icon" from the taskbar
If (!(Test-Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People')) {
    New-Item -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People' | Out-Null
}

# Unpin all Taskbar icons
Write-Output 'Unpinning all Taskbar icons...'
Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Taskband' -Name 'Favorites' -Type Binary -Value ([byte[]](255))
Remove-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Taskband' -Name 'FavoritesResolve' -ErrorAction SilentlyContinue
Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People' -Name 'PeopleBand' -Type DWord -Value 0

# Turn Off App Suggestions on Start Menu
reg add 'HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' /v SubscribedContent-338388Enabled /t REG_DWORD /d 0 /f >nul 2>&1

# Disable Stick keys
Write-Output 'Disabling Sticky keys prompt...'
Set-ItemProperty -Path 'HKCU:\Control Panel\Accessibility\StickyKeys' -Name 'Flags' -Type String -Value '506'

# Task manager extended details by default
Write-Output 'Showing file operations details...'
If (!(Test-Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\OperationStatusManager')) {
    New-Item -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\OperationStatusManager' | Out-Null
}
Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\OperationStatusManager' -Name 'EnthusiastMode' -Type DWord -Value 1

# Prevents "Suggested Applications" returning
# Disable Application suggestions and automatic installation
Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'ContentDeliveryAllowed' -Type DWord -Value 0
Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'OemPreInstalledAppsEnabled' -Type DWord -Value 0
Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'PreInstalledAppsEnabled' -Type DWord -Value 0
Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'PreInstalledAppsEverEnabled' -Type DWord -Value 0
Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'SilentInstalledAppsEnabled' -Type DWord -Value 0
Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'SubscribedContent-338387Enabled' -Type DWord -Value 0
Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'SubscribedContent-338388Enabled' -Type DWord -Value 0
Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'SubscribedContent-338389Enabled' -Type DWord -Value 0
Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'SubscribedContent-353698Enabled' -Type DWord -Value 0
Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'SystemPaneSuggestionsEnabled' -Type DWord -Value 0
If (!(Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent')) {
    New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent' -Force | Out-Null
}
Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent' -Name 'DisableWindowsConsumerFeatures' -Type DWord -Value 1

# Disable search for app in store for unknown extensions
Write-Output 'Disabling search for app in store for unknown extensions...'
If (!(Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer')) {
    New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer' | Out-Null
}
Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer' -Name 'NoUseStoreOpenWith' -Type DWord -Value 1

# Enable Windows Containers
Enable-WindowsOptionalFeature -Online -FeatureName containers –All

# Enable Windows Sandbox
Enable-WindowsOptionalFeature -FeatureName 'Containers-DisposableClientVM' -All -Online

# Enables Windows Subsystems
Enable-WindowsOptionalFeature -Online -FeatureName 'Microsoft-Windows-Subsystem-Linux' -NoRestart -WarningAction SilentlyContinue | Out-Null



# Taken from - https://gist.github.com/alirobe/7f3b34ad89a159e6daa1
Get-AppxPackage Microsoft.Windows.ParentalControls | Remove-AppxPackage
Get-AppxPackage Windows.ContactSupport | Remove-AppxPackage
Get-AppxPackage Microsoft.Xbox* | Remove-AppxPackage
Get-AppxPackage microsoft.windowscommunicationsapps | Remove-AppxPackage # Mail and Calendar
Get-AppxPackage Microsoft.WindowsCamera | Remove-AppxPackage
Get-AppxPackage Microsoft.SkypeApp | Remove-AppxPackage
Get-AppxPackage Microsoft.Zune* | Remove-AppxPackage
Get-AppxPackage Microsoft.WindowsPhone | Remove-AppxPackage # Phone Companion
Get-AppxPackage Microsoft.WindowsMaps | Remove-AppxPackage
Get-AppxPackage Microsoft.Office.Sway | Remove-AppxPackage
Get-AppxPackage Microsoft.Appconnector | Remove-AppxPackage
Get-AppxPackage Microsoft.WindowsFeedback* | Remove-AppxPackage
Get-AppxPackage Microsoft.Windows.FeatureOnDemand.InsiderHub | Remove-AppxPackage
Get-AppxPackage Microsoft.Windows.Cortana | Remove-AppxPackage
Get-AppxPackage Microsoft.People | Remove-AppxPackage
Get-AppxPackage Microsoft.Bing* | Remove-AppxPackage # Money, Sports, News, Finance and Weather
Get-AppxPackage Microsoft.Getstarted | Remove-AppxPackage
Get-AppxPackage Microsoft.MicrosoftOfficeHub | Remove-AppxPackage
Get-AppxPackage Microsoft.MicrosoftSolitaireCollection | Remove-AppxPackage
Get-AppxPackage Microsoft.WindowsSoundRecorder | Remove-AppxPackage
Get-AppxPackage Microsoft.3DBuilder | Remove-AppxPackage
Get-AppxPackage Microsoft.Advertising.Xaml | Remove-AppxPackage
Get-AppxPackage Microsoft.Windows.ContentDeliveryManager | Remove-AppxPackage
Get-AppxPackage *Twitter* | Remove-AppxPackage
Get-AppxPackage king.com.CandyCrushSodaSaga | Remove-AppxPackage
Get-AppxPackage flaregamesGmbH.RoyalRevolt2 | Remove-AppxPackage
Get-AppxPackage *Netflix | Remove-AppxPackage
Get-AppxPackage Facebook.Facebook | Remove-AppxPackage
Get-AppxPackage Microsoft.MinecraftUWP | Remove-AppxPackage
Get-AppxPackage *MarchofEmpires | Remove-AppxPackage
Get-AppxPackage '2414FC7A.Viber' | Remove-AppxPackage
Get-AppxPackage '41038Axilesoft.ACGMediaPlayer' | Remove-AppxPackage
Get-AppxPackage '46928bounde.EclipseManager' | Remove-AppxPackage
Get-AppxPackage '4DF9E0F8.Netflix' | Remove-AppxPackage
Get-AppxPackage '64885BlueEdge.OneCalendar' | Remove-AppxPackage
Get-AppxPackage '7EE7776C.LinkedInforWindows' | Remove-AppxPackage
Get-AppxPackage '828B5831.HiddenCityMysteryofShadows' | Remove-AppxPackage
Get-AppxPackage '89006A2E.AutodeskSketchBook' | Remove-AppxPackage
Get-AppxPackage '9E2F88E3.Twitter' | Remove-AppxPackage
Get-AppxPackage 'A278AB0D.DisneyMagicKingdoms' | Remove-AppxPackage
Get-AppxPackage 'A278AB0D.MarchofEmpires' | Remove-AppxPackage
Get-AppxPackage 'ActiproSoftwareLLC.562882FEEB491' | Remove-AppxPackage
Get-AppxPackage 'AdobeSystemsIncorporated.AdobePhotoshopExpress' | Remove-AppxPackage
Get-AppxPackage 'CAF9E577.Plex' | Remove-AppxPackage
Get-AppxPackage 'D52A8D61.FarmVille2CountryEscape' | Remove-AppxPackage
Get-AppxPackage 'D5EA27B7.Duolingo-LearnLanguagesforFree' | Remove-AppxPackage
Get-AppxPackage 'DB6EA5DB.CyberLinkMediaSuiteEssentials' | Remove-AppxPackage
Get-AppxPackage 'DolbyLaboratories.DolbyAccess' | Remove-AppxPackage
Get-AppxPackage 'Drawboard.DrawboardPDF' | Remove-AppxPackage
Get-AppxPackage 'Facebook.Facebook' | Remove-AppxPackage
Get-AppxPackage 'flaregamesGmbH.RoyalRevolt2' | Remove-AppxPackage
Get-AppxPackage 'GAMELOFTSA.Asphalt8Airborne' | Remove-AppxPackage
Get-AppxPackage 'KeeperSecurityInc.Keeper' | Remove-AppxPackage
Get-AppxPackage 'king.com.BubbleWitch3Saga' | Remove-AppxPackage
Get-AppxPackage 'king.com.CandyCrushSodaSaga' | Remove-AppxPackage
Get-AppxPackage 'PandoraMediaInc.29680B314EFC2' | Remove-AppxPackage
Get-AppxPackage 'SpotifyAB.SpotifyMusic' | Remove-AppxPackage
Get-AppxPackage 'WinZipComputing.WinZipUniversal' | Remove-AppxPackage
Get-AppxPackage 'XINGAG.XING' | Remove-AppxPackage
Get-AppxPackage 'Microsoft.BingNews' | Remove-AppxPackage
Get-AppxPackage 'Microsoft.BingWeather' | Remove-AppxPackage
Get-AppxPackage 'Microsoft.GamingApp' | Remove-AppxPackage
Get-AppxPackage 'Microsoft.Getstarted' | Remove-AppxPackage
Get-AppxPackage 'Microsoft.Microsoft3DViewer' | Remove-AppxPackage
Get-AppxPackage 'Microsoft.MicrosoftOfficeHub' | Remove-AppxPackage
Get-AppxPackage 'Microsoft.MicrosoftSolitaireCollection' | Remove-AppxPackage
Get-AppxPackage 'Microsoft.MicrosoftStickyNotes' | Remove-AppxPackage
Get-AppxPackage 'Microsoft.MicrosoftTeams' | Remove-AppxPackage
Get-AppxPackage 'Microsoft.MixedReality.Portal' | Remove-AppxPackage
Get-AppxPackage 'Microsoft.Office.OneNote' | Remove-AppxPackage
Get-AppxPackage 'Microsoft.Paint' | Remove-AppxPackage
Get-AppxPackage 'Microsoft.People' | Remove-AppxPackage
Get-AppxPackage 'Microsoft.PowerAutomateDesktop' | Remove-AppxPackage
Get-AppxPackage 'Microsoft.ScreenSketch' | Remove-AppxPackage
Get-AppxPackage 'Microsoft.SkypeApp' | Remove-AppxPackage
Get-AppxPackage 'Microsoft.Wallet' | Remove-AppxPackage
Get-AppxPackage 'Microsoft.WindowsAlarms' | Remove-AppxPackage
Get-AppxPackage 'Microsoft.WindowsCamera' | Remove-AppxPackage
Get-AppxPackage 'microsoft.windowscommunicationsapps' | Remove-AppxPackage
Get-AppxPackage 'Microsoft.WindowsFeedbackHub' | Remove-AppxPackage
Get-AppxPackage 'Microsoft.WindowsMaps' | Remove-AppxPackage
Get-AppxPackage 'Microsoft.WindowsNotepad' | Remove-AppxPackage
Get-AppxPackage 'Microsoft.Windows.Photos' | Remove-AppxPackage
Get-AppxPackage 'Microsoft.WindowsSoundRecorder' | Remove-AppxPackage
Get-AppxPackage 'Microsoft.Xbox.TCUI' | Remove-AppxPackage
Get-AppxPackage 'Microsoft.XboxApp'
Get-AppxPackage 'Microsoft.XboxGameOverlay' | Remove-AppxPackage
Get-AppxPackage 'Microsoft.XboxGamingOverlay' | Remove-AppxPackage
Get-AppxPackage 'Microsoft.XboxIdentityProvider' | Remove-AppxPackage
Get-AppxPackage 'Microsoft.XboxSpeechToTextOverlay' | Remove-AppxPackage
Get-AppxPackage 'Microsoft.YourPhone' | Remove-AppxPackage
Get-AppxPackage 'Microsoft.ZuneMusic' | Remove-AppxPackage
Get-AppxPackage 'Microsoft.ZuneVideo' | Remove-AppxPackage
winget uninstall Microsoft.GetHelp_8wekyb3d8bbwe
winget uninstall Microsoft.MicrosoftStickyNotes_8wekyb3d8bbwe
winget uninstall Microsoft.WindowsTerminal
winget uninstall Microsoft.Xbox.TCUI_8wekyb3d8bbwe
winget uninstall Microsoft.XboxGameOverlay_8wekyb3d8bbwe
winget uninstall Microsoft.XboxGamingOverlay_8wekyb3d8bbwe
winget uninstall Microsoft.YourPhone_8wekyb3d8bbwe
winget uninstall Microsoft.Todos_8wekyb3d8bbwe
winget uninstall Microsoft.Microsoft.WindowsCalculator_8wekyb3d8bbwe
winget uninstall microsoft.windowscommunicationsapps_8wekyb3d8bbwe


