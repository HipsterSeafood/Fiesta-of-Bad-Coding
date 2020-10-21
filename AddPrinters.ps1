
$serverName = $env:LOGONSERVER -replace "\\",""
$printerInfo = Get-Printer -ComputerName $serverName
$printerName = $printerInfo.Name
$printArray = $printerName -split '\n'

foreach ($printer in $printArray) {
    Add-Printer -ConnectionName "\\$serverName\$printer"
}

$installedPrinters = Get-WmiObject -ClassName Win32_Printer
Write-Host $installedPrinters.Name