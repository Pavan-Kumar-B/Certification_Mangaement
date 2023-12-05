public class SearchEmployee {
    @AuraEnabled(cacheable=true)
    public static List<Employee__c> getemployeeDetails(String empName){
        if (empName==''){
            return null;
        }
        empName='%'+empName+'%';
        List<Employee__c> e = [SELECT Emp_ID__c,name,Emp_Email__c,Experience__c,Comments__c FROM Employee__c WHERE name like:empName];
        return e;
    }
}