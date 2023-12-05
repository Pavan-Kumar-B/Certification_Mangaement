public with sharing class SearchEmployeeClass 
{
    @auraEnabled(cacheable=true)

    public static list<Employee__c> getEmpNameDetails(String empName) 
    {	 
        List<Employee__c> employees ;
        if (empName!=''||empName!=null)
        {
            empName='%'+empName+'%';
            employees= [SELECT Emp_ID__c,name,Emp_Email__c,Experience__c,Comments__c FROM Employee__c WHERE name like:empName];
        }
       
     return employees;
    }
    @auraEnabled(cacheable=true)
    public static list<Employee__c> getEmpEmailDetails(String empEmail) 
    {	 List<Employee__c> employees ;
    	 if (empEmail!=''||empEmail!=null)
        {
            employees= [SELECT Emp_ID__c,name,Emp_Email__c,Experience__c,Comments__c FROM Employee__c WHERE Emp_Email__c=:empEmail];
        }
        return employees;
    }
}