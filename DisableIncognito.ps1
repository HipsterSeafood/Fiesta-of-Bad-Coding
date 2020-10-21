
#This sript disables incognito in Google Chrome by creating a registry key with a DWORD entry. 
#Designed to work on x64 Windows 10. Cannot promise that it works properly on Win 7 or older versions of Powershell than 5

#Assigns path to the key to chromeRegistry var
$chromeRegistry = "HKLM:\SOFTWARE\Policies\Google\Chrome"
#Tests for path, if it exists, it only creates the DWORD value, if it does not exist, creates the registry key and subsequently the DWORD
if ((Test-path -Path $chromeRegistry) -eq 1) {
    New-ItemProperty -Path $chromeRegistry -Name "IncognitoModeAvailability" -Value 1
}
else {
    New-Item -Path $chromeRegistry | New-ItemProperty -Name "IncognitoModeAvailability" -Value 1
}
