$Architectures = @{
	[UInt16] 0 = "x86"
	[UInt16] 1 = "MIPS"
	[UInt16] 2 = "Alpha"
	[UInt16] 3 = "PowerPC"
	[UInt16] 5 = "ARM"
	[UInt16] 6 = "IA64(Itanium)"
	[UInt16] 9 = "x64"
	[UInt16] 12 = "ARM64"
}

$WMI = Get-WmiObject Win32_Processor
$ArchitectureID = $WMI.Architecture
$CPUName = "CPU Name : " + @($WMI.Name)[0]

$ArchitectureName = $Architectures[$ArchitectureID]

if( $ArchitectureName -ne $null ){
	$Architecture = "Architecture : " + $ArchitectureName
} else {
	$Architecture = "Unknown Architecture ID : " + $ArchitectureID
}

Write-Output ""
Write-Output $Architecture
Write-Output $CPUName
Write-Output ""
