import { LightningElement } from 'lwc';

export default class QuerySelectors extends LightningElement {

    fruits = ["Banana", "Apple", "Pomogrante", "Mango"];

    clickHandler() {
        //querySelector demo
        const h1elem = this.template.querySelector('h1');
        console.log(h1elem.innerText);
        h1elem.style.color = "#16631b";
        h1elem.style.border = "2px solid red";
        h1elem.style.backgroundColor = "#f4f73b";

        const pelem = this.template.querySelector('p');
        console.log(pelem.innerText);
        pelem.style.color = "white";
        pelem.style.backgroundColor = "grey";
        pelem.style.border = "2px solid yellow";

        //querySelectorAll demo
        const divelems = this.template.querySelectorAll('div.child');
        divelems.forEach(item => {
            console.log(item.innerText);
            item.setAttribute("class", "slds-align_absolute-center");
        })
    }
}