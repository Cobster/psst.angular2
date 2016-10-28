Task BuildExamples `
    -depends CleanExamples `
    -requiredVariables ExamplesDir, ModuleName, ReleaseDir `
    -precondition { BuildOutputExists } `
{
    Remove-Module $ModuleName -Force -ErrorAction SilentlyContinue
    Import-Module $ReleaseDir\$ModuleName



    New-AngularApplication -Name Example -OutputPath $ExamplesDir\Application
    
    New-Item $ExamplesDir\Component -ItemType Directory | Out-Null
    New-AngularComponent -Name Example -OutputPath $ExamplesDir\Component -Css -Less -Sass
}