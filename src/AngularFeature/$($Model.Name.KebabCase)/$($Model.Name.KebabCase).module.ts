$([String]::Join("`r`n", $Model.Module.Imports))

@NgModule({
    declarations: [
        $([String]::Join(",`r`n`t`t", $Model.Module.Metadata.Declarations))
    ],
    exports: [
        $([String]::Join(",`r`n`t`t", $Model.Module.Metadata.Exports))
    ],
    imports: [
        $([String]::Join(",`r`n`t`t", $Model.Module.Metadata.Imports))
    ],
    providers: [
        $([String]::Join(",`r`n`t`t", $Model.Module.Metadata.Providers))
    ]
})
export class $($Model.Name)Module { }