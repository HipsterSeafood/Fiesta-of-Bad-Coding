#Installs agent on workstations specified in a text file located in the same directory as this script
#Computers in text document should be comma delimited, document should be named "computerlist.txt"
#psexec.exe must be located in the same directory as this script as well

.\psexec.exe @computerlist.txt