import { LightningElement } from 'lwc';
import PRODUCT_OBJECT from '@salesforce/schema/EcommerceProduct__c';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class RecordFormProduct extends LightningElement {
    objectName = PRODUCT_OBJECT;
    recordId = "a052w00000GajDCAAZ";

    successHandler() {
        const evt = new ShowToastEvent({
            title: "Success",
            message: "Ecommerce Product details have been saved successfully!",
            variant: "success"
        });
        this.dispatchEvent(evt);
    }
}