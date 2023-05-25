
$UninstallPackages = @(
    '*BytedancePte.Ltd.TikTok*',
    '*Clipchamp.Clipchamp',
    '*Microsoft.549981C3F5F10*',
    '*Microsoft.BingNews'
    '*Microsoft.BingWeather*',
    '*Microsoft.GamingApp*',
    '*Microsoft.GetHelp*',
    '*Microsoft.Getstarted*',
    '*Microsoft.Messaging**',
    '*Microsoft.Microsoft3DViewer*',
    '*Microsoft.MicrosoftJournal*',
    '*Microsoft.MicrosoftOfficeHub*',
    '*Microsoft.MicrosoftSolitaireCollection*',
    '*Microsoft.MicrosoftStickyNotes*',
    '*Microsoft.NetworkSpeedTest*',
    '*Microsoft.Office.Sway*',
    '*Microsoft.OneConnect*',
    '*Microsoft.Paint*',
    '*Microsoft.People*',
    '*Microsoft.PowerAutomateDesktop*',
    '*Microsoft.Print3D*',
    '*Microsoft.RawImageExtension*',
    '*Microsoft.ScreenSketch*',
    '*Microsoft.SecHealthUI*',
    '*Microsoft.SkypeApp*',
    '*Microsoft.Whiteboard*',
    '*Microsoft.Windows.Photos*',
    '*Microsoft.WindowsAlarms*',
    '*Microsoft.WindowsCamera*',
    '*microsoft.windowscommunicationsapps*',
    '*Microsoft.WindowsFeedbackHub*',
    '*Microsoft.WindowsMaps*',
    '*Microsoft.WindowsNotepad*',
    '*Microsoft.WindowsSoundRecorder*',
    '*Microsoft.WindowsTerminal*',
    '*Microsoft.Xbox.TCUI*',
    '*Microsoft.XboxApp*',
    '*Microsoft.XboxGameCallableUI*',
    '*Microsoft.XboxGameOverlay*',
    '*Microsoft.XboxGamingOverlay*',
    '*Microsoft.XboxIdentityProvider*',
    '*Microsoft.XboxSpeechToTextOverlay*',
    '*Microsoft.YourPhone*',
    '*Microsoft.ZuneMusic*',
    '*Microsoft.ZuneVideo*',
    '*MicrosoftCorporationII.QuickAssist*',
    '*MicrosoftTeams*',
    '*OneNoteFreeRetail - en-us*',
    '*EclipseManager*'
    '*ActiproSoftwareLLC*'
    '*AdobeSystemsIncorporated.AdobePhotoshopExpress*'
    '*Duolingo-LearnLanguagesforFree*'
    '*PandoraMediaInc*'
    '*CandyCrush*'
    '*Wunderlist*'
    '*Flipboard*'
    '*Twitter*'
    '*Facebook*'
    '*Spotify*'
)
foreach ($App in $UninstallPackages) {
    Write-Verbose -Message ('Removing Package {0}' -f $App)
    Get-AppxPackage -Name $App | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxPackage -Name $App -AllUsers | Remove-AppxPackage -AllUsers -ErrorAction SilentlyContinue
    Get-AppxProvisionedPackage -Online | Where-Object DisplayName -Like $App | Remove-AppxProvisionedPackage -Online -ErrorAction SilentlyContinue
}

#Removes AppxPackages
#Credit to /u/GavinEke for a modified version of my whitelist code


# "This Computer"-Button starts the explorer on the following path:
# 	LaunchTo	Value	Description
#				1 		Computer (Harddrives, Network, etc.)
#				2 		Fast Access
#				3 		Downloads (The Download-Folder)

Write-Host 'Set Explorers Entry Point'
$LaunchTo = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced'
Set-ItemProperty $LaunchTo LaunchTo -Value 3


Write-Output 'Adding Registry key to prevent bloatware apps from returning'
#Prevents bloatware applications from returning
$registryPath = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent'
If (!(Test-Path $registryPath)) {
    mkdir $registryPath -ErrorAction SilentlyContinue
    New-ItemProperty $registryPath -Name DisableWindowsConsumerFeatures -Value 1 -Verbose -ErrorAction SilentlyContinue
}

