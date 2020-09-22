### This will upload vhd and create a vm out of that vhd


## Exercise 1: Create the environment

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
mkdir Lab
$url = "https://raw.githubusercontent.com/cemvarol/Upload-N-Create/master/SetLab.ps1"
$output = "C:\Lab\Lab.ps1"
Invoke-WebRequest -Uri $url -OutFile $output
Start-Process Powershell.exe -Argumentlist "-file C:\Lab\Lab.ps1"
```

> **Note:** This will take approximetaly 6-8 minutes. When finished Hyper-V Console will appear.

6.  In the Virtual Machine Connection window to **2012-R2**, on
    the **License terms** page, select **United Kingdom** and click *Next* to **Accept**.

7.  Set the password of the built-in Administrator account
    to **London2020\*** and select **Finish**.

8.  After Restart, sign in by using the newly set password.

-   Note: Your Guest Vm will be restarted once more automatically and will be ready after this step.


### Task 2: Check the output

1.  Go back to Azure portal and navigate to newly created Resource Group. Click the Traffic Manager **Lab-03-TM**
2.  On the overview page you will see 2 Endpoints. Ensure that Onprem is Online, and Migrated is Degraded.
       
    | Name | Status | Monitor Status |
    | --- | --- |--- |
    | Onprem | Enabled | **Online**|
    |Migrated | Enabled |**Degraded**|
    
2.  Copy the **DNS Name** and visit that URL on a new tab on your browser
3.  Ensure that the page welcomes you with the current date

> **Note:** If fails please ask for support, this will be needed for the next exercises.

> #### Result: We created a server hosting 2012-R2 VM. This vm is published to internet with its dns name and that name is behind a Traffic Manager. When a client visits the Traffic Manager URL, they will be diverted to use the 2012-R2 guest vm on the on-prem host.When the Lab completed, 2012-R2 VM will be migrated to Azure and Traffic Manager will show vise-versa, but the page will be still available.


## Exercise 3: Configure the VM for migration

### Task 1: Prepare the Host

1.  Install [**AZ-Copy**](https://docs.microsoft.com/en-us/azure/storage/common/storage-use-azcopy-v10)
    >**Note:** Please extract AZ-Copy under C:\vms folder
1.  Install [**Azure Powershell**](https://docs.microsoft.com/en-us/powershell/azure/install-Az-ps?view=azps-4.3.0#code-try-1)

### Task 1: Prepare the Guest
1.  After *Host* is ready, time to prepare the guest.
1.  [**Sysprep**](https://docs.microsoft.com/en-us/azure/virtual-machines/windows/upload-generalized-managed#generalize-the-source-vm-by-using-sysprep) and shutdown the VM.
    >**Note:** Choose the option *Generalize*
    


