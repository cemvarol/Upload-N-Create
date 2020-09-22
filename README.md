### This will upload vhd and create a vm out of that vhd


## Exercise 1: to create the environment

```sh
curl -O https://raw.githubusercontent.com/cemvarol/Upload-N-Create/master/Resources.bash
ls -la Resources.bash
chmod +x Resources.bash
./Resources.bash
```


## Exercise 2: Create a VM to migrate to Azure

### Task 1: Configure nested virtualization in the Azure VM

1.  Select **Virtual machines** and, on the **Virtual machines** blade,
    select **Migrator**.

2.  Select **Networking**.

3.  Select **Connect**, in the drop-down menu, select **RDP**, and then
    click **Download RDP File**.

4.  When prompted, sign in with the following credentials:

-   User Name: **QA**

-   Password: **1q2w3e4r5t6y\***

> **Important Note:** All the actions you will follow including this step
    will be done on this Remote Computer's Console.

5.  Within the Remote Desktop session run the following command in
    **PowerShell** to create the guest vm to protect.
    

```Powershell
cd\
mkdir Lab03
$url = "https://raw.githubusercontent.com/cemvarol/AZ-304-Labs/master/Lab-03/SetLab.ps1"
$output = "C:\Lab03\Lab03.ps1"
Invoke-WebRequest -Uri $url -OutFile $output
Start-Process Powershell.exe -Argumentlist "-file C:\Lab03\Lab03.ps1"
```

