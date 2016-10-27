function New-AngularFeature
{
    [CmdletBinding()]
    param (
        [System.Management.Automation.PathInfo] $OutputPath = $PWD,
        [string] $Name,
        [switch] $Routing
    )

    $TemplateDir = "$PSScriptRoot\AngularFeature"
    $Excludes = @()

    $Model = @{
        Name = (Get-NamingConventions -Name $Name)
        
        Bundle = @{
            Exports = @()
        }

        Module = @{
            Imports = @()
            Metadata = @{
                Declarations = @()
                Exports = @()
                Imports = @()
                Providers = @()
            }
        }
    }
   
    # Create a new directory to house the feature
    New-Item $Model.Name.Lowercase -ItemType Directory

    # Import NgModule
    $Model.Module.Imports += New-Import -Imports 'NgModule' -Path '@angular/core'
    
    # Import CommonModule
    $Model.Module.Imports += New-Import -Imports @('CommonModule') -Path '@angular/common'
    $Model.Module.Metadata.Imports += "CommonModule"

    # Add the module to the bundle export list
    $Model.Bundle.Exports += New-Export -Path "./$($Model.Name.KebabCase).module" 
    
    if ($Routing) {
        # Add the routing module to the bundle export list
        $Model.Bundle.Exports = New-Export -Path "./$($Model.Name.KebabCase).routing" 

        # Import the routing module and providers
        $Model.Module.Imports += New-Import -Imports @("$($Model.Name)Routing","$($Model.Name)RoutingProviders") -Path "./$($Model.Name.KebabCase).routing"
        $Model.Module.Metadata.Imports += "$($Model.Name)Routing"
        $Model.Module.Metadata.Providers += "$($Model.Name)RoutingProviders"
    } else {
        $Excludes += Join-Path $TemplateDir '$($Model.Name.KebabCase)\$($Model.Name.KebabCase).routing.ts'
    }

    Expand-TemplateDirectory -InputPath $TemplateDir -OutputPath $OutputPath -Model $Model -Exclude $Excludes
}