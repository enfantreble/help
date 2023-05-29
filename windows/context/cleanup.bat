REM Clear Taskbar Pins and SendTo and Recent Places
DEL /F /S /Q /A "%AppData%\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\*"
DEL /F /S /Q /A "%APPDATA%\Microsoft\Windows\SendTo\*"
REG DELETE HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband /F
del "%USERPROFILE%\Links\RecentPlaces.lnk"
taskkill /f /im explorer.exe
start explorer.exe


REM Clear RightClick->New members
reg delete HKCR\.bmp\ShellNew /f
reg delete HKCR\.rtf\ShellNew /f
reg delete HKCR\.trc\ShellNew /f
reg delete HKCR\.lnk\ShellNew /f
reg delete HKCR\Briefcase\ShellNew /f
reg delete HKCR\.contact\ShellNew /f
reg delete HKCR\.zip\CompressedFolder\ShellNew /f


REM Disable Share With from RightClick
reg delete "HKCR\*\shellex\ContextMenuHandlers\Sharing" /f
reg delete "HKCR\Directory\Background\shellex\ContextMenuHandlers\Sharing" /f
reg delete "HKCR\Directory\shellex\ContextMenuHandlers\Sharing" /f
reg delete "HKCR\Drive\shellex\ContextMenuHandlers\Sharing" /f
reg delete "HKCR\LibraryFolder\background\shellex\ContextMenuHandlers\Sharing" /f
reg delete "HKCR\UserLibraryFolder\shellex\ContextMenuHandlers\Sharing" /f

REM Remove Print from RightClick Menu
reg delete HKLM\SOFTWARE\Classes\InternetShortcut\shell\print /f
reg delete HKCR\AcroExch.Document.7\shell\print /f
reg delete HKCR\FoxitReader.Document\shell\print /f
reg delete HKCR\SystemFileAssociations\image\shell\print /f
reg delete HKCR\SystemFileAssociations\text\shell\print /f
reg delete HKCR\batfile\shell\print /f
reg delete HKCR\cmdfile\shell\print /f
reg delete HKCR\docfile\shell\print /f
reg delete HKCR\fonfile\shell\print /f
reg delete HKCR\htmlfile\shell\print /f
reg delete HKCR\inffile\shell\print /f
reg delete HKCR\inifile\shell\print /f
reg delete HKCR\JSEFile\shell\print /f
reg delete HKCR\JSFile\shell\print /f
reg delete HKCR\MSInfo.Document\shell\print /f
reg delete HKCR\otffile\shell\print /f
reg delete HKCR\pfmfile\shell\print /f
reg delete HKCR\regfile\shell\print /f
reg delete HKCR\rtffile\shell\print /f
reg delete HKCR\ttcfile\shell\print /f
reg delete HKCR\txtfile\shell\print /f
reg delete HKCR\VBEfile\shell\print /f
reg delete HKCR\VBSfile\shell\print /f
reg delete HKCR\Wordpad.Document.1\shell\print /f
reg delete HKCR\WPEDoc\shell\print /f
reg delete HKCR\WPSDoc\shell\print /f
reg delete HKCR\wrifile\shell\print /f
reg delete HKCR\WSFFile\shell\print /f


REM Enable Open With Sublime Text
reg add "HKCR\*\shell\Open With Sublime" /f /v "Icon" /t REG_SZ /d "C:\\sublime_text_3\\sublime_text.exe"
reg add "HKCR\*\shell\Open With Sublime\command" /f /ve /d "c:\\Users\lucac\\scoop\\apps\\notepadplusplus\\current\\notepad++.exe %1"