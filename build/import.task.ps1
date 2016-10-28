#
# IMPORT 
#
Task "Import" `
    -description "Imports the module under development into the current powershell session" `
    -requiredVariables ModuleName, OutputDir `
    -precondition { BuildOutputExists } `
{
    if ($null -ne (Get-Module -Name $ModuleName)) {
        Write-Host "Removing $ModuleName"
        Remove-Module $ModuleName
    } 

    $ImportPath = (Resolve-Path $OutputDir)
    Write-Host "Importing $ModuleName from $ImportPath"
    Import-Module $ImportPath
}