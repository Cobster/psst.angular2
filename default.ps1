<#

This is a psake build automation script. 

#>


. $PSScriptRoot\build.config.ps1
. $PSScriptRoot\build\tasks.ps1

Task default -depends Build