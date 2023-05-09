import { LightningElement } from 'lwc';

export default class CreateRecordProduct extends LightningElement {

    changeHandler(event) {

    }

    cancelHandler() {

    }

    saveHandler() {
        
    }

    get brandOptions() {
        return [
            {label: "Samsung", value: "Samsung"},
            {label: "Apple", value: "Apple"},
            {label: "Blackberry", value: "Blackberry"},
            {label: "Nokia", value: "Nokia"}
        ];
    }

    get categoryOptions() {
        return [
            {label: "Smartphones", value: "Smartphones"},
            {label: "Tablets", value: "Tablets"},
            {label: "Refrigeratos", value: "Refrigeratos"},
            {label: "Air Conditioners", value: "Air Conditioners"},
            {label: "Smart Watches", value: "Smart Watches"},
            {label: "Head Phones", value: "Head Phones"}
        ];
    }
}