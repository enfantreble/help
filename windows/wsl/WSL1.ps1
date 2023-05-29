$remoteport = bash.exe -c "ifconfig eth0 | grep 'inet '"
$found = $remoteport -match '\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}';

if ( $found  ) {
  $remoteport = $matches[0];
  Write-Output ""
}
else {
  Write-PSFMessage -Level Output -Message "The Script Exited, the ip address of WSL 2 cannot be found";
  exit;
}
Write-PSFMessage -Level Output -Message "$(wsl.exe systemctl status ssh | grep running) -input xx"

if (($(wsl.exe systemctl status ssh)) -notlike '*running*') {
  Write-PSFMessage -Level Output -Message $(wsl.exe sudo service ssh start)
}

#All the ports you want to forward separated by comma
$ports = @(2222);


#[Static ip]
#You can change the addr to your ip config to listen to a specific address
$addr = '0.0.0.0';
$ports_a = $ports -join ", ";

Write-PSFMessage -Level VeryVerbose -Message 1
#Remove Firewall Exception Rules
Invoke-Expression "Remove-NetFireWallRule -DisplayName 'WSL 2 Firewall Unlock' ";
Write-PSFMessage -Level VeryVerbose -Message 2
#adding Exception Rules for inbound and outbound Rules
Invoke-Expression "New-NetFireWallRule -DisplayName 'WSL 2 Firewall Unlock' -Direction Outbound -LocalPort $ports_a -Action Allow -Protocol TCP";
Write-PSFMessage -Level VeryVerbose -Message 3
Invoke-Expression "New-NetFireWallRule -DisplayName 'WSL 2 Firewall Unlock' -Direction Inbound -LocalPort $ports_a -Action Allow -Protocol TCP";

Write-PSFMessage -Level VeryVerbose -Message 1
for ( $i = 0; $i -lt $ports.length; $i++  ) {
  $port = $ports[$i];
  Invoke-Expression "netsh interface portproxy delete v4tov4 listenport=$port listenaddress=$addr";
  Invoke-Expression "netsh interface portproxy add v4tov4 listenport=$port listenaddress=$addr connectport=$port connectaddress=$remoteport"
}
