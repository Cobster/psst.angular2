Properties {
    
    $Authors = "$env:USERNAME","and contributors"

    $SrcDir = "$PSScriptRoot\src"
    $TestDir = "$PSScriptRoot"
    $ExamplesDir = "$PSScriptRoot\examples"
    $TestResults = "PesterTestResults.xml"

    # This should match the name of the PSD1 file for the module.
    $ModuleName = "Psst.Angular2"

    $ReleaseDir = "$PSScriptRoot\release"
    $OutputDir = "$ReleaseDir\$ModuleName"
    $Exclude = @("*.Tests.ps1")

    $LocalModuleDataDir = "$env:LOCALAPPDATA\$ModuleName"
    $TemplateCacheDir = "$LocalModuleDataDir \$Version"  
    $TemplateCache = "$LocalModuleDataDir\$Version"
    $ReleaseNotes = ""

    $SettingsPath = "$LocalModuleDataDir\SecuredBuildSettings.clixml"

    $NoBuildOutputErrorMessage = "There is no build output. Run psake build."
    $TestFailureMessage = "One or more tests failed, build will not continue."

    $NuGetApiKey = $null
    $PublishRepository = $null
}

# Executes 
Task BuildExamples