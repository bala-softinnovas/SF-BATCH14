import { LightningElement } from 'lwc';

export default class LocalProperties extends LightningElement {
    name; //undefined
    fullName = "Balakrishna";
    age = 30;
    location = {
        city: "Houston",
        country: "United States",
        postalCode: "77056"
    };
    birds = ["Crow", "Swan", "Sparrow", "Peacock"];
}