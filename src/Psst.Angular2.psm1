
$ModuleData = Import-PowerShellDataFile "$PSScriptRoot\Psst.Angular2.psd1"

# Dot source the generator functions here

Export-ModuleMember -Function *-*