$Architectures = @{
	[UInt16] 0 = "x86"
	[UInt16] 1 = "MIPS"
	[UInt16] 2 = "Alpha"
	[UInt16] 3 = "PowerPC"
	[UInt16] 5 = "ARM"
	[UInt16] 6 = "IA64"
	[UInt16] 9 = "x64"
	[UInt16] 12 = "ARM64"
}

$ArchitectureID = (Get-WmiObject Win32_Processor).Architecture

$ArchitectureName = $Architectures[$ArchitectureID]

if( $ArchitectureName -ne $null ){
	$Message = "Architecture : " + $ArchitectureName
} else {
	$Message = "Unknown Architecture ID : " + $ArchitectureID
}

Write-Output ""
Write-Output $Message
Write-Output ""
