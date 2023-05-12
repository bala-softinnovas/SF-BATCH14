public with sharing class OpportunityCtrl {
    @AuraEnabled(cacheable=true)
    public static List<Opportunity> getRecentOpps(){
        return [SELECT Id, Name, Type, StageName, Amount, CloseDate
                FROM Opportunity
                WITH SECURITY_ENFORCED
                ORDER BY CreatedDate DESC
                LIMIT 5];
    }
}
