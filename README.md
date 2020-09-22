### This will upload vhd and create a vm out of that vhd


## Exercise 1: to create the environment

1.  Open [**Cloud Shell**](https://shell.azure.com) pane by selecting on
    the toolbar icon directly to the right of the search textbox.

2.  If prompted, select **Bash** .

> **Note**: If this is the first time you are starting **Cloud Shell** and you are presented with the **You have no storage mounted** message, select the subscription you are using in this lab,  and select **Create storage**.

3.  In the toolbar of the Cloud Shell pane, run the following command to create the vm.

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

> **Note:** This will take approximetaly 6-8 minutes. When finished Hyper-V Console will appear.

6.  In the Virtual Machine Connection window to **2012-R2**, on
    the **License terms** page, select **United Kingdom** and click *Next* to **Accept**.

7.  Set the password of the built-in Administrator account
    to **London2020\*** and select **Finish**.

8.  After Restart, sign in by using the newly set password.

-   Note: Your Guest Vm will be restarted once more automatically and will be ready after this step.



