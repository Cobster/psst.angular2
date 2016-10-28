. $PSScriptRoot\helpers.ps1
. $PSScriptRoot\settings.ps1

. $PSScriptRoot\build.task.ps1
. $PSScriptRoot\init.task.ps1
. $PSScriptRoot\clean.task.ps1
. $PSScriptRoot\clean-examples.task.ps1
. $PSScriptRoot\update-module-manifest.task.ps1
. $PSScriptRoot\build-impl.task.ps1
. $PSScriptRoot\test.task.ps1
. $PSScriptRoot\publish.task.ps1
. $PSScriptRoot\compress-templates.task.ps1
. $PSScriptRoot\zip-artifacts.task.ps1
. $PSScriptRoot\import.task.ps1
. $PSScriptRoot\install.task.ps1
. $PSScriptRoot\uninstall.task.ps1
. $PSScriptRoot\build-examples.task.ps1

#
# API Key Tasks - These tasks are used to management the PowerShellGallery publishing key.
#
. $PSScriptRoot\remove-api-key.task.ps1
. $PSScriptRoot\store-api-key.task.ps1
. $PSScriptRoot\show-api-key.task.ps1
. $PSScriptRoot\show-full-api-key.task.ps1
