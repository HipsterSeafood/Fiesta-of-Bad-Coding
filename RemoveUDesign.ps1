
#Boilerplate courtesy of CHawley

$3CTechSupport = "C:\3CTechSupport"

if (test-path -path $3CTechSupport) {$Test3C = "True"}

else {$Test3C = "False"}

If ($Test3C -eq "False"){

New-Item -path "C:\" -name "3CTechSupport" -itemtype "directory"

}


#This section records the value of UAC, as the .exe wont run silently without it disabled

$keylocation = 'Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System'

$key = 'ConsentPromptBehaviorAdmin'

$originalvalue = (get-itemproperty -path $keylocation -name $key).$key

#Sets UAC to disabled

Set-ItemProperty -path $keylocation -name $key -value '0'

#Queries wmi to get GUIDS of all installed applications

$wmiObjects = Get-WmiObject win32_product

#String is a target, name has to match wmi win32_product name
$udesignString = 'UDesign'
$targetProduct = $udesignString

#Finds UDesign GUID from WMI query above

ForEach ($item in $wmiObjects) {

    If ($item.Name -eq $targetProduct) {

        $targetGUID = $item.IdentifyingNumber
    }
}

#Uninstalls UDesign
Start-Process msiexec -ArgumentList "/qn /uninstall $targetGUID" -Wait

#Deletes UDesign Registry entry, because this software is bad and doesn't remove it on uninstall with msiexec
Remove-Item -Path "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\InstallShield_$targetGUID"

#Everything below this is the same as above, but with UConnect, does not have the same issue with Registry that UDesign does
$uconnectString = 'UConnect'
$targetProduct = $uconnectString

ForEach ($item in $wmiObjects) {

    If ($item.Name -eq $targetProduct) {

        $targetGUID = $item.IdentifyingNumber
    }
}

Start-Process msiexec -ArgumentList "/qn /uninstall $targetGUID" -Wait

#puts UAC back to whatever setting it was before

Set-ItemProperty -path $keylocation -name $key -value $originalvalue