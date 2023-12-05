trigger NewVoucherAdded on Voucher__c (before insert, after insert, before update, after update, before delete, after delete, after undelete) 
{
	if(Trigger.isInsert&&Trigger.isAfter)
    {
        VoucherTriggerClass.triggerHandler(Trigger.New);
    }
    
}