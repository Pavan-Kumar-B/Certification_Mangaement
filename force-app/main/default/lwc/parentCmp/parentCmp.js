import { LightningElement } from 'lwc';

export default class ParentCmp extends LightningElement 
{
    searchDetail = [];
    handleEmployee(event)
    {
        this.searchDetail=[];
        //alert('I called from the child');
        //alert(event.detail);
        try{
            event.detail.forEach(x => {
                var empData = {
                    id:x.Emp_ID__c,
                    name:x.Name,
                    email:x.Emp_Email__c,
                    experience:x.Experience__c,
                    comments:x.Comments__c
                }
                this.searchDetail.push(empData);
            });
        }catch(e){
            console.log(e);
        }
    }
}