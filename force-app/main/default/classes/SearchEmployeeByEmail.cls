public class SearchEmployeeByEmail {
    @AuraEnabled(cacheable=true)
    public static List<Employee__c> getemployeeDetails(String empEmail){
        if (empEmail==''){
            return null;
        }
        List<Employee__c> e=[SELECT Emp_ID__c,name,Emp_Email__c,Experience__c,Comments__c FROM Employee__c WHERE Emp_Email__c=:empEmail];
        return e;
    }
}