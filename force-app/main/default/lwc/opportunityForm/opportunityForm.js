import { getObjectInfo, getPicklistValuesByRecordType } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';
import OPPORTUNITY_OBJECT from '@salesforce/schema/Opportunity';

export default class OpportunityForm extends LightningElement {
    oppName;
    selectedType;
    selectedStage;
    typeOptions = [];
    stageOptions = [];

    changeHandler(event) {
        const elem = event.target.label;
        if(elem === "Opportunity Name") {
            this.oppName = event.target.value;
        } else if(elem === "Opportunity Type") {
            this.selectedType = event.target.value;
        } else {
            this.selectedStage = event.target.value;
        }
    }

    @wire(getObjectInfo, {objectApiName: OPPORTUNITY_OBJECT})
    oppInfo;

    @wire(getPicklistValuesByRecordType, {
        objectApiName: OPPORTUNITY_OBJECT, 
        recordTypeId: '$oppInfo.data.defaultRecordTypeId'
    }) picklistHandler({data, error}) {
        if(data) {
            console.log(data);
            this.typeOptions = data.picklistFieldValues.Type.values;
            this.stageOptions = data.picklistFieldValues.StageName.values;
        }
        if(error) {
            console.error(error);
        }
    }
}