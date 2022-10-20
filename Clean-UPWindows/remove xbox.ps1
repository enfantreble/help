dism /Online /Get-ProvisionedAppxPackages | `
        Select-String PackageName | `
        Select-String xbox | `
        ForEach-Object { $_.Line.Split(':')[1].Trim() } | `
        ForEach-Object { dism /Online /Remove-ProvisionedAppxPackage /PackageName:$_ }



Get-ProvisionedAppxPackage -Online | `
        Where-Object { $_.PackageName -match 'xbox' } | `
        ForEach-Object { Remove-ProvisionedAppxPackage -Online -AllUsers -PackageName $_.PackageName }


iPackage -AllUsers Microsoft.XboxGamingOverlay | Remove-AppxPackage

https://www.thewindowsclub.com/how-to-uninstall-xbox-game-bar-on-windows-pc

winget uninstall Microsoft.GetHelp_8wekyb3d8bbwe
winget uninstall Microsoft.MicrosoftStickyNotes_8wekyb3d8bbwe
winget uninstall Microsoft.WindowsTerminal
winget uninstall Microsoft.Xbox.TCUI_8wekyb3d8bbwe
winget uninstall Microsoft.XboxGameOverlay_8wekyb3d8bbwe
winget uninstall Microsoft.XboxGamingOverlay_8wekyb3d8bbwe
winget uninstall Microsoft.YourPhone_8wekyb3d8bbwe
winget uninstall microsoft.windowscommunicationsapps_8wekyb3d8bbwe

Get-AppxProvisionedPackage –Online | Where-Object { $_.packagename –like 'PackageName' } | Remove-AppxProvisionedPackage –Online
Get-AppxProvisionedPackage –Online | Where-Object { $_.packagename –like '*Notepad*' } | Remove-AppxProvisionedPackage –Online
Get-AppxProvisionedPackage –Online | Where-Object { $_.packagename –like '*Maps*' } | Remove-AppxProvisionedPackage –Online
Get-AppxProvisionedPackage –Online | Where-Object { $_.packagename –like '*Maps*' } | Remove-AppxProvisionedPackage –Online
Get-AppxProvisionedPackage –Online | Where-Object { $_.packagename –like '*Windows.Photos*' } | Remove-AppxProvisionedPackage –Online
Get-AppxProvisionedPackage –Online | Where-Object { $_.packagename –like '*MicrosoftStickyNotes*' } | Remove-AppxProvisionedPackage –Online
Get-AppxProvisionedPackage –Online | Where-Object { $_.packagename –like '*ToDos*' } | Remove-AppxProvisionedPackage –Online
Get-AppxProvisionedPackage –Online | Where-Object { $_.packagename –like '*People*' } | Remove-AppxProvisionedPackage –Online
Get-AppxProvisionedPackage –Online | Where-Object { $_.packagename –like '*Paint*' } | Remove-AppxProvisionedPackage –Online
Get-AppxProvisionedPackage –Online | Where-Object { $_.packagename –like '*Bing*' } | Remove-AppxProvisionedPackage –Online
Get-AppxProvisionedPackage –Online | Where-Object { $_.packagename –like '*Get*' } | Remove-AppxProvisionedPackage –Online
Get-AppxProvisionedPackage –Online | Where-Object { $_.packagename –like '*ScreenSketch*' } | Remove-AppxProvisionedPackage –Online
Get-AppxProvisionedPackage –Online | Where-Object { $_.packagename –like '*MicrosoftOfficeHub*' } | Remove-AppxProvisionedPackage –Online
Get-AppxProvisionedPackage –Online | Where-Object { $_.packagename –like '*.MicrosoftSolitaireCollection*' } | Remove-AppxProvisionedPackage –Online