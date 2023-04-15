@isTest
public with sharing class RestCalloutsTest {
    
    @isTest
    private static void getAnimalsTest() {
        Test.startTest();
        //1. Set mock
        RestCalloutsMock mock = new RestCalloutsMock();
        Test.setMock(HttpCalloutMock.class, mock);

        //2. Make Callout
        HttpResponse response = RestCallouts.getAnimals();

        //3. Perform assertions
        System.assertEquals(200, response.getStatusCode());
        System.assertEquals('OK', response.getStatus());
        Test.stopTest();
    }

    @isTest
    private static void getAirlinesTest() {
        Test.startTest();
        //1. Set mock
        RestCalloutsMock mock = new RestCalloutsMock();
        Test.setMock(HttpCalloutMock.class, mock);

        //2. Make callout
        HttpResponse response = RestCallouts.getAirlines();

        //3. Perform assertions
        System.assertEquals(200, response.getStatusCode());
        System.assertEquals('OK', response.getStatus());
        Test.stopTest();
    }

    @isTest
    private static void postAirlinesTest() {
        Test.startTest();
        //1. Set mock
        RestCalloutsMock mock = new RestCalloutsMock();
        Test.setMock(HttpCalloutMock.class, mock);

        //2. Make callout
        Airlines__c airlines = new Airlines__c();
        airlines.Name = '126543';
        airlines.Name__c = 'Turkish Airlines';
        airlines.Country__c = 'Turkiye';
        airlines.Established__c = '2023';
        airlines.Slogan__c = 'Ne mutlu Turkum diyene';
        airlines.LogoURL__c = 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.turkishairlines.com%2Fen-int%2[…]e=images&cd=vfe&ved=0CBAQjRxqFwoTCJjP4-zsqv4CFQAAAAAdAAAAABAE';
        insert airlines;

        //3. Perform assertions
        System.assert(airlines.Id != null);
        Test.stopTest();
    }
}
