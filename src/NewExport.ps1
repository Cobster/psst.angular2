function New-Export
{
    param (
        [string] $Path
    )

    Expand-Template -Template 'export * from "$Path";' -Path $Path
}