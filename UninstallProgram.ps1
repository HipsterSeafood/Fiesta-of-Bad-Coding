#This script takes a user input program name (has to match wmi win32_product name) and will uninstall software and also search for Install Shield registry keys left in Registry
#Kind of designed to mass uninstall software from computers, but can used to silently remove a software from a computer if it in use
#Query wmi for all installed programs

$wmiObjects = Get-WmiObject win32_product

#creates a target product based on input variable productInputArg. This can be injected from another software or set to take user input with little editing
$productInputArg = 'UDesign'
$targetProduct = $productInputArg

#Loops through wmiObjects and gets target product, assigns MSI GUID to tagertGUID variable

ForEach ($item in $wmiObjects) {

    If ($item.Name -eq $targetProduct) {

        $targetGUID = $item.IdentifyingNumber
    }
}

#Uninstalls MSI package using msiexec based on targetGUID, uses quiet uinstall to prompt for no user input

Start-Process msiexec -ArgumentList "/qn /uninstall $targetGUID" -Wait

#Removes Install Shield registry key entry if it does exist

Remove-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall" -Name "InstallShield_$targetGUID"