#Disables People icon on Taskbar
Write-Output 'Disabling People icon on Taskbar'
$People = 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People'
If (Test-Path $People) {
    Set-ItemProperty $People -Name PeopleBand -Value 0 -Verbose
}


#These are the registry keys that it will delete.

$Keys = @(

    #Remove Background Tasks
    'HKCR:\Extensions\ContractId\Windows.BackgroundTasks\PackageId\46928bounde.EclipseManager_2.2.4.51_neutral__a5h4egax66k6y'
    'HKCR:\Extensions\ContractId\Windows.BackgroundTasks\PackageId\ActiproSoftwareLLC.562882FEEB491_2.6.18.18_neutral__24pqs290vpjk0'
    'HKCR:\Extensions\ContractId\Windows.BackgroundTasks\PackageId\Microsoft.MicrosoftOfficeHub_17.7909.7600.0_x64__8wekyb3d8bbwe'
    'HKCR:\Extensions\ContractId\Windows.BackgroundTasks\PackageId\Microsoft.PPIProjection_10.0.15063.0_neutral_neutral_cw5n1h2txyewy'
    'HKCR:\Extensions\ContractId\Windows.BackgroundTasks\PackageId\Microsoft.XboxGameCallableUI_1000.15063.0.0_neutral_neutral_cw5n1h2txyewy'
    'HKCR:\Extensions\ContractId\Windows.BackgroundTasks\PackageId\Microsoft.XboxGameCallableUI_1000.16299.15.0_neutral_neutral_cw5n1h2txyewy'

    #Windows File
    'HKCR:\Extensions\ContractId\Windows.File\PackageId\ActiproSoftwareLLC.562882FEEB491_2.6.18.18_neutral__24pqs290vpjk0'

    #Registry keys to delete if they aren't uninstalled by RemoveAppXPackage/RemoveAppXProvisionedPackage
    'HKCR:\Extensions\ContractId\Windows.Launch\PackageId\46928bounde.EclipseManager_2.2.4.51_neutral__a5h4egax66k6y'
    'HKCR:\Extensions\ContractId\Windows.Launch\PackageId\ActiproSoftwareLLC.562882FEEB491_2.6.18.18_neutral__24pqs290vpjk0'
    'HKCR:\Extensions\ContractId\Windows.Launch\PackageId\Microsoft.PPIProjection_10.0.15063.0_neutral_neutral_cw5n1h2txyewy'
    'HKCR:\Extensions\ContractId\Windows.Launch\PackageId\Microsoft.XboxGameCallableUI_1000.15063.0.0_neutral_neutral_cw5n1h2txyewy'
    'HKCR:\Extensions\ContractId\Windows.Launch\PackageId\Microsoft.XboxGameCallableUI_1000.16299.15.0_neutral_neutral_cw5n1h2txyewy'

    #Scheduled Tasks to delete
    'HKCR:\Extensions\ContractId\Windows.PreInstalledConfigTask\PackageId\Microsoft.MicrosoftOfficeHub_17.7909.7600.0_x64__8wekyb3d8bbwe'

    #Windows Protocol Keys
    'HKCR:\Extensions\ContractId\Windows.Protocol\PackageId\ActiproSoftwareLLC.562882FEEB491_2.6.18.18_neutral__24pqs290vpjk0'
    'HKCR:\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.PPIProjection_10.0.15063.0_neutral_neutral_cw5n1h2txyewy'
    'HKCR:\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.XboxGameCallableUI_1000.15063.0.0_neutral_neutral_cw5n1h2txyewy'
    'HKCR:\Extensions\ContractId\Windows.Protocol\PackageId\Microsoft.XboxGameCallableUI_1000.16299.15.0_neutral_neutral_cw5n1h2txyewy'

    #Windows Share Target
    'HKCR:\Extensions\ContractId\Windows.ShareTarget\PackageId\ActiproSoftwareLLC.562882FEEB491_2.6.18.18_neutral__24pqs290vpjk0'
)

#This writes the output of each key it is removing and also removes the keys listed above.
ForEach ($Key in $Keys) {
    Write-Output "Removing $Key from registry"
    Remove-Item $Key -Recurse
}


dism /online /Enable-Feature /FeatureName:TelnetClient