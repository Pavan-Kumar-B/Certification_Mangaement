import { LightningElement } from 'lwc';
import getEmployee from '@salesforce/apex/SearchEmployee.getemployeeDetails'
import getEmployeebyEmail from '@salesforce/apex/SearchEmployeeByEmail.getemployeeDetails'
 
export default class SearchEmployee extends LightningElement 
{   empName;
    empEmail
    handleOnChangeEmpName(event)
    {
        this.empName=event.target.value;
        //alert(this.empName);
    }
    handleOnChangeEmpEmail(event)
    {
        this.empEmail=event.target.value;
        //alert(this.empEmail);
    }

    initiateSearch(event)
    {       if (this.empName){
        console.log(this.empName)

        getEmployee({empName:this.empName})
        .then(result=>{this.dispatchEvent(new CustomEvent('getemployeeinfo',{detail:result}))
    }).catch(error=>{console.log(error)})
    }
    else{
       // console.log(this.empEmail);
        getEmployeebyEmail({empEmail:this.empEmail}) 
        .then(result=>{this.dispatchEvent(new CustomEvent('getemployeeinfo',{detail:result}))
    })
        .catch(error=>{console.log(error)})
    }
    }
    clearSearch(){
        this.empName= '';
        this.empEmail = '';
        this.dispatchEvent(new CustomEvent('getemployeeinfo',null))
    }
}