Set-NetFirewallProfile -Enabled False

Set-Service W32Time -StartupType Automatic
w32tm /config /syncfromflags:manual /manualpeerlist:"time.windows.com"
w32tm /config /reliable:yes
net start w32time

Set-TimeZone "GMT Standard Time"


cd\
mkdir SC

$url1 = "https://raw.githubusercontent.com/cemvarol/Upload-N-Create/master/SetHost"
$output1 = "C:\SC\1-SetHost.ps1"
Invoke-WebRequest -Uri $url1 -OutFile $output1

$url2 = "https://raw.githubusercontent.com/cemvarol/Upload-N-Create/master/vhd%26chrome.ps1"
$output2 = "C:\SC\2-VhdsNChrome.ps1"
Invoke-WebRequest -Uri $url2 -OutFile $output2

$url3 = "https://raw.githubusercontent.com/cemvarol/Upload-N-Create/master/CreateStartVM.ps1"
$output3 = "C:\SC\3-CreateVMs.ps1"
Invoke-WebRequest -Uri $url3 -OutFile $output3

Start-Sleep -s 3

Start-Process Powershell.exe -Argumentlist "-file C:\SC\1-SetHost.ps1"

#Start-Sleep -s 90
#Start-Process Powershell.exe -Argumentlist "-file C:\SC\2-VhdsNChrome.ps1"
#Start-Sleep -s 360
#Start-Process Powershell.exe -Argumentlist "-file C:\SC\3-CreateVMs.ps1"
