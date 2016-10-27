<#

.SYNOPSIS
    Creates a set of artifacts that comprise an Angular2 component.

.DESCRIPTION
    This function will scaffold an Angular 2 component.  It creates a typescript file for the component code, 
    an html file for the component template, an optional style file which can be css, sass, or less. This also
    creates a typescript file for a testing the component with jasmine. 

.PARAMETER Name
    The name of the angular component that will be created.

.PARAMETER Selector
    The selector to use for the component.  

.PARAMETER Styles
    The type of styling file to create. Specified as 'css', 'sass', or 'less'.
    
#>
function New-AngularComponent {

    param (
        [Parameter(Mandatory = $true)]
        [string] $Name,
        [string] $Selector,
        [string] $Styles,
        [string] $OutputPath = $pwd
    )

    $Model = @{
        Name = (Get-NamingConventions -Name $Name)
        Metadata = @()
    }

    $__Name = Get-NamingConventions -Name $Name

    $Stereotype = "component"
    $TypescriptExtension = "ts"
    $TestExtension = "spec.ts"
    $HtmlExtension = "html"
    $TemplateDir = "$PSScriptRoot\templates\angular2\component"

    # Add the 'selector' to the component decorator metadata
    if (-not ([String]::IsNullOrWhitespace($Selector))) {
        $Model.Metadata += Expand-Template -InputFile "$TemplateDir\component.metadata.selector.ts" `
            -Selector $Selector -Name $Model.Name -Stereotype $Stereotype -Extension $TypescriptExtension
    }

    # Add the 'template' component decorator metadata
    $Model.Metadata += Expand-Template -InputFile "$TemplateDir\component.metadata.template.ts" `
        -Name $Model.Name -Stereotype $Stereotype -Extension $TypescriptExtension
    
    # Add a style file and 'styles' to the component decorator metadata
    if (-not [String]::IsNullOrWhiteSpace($Styles)) {

        $StylesExtension = $Styles.ToLower()
        if ($StylesExtension -eq 'sass') {
            $StylesExtension = 'scss'
        }

        $Model.Metadata += Expand-Template -InputFile "$TemplateDir\component.metadata.styles.ts" `
            -Name $__Name -Extension $StylesExtension -Sterotype $Stereotype

        Expand-Template -InputFile "$TemplateDir\component.styles" `
            -OutputFile "$pwd\$($__Name.KebabCase).$Stereotype.$StylesExtension"
             
    }
    
    # Expand-Template -InputFile "$TemplateDir\component.ts" `
    #     -OutputFile "$pwd\$($__Name.KebabCase).$Stereotype.$TypescriptExtension" `
    #     -Model $Model 
                  
    # Expand-Template -InputFile "$TemplateDir\component.html" `
    #     -Model $Model `
    #     -OutputFile "$pwd\$($__Name.KebabCase).$Stereotype.$HtmlExtension"

    # Expand-Template -InputFile "$TemplateDir\component.spec.ts" `
    #     -Model $Model `
    #     -OutputFile "$pwd\$($__Name.KebabCase).$Stereotype.$TestExtension"

    $TemplateDir = "$PSScriptRoot\AngularComponent"

    Expand-TemplateDirectory -InputPath $TemplateDir -OutputPath $OutputPath -Model $Model
}