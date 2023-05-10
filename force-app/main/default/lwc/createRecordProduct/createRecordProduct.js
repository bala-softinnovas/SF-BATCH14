import { LightningElement } from 'lwc';
import PRODUCT_OBJECT from '@salesforce/schema/EcommerceProduct__c';
import { createRecord } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class CreateRecordProduct extends LightningElement {
    formdata = {};

    changeHandler(event) {
        this.formdata[event.target.name] = event.target.value;
    }

    cancelHandler() {
        this.template.querySelector('form.productform').reset();
        this.template.querySelector('lightning-combobox').value = undefined;
    }

    saveHandler() {
        //prepare recordInput
        const recordInput = {
            apiName: PRODUCT_OBJECT.objectApiName,
            fields: this.formdata
        };

        //create record
        createRecord(recordInput)
        .then(result => {
            const toast = new ShowToastEvent({
                title: "Success",
                message: "product record has been created successfully!",
                variant: "success"
            });
            this.dispatchEvent(toast);
        })
        .catch(error => {
            console.error(error);
            const toast = new ShowToastEvent({
                title: error.detail.message,
                message: error.detail.detail,
                variant: "error"
            });
            this.dispatchEvent(toast);
        })
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