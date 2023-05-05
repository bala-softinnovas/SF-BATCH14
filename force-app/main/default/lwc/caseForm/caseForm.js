import { LightningElement } from 'lwc';
import CASE_OBJECT from '@salesforce/schema/Case';
import SUBJECT_FIELD from '@salesforce/schema/Case.Subject';
import PRIORITY_FIELD from '@salesforce/schema/Case.Priority';
import STATUS_FIELD from '@salesforce/schema/Case.Status';
import DESC_FIELD from '@salesforce/schema/Case.Description';
import ORIGIN_FIELD from '@salesforce/schema/Case.Origin';
import ACCOUNT_FIELD from '@salesforce/schema/Case.AccountId';
import CONTACT_FIELD from '@salesforce/schema/Case.ContactId';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class CaseForm extends LightningElement {
    objectName = CASE_OBJECT;
    recordId = "5002w00000hZIhNAAW";
    fields = {
        subject: SUBJECT_FIELD,
        priority: PRIORITY_FIELD,
        status: STATUS_FIELD,
        desc: DESC_FIELD,
        origin: ORIGIN_FIELD,
        account: ACCOUNT_FIELD,
        contact: CONTACT_FIELD
    };

    successHandler() {
        const evt = new ShowToastEvent({
            title: "Success",
            message: "Case information has been saved successfully!",
            variant: "success"
        });
        this.dispatchEvent(evt);
    }
}