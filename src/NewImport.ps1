function New-Import
{
    param (
        [string[]] $Imports,
        [string] $Path
    )

    $Template = 'import { $([String]::Join(", ", $Imports)) } from "$Path";'

    Expand-Template -Template $Template -Imports $Imports -Path $Path
}