#
# COMPRESS
#
Task ZipArtifacts `
    -description "This compresses the release module into a zip file for archival." `
    -requiredVariables OutputDir, Version `
    -precondition { BuildOutputExists } `
{
    Write-Verbose "$OutputDir-$Version.zip"
    Compress-Archive $OutputDir -DestinationPath "$OutputDir-$Version.zip" -Verbose:$VerbosePreference
}