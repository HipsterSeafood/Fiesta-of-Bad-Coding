If (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator))
{
  # Relaunch as an elevated process:
  Start-Process powershell.exe "-File",('"{0}"' -f $MyInvocation.MyCommand.Path) -Verb RunAs
  exit
}

$PCName = Read-Host "Enter what you want the PC to be named" 
Rename-Computer -NewName $PCName -Force

$domainName = Read-Host "Enter the Domain Name"
Add-Computer -DomainName $domainName -Credential $domainName\admin -Options JoinWithNewName,AccountCreate -Restart