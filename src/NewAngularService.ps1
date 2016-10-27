function New-AngularService {
<#

.PARAMETER Http
    This flag indicates that the service is dependent on the Angular Http service.
#>
    param (
        [System.Management.Automation.PathInfo] $OutputPath = $PWD,
        [string] $Name,
        [switch] $Http
    )

    $TemplateDir = "$PSScriptRoot\AngularService"

    $Model = @{
        Name = (Get-NamingConventions $Name)
        Imports = @()
        Constructor = @{
            Arguments = @()
        }
    }

    $Model.Imports += New-Import -Imports @('Injectable') -Path '@angular/core' 

    if ($Http) {
        $Model.Imports += New-Import -Imports Http -Path '@angular/http'
        $Model.Constructor.Arguments += "private http: Http"
    }

    Expand-TemplateDirectory -InputPath $TemplateDir -OutputPath $OutputPath -Model $Model
}