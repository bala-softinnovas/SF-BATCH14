public with sharing class ProductCtrl {
    
    @AuraEnabled
    public static List<EcommerceProduct__c> getProducts(Integer amount) {
        return [SELECT Id, Title__c, Brand__c, Category__c, Price__c
        FROM EcommerceProduct__c
        WHERE Price__c <= :amount
        WITH SECURITY_ENFORCED];
    }
}
