import { LightningElement,api } from 'lwc';
const columns =[
    {label:'Id',fieldName:'id'},
    {label:'empName',fieldName:'name'},
    { label: 'Emp Email', fieldName: 'email'},
    { label: 'Experience', fieldName: 'experience', type: 'number' },
    { label: 'Comments', fieldName: 'comments', type: 'text' },
];
export default class EmployeeSearchResult extends LightningElement 
{
    columns=columns;
    @api 
    searchresults=[];
}