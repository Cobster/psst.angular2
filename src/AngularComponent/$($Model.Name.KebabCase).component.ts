import { Component, OnInit } from '@angular/core';

@Component({
    selector: '$Selector',
    template: require('./$($Model.Name.KebabCase).component.html'),
    styles: [require($($Model.Styles))]
})
export class $($Model.Name)Component implements OnInit {

    constructor() { }

    ngOnInit {

    }

}