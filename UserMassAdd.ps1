#THIS SCRIPT ONLY WORKS RUNNING ON THE DC WITH AN ADMINISTRATOR ACCOUNT

#HASH TABLE OF PC NUMBERS AND USER NAMES

$PCNamesAndUsers = @{
    "10" = "PAN";
    "11" = "PAN";
    "12" = "SCANX";
    "13" = "IO";
    "14" = "XRAY";
    "20" = "OP";
    "21" = "HYG";
    "22" = "TREATMENT";
    "23" = "SURGERY";
    "24" = "TC";
    "25" = "LAB";
    "26" = "STERI";
    "27" = "DROP";
    "28" = "SOP";
    "40" = "CHECKOUT";
    "41" = "CHECKIN";
    "42" = "FRONTDESK";
    "43" = "FASTCHECKIN";
    "44" = "KIOSK";
    "45" = "BACKRECEPTION";
    "46" = "RECEPTION";
    "50" = "DOCTOR";
    "51" = "BILLING";
    "52" = "FINANCIAL";
    "53" = "CONSULT";
    "54" = "ADMIN";
    "55" = "OFFICE";
    "56" = "OM";
    "57" = "REMOTE";
    "60" = "LT";
    "61" = "DRLT";
    "62" = "CLLT";
    "63" = "TABLET";
    "71" = "STAFFLOUNGE";
    "72" = "VM";
    "73" = "HALLWAY";
    "74" = "CONFERENCEROOM";
    "75" = "HOME";
    "76" = "BASEMENT";
}

#Get Active Directory Information
$ADInfo = Get-ADDomain
#Get Computer container from Active Directory Info
$PCContainer = $ADInfo.ComputersContainer
#Retrieve PC's from Active Directory
$PCNames = Get-ADComputer -SearchBase $PCContainer -Filter 'Name -like "*"'
#Iteration through each PC pulled
ForEach ($PC in $PCNames){
    #Split PC name at '-'
    $SplitName = $PC.Name.Split('-',3)
    #Access third split value and split into substrings, one for the PC Type and the other for the PC Number
    $PCType = $SplitName[2].substring(0,2)
    $PCNum = $SplitName[2].substring(2,2)
    #Concatenates info from above to add new users based on PC Type and PC Number
    $FullPCName = $PCNamesAndUsers.$PCType + $PCNum
    New-ADUser -Name $FullPCName -GivenName $FullPCName -CannotChangePassword $True -PasswordNeverExpires $True -Enabled $True -PasswordNotRequired $True
    .\psexec.exe \\$PC -acceptlua -d -s Add-LocalGroupMember -Group "Administrators" -Member "$ADInfo.Name\$FullPCName"
    Write-Host $FullPCName

}