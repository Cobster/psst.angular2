# Load the Psst module
if (-not (Get-Module -Name Psst -ErrorAction SilentlyContinue)) {
    Import-Module Psst
}


Describe "Psst.Angular2 Build" {

    It "Should create a powershell module that can be imported" {
        Invoke-psake -taskList build -parameters @{Version="0.0.0.0"}
        Import-Module "$PSScriptRoot\release\Psst.Angular2"
        (Get-Module -Name Psst.Angular2) -ne $null | Should Be $true
    }

}