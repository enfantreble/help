function Download-AppxPackage {
  process {
    $Uri="https://www.microsoft.com/p/dynamic-theme/9nblggh1zbkw"
	$Path=$env:temp+"\uwp"
    If (!(test-Path $Path))
	{
		New-Item -ItemType Directory -Force -Path $Path
	}
    #Get Urls to download
    $WebResponse = Invoke-WebRequest -UseBasicParsing -Method 'POST' -Uri 'https://store.rg-adguard.net/api/GetFiles' -Body "type=url&url=$Uri&ring=Retail" -ContentType 'application/x-www-form-urlencoded'
    $LinksMatch = $WebResponse.Links | where {$_ -like '*.appx*'} | where {$_ -like '*_neutral_*' -or $_ -like "*_"+$env:PROCESSOR_ARCHITECTURE.Replace("AMD","X").Replace("IA","X")+"_*"} | Select-String -Pattern '(?<=a href=").+(?=" r)'
    $DownloadLinks = $LinksMatch.matches.value 

    function Resolve-NameConflict{
    #Accepts Path to a FILE and changes it so there are no name conflicts
    param(
    [string]$Path
    )
        $newPath = $Path
        if(Test-Path $Path){
            $i = 0;
            $item = (Get-Item $Path)
            while(Test-Path $newPath -and $i -lt 2){
                $i += 1;
                $newPath = Join-Path $item.DirectoryName ($item.BaseName+"($i)"+$item.Extension)
            }
        }
        return $newPath
    }
    #Download Urls
    foreach($url in $DownloadLinks){
        $FileRequest = Invoke-WebRequest -Uri $url -UseBasicParsing #-Method Head
        $FileName = ($FileRequest.Headers["Content-Disposition"] | Select-String -Pattern  '(?<=filename=).+').matches.value
        $FilePath = Join-Path $Path $FileName; #$FilePath = Resolve-NameConflict($FilePath)
		If (!(test-Path $FilePath))
		{
			continue
		}		
        [System.IO.File]::WriteAllBytes($FilePath, $FileRequest.content)
        echo $FilePath
    }
  }
}


foreach ($line in Get-Content .\uwp.list) {
	$fullPackageName=($line -replace '\s+', ',').split(",")[1]
	Download-AppxPackage $fullPackageName
	}
