### This will upload vhd and create a vm out of that vhd


## Step 1 to create the environment

```sh
curl -O https://raw.githubusercontent.com/cemvarol/Upload-N-Create/master/Resources.bash
ls -la Resources.bash
chmod +x Resources.bash
./Resources.bash
```


## Step 2 Create a VM to migrate to Azure

```Powershell
cd\
mkdir Lab03
$url = "https://raw.githubusercontent.com/cemvarol/AZ-304-Labs/master/Lab-03/SetLab.ps1"
$output = "C:\Lab03\Lab03.ps1"
Invoke-WebRequest -Uri $url -OutFile $output
Start-Process Powershell.exe -Argumentlist "-file C:\Lab03\Lab03.ps1"
```

