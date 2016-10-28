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
        [string] $OutputPath = $pwd,
        [switch] $Css,
        [switch] $Less,
        [switch] $Sass
    )

    $Model = @{
        Name = (Get-NamingConventions -Name $Name)
        Styles = @();
        TemplateDir = "$PSScriptRoot\AngularComponent"
    }

    $Excludes = @();

    if (-not $Css) {
        $Excludes += "$($Model.TemplateDir)\`$(`$Model.Name.KebabCase).component.css"
    }
    else {
        $Model.Styles += "'./$($Model.Name.KebabCase).component.css'"
    }

    if (-not $Less) {
        $Excludes += "$($Model.TemplateDir)\`$(`$Model.Name.KebabCase).component.less"
    }
    else {
        $Model.Styles += "'./$($Model.Name.KebabCase).component.less'"
    }
    
    if (-not $Sass) {
        $Excludes += "$($Model.TemplateDir)\`$(`$Model.Name.KebabCase).component.scss"
    } 
    else {
        $Model.Styles += "'./$($Model.Name.KebabCase).component.scss'"
    }

    Expand-TemplateDirectory -InputPath $Model.TemplateDir -OutputPath $OutputPath -Model $Model -Exclude $Excludes
}