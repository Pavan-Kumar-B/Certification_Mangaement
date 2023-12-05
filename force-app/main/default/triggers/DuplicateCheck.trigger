trigger DuplicateCheck on Certification_Request__c (before insert, before update, before delete, after insert, after update, after delete, after undelete)
{
	if ( Trigger.isInsert ) {
            for ( Certification_Request__c obj : Trigger.new ) {
                List<Certification_Request__c> reqList = [SELECT Certification__c, Employees__c, Status__c FROM Certification_Request__c WHERE Employees__c=:obj.Employees__c];
                if(!reqList.isEmpty()){
                    for( Certification_Request__c i : reqList ){
                        if((obj.Certification__c == i.Certification__c) && (i.Status__c == 'Submitted'||i.Status__c=='Pending for Approval' || i.Status__c == 'Approved' || i.Status__c == 'Rejected' || i.Status__c == 'Passed' || i.Status__c == 'Failed')){
                           // obj.Employees__c.addError(' Certification Request for this Certification from this Employee already exists !');
                            break;
                        }
                        else{ continue; }
                    }
                }
            }
    }
}