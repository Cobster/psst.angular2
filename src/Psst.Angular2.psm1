$PsstTemplateRoot = "$PSScriptRoot\templates"
$Psst = Import-PowerShellDataFile "$PSScriptRoot\Psst.Angular2.psd1"
$ModuleData = Import-PowerShellDataFile "$PSScriptRoot\Psst.Angular2.psd1"

# Dot source the generator functions here
. $PSScriptRoot\NewExport.ps1
. $PSScriptRoot\NewImport.ps1

. $PSScriptRoot\NewAngularApplication.ps1
. $PSScriptRoot\NewAngularComponent.ps1
. $PSScriptRoot\NewAngularFeature.ps1
. $PSScriptRoot\NewAngularService.ps1

Export-ModuleMember -Function *-*