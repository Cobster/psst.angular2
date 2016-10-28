Import-Module $PSScriptRoot\Psst.Angular2.psd1

Describe "New-AngularComponent" {
    $TestDirectory = [IO.Path]::Combine([IO.Path]::GetTempPath(), [IO.Path]::GetRandomFileName())

    BeforeEach {
        New-Item $TestDirectory -ItemType Directory
        Push-Location $TestDirectory
    }

    AfterEach {
        Pop-Location
        Remove-Item $TestDirectory -Force -Recurse
    }

    It "Should create a new typescript file for the component" {
        New-AngularComponent -Name ItemList
        ".\item-list.component.ts" | Should Exist
    }

    It "Should create a new html file for the component" {
        New-AngularComponent -Name ItemList
        ".\item-list.component.html" | Should Exist
    }

    It "Should create a new test file for the component" {
        New-AngularComponent -Name ItemList
        ".\item-list.component.spec.ts" | Should Exist
    }

    # CSS
    It "Should create a 'css' file when -Css switch is set" {
        New-AngularComponent -Name ItemList -Css
        ".\item-list.component.css" | Should Exist
    }

    It "Should not create a 'css' file when -Css switch is not set" {
         New-AngularComponent -Name ItemList
        ".\item-list.component.css" | Should Not Exist
    }

    It "Should include reference to 'css' file in styles metadata when -Css switch is set" {
        New-AngularComponent -Name ItemList -Css
        ".\item-list.component.ts" | Should Contain "styles: \[require\(.*'\.\/item-list\.component\.css'.*\)]"
    }


    # SCSS
    It "Should create a 'scss' files when -Sass switch is set" {
        New-AngularComponent -Name ItemList -Sass
        ".\item-list.component.scss" | Should Exist
    }

    It "Should not create a 'scss' file when -Sass switch is not set" {
         New-AngularComponent -Name ItemList
        ".\item-list.component.scss" | Should Not Exist
    }

    It "Should include reference to 'scss' file in styles metadata when -Css switch is set" {
        New-AngularComponent -Name ItemList -Sass
        ".\item-list.component.ts" | Should Contain "styles: \[require\(.*'\.\/item-list\.component\.scss'.*\)]"
    }

    # LESS
    It "Should create a 'less' file when -Less switch is set" {
        New-AngularComponent -Name ItemList -Less
        ".\item-list.component.less" | Should Exist
    }

    It "Should not create a 'less' file when -Less switch is not set" {
        New-AngularComponent -Name ItemList
        ".\item-list.component.less" | Should Not Exist
    }

    It "Should include reference to 'css' file in styles metadata when -Less switch is set" {
        New-AngularComponent -Name ItemList -Less
        ".\item-list.component.ts" | Should Contain "styles: \[require\(.*'\.\/item-list\.component\.less'.*\)]"
    }
}