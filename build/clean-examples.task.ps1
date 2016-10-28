Task CleanExamples `
    -description "Deletes the contents of the examples directory." `
    -requiredVariables ExamplesDir `
{
    if (Test-Path $ExamplesDir) {
        Remove-Item $ExamplesDir -Force -Recurse -Verbose:$VerbosePreference
    }
}