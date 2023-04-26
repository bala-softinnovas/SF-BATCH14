@RestResource(urlMapping='/Lead/*')
global with sharing class LeadManager {
    // https://sff14-dev-ed.trailblaze.my.salesforce.com/services/apexrest/Lead/00Q2w00000TOfElEAL

    @HttpGet
    global static Lead getLead() {
        RestRequest request = RestContext.request;
        String endpoint = request.requestURI;
        Integer lastIndex = endpoint.lastIndexOf('/');
        Id leadId = endpoint.substring(lastIndex+1);
        Lead ld = [SELECT Id, Name, Company, Title, LeadSource, Email, Phone FROM Lead WHERE Id = :leadId];
        return ld;
    }

    @HttpPost
    global static Id postLead(String firstName, String lastName, String company, String title, String leadSource, String email, String phone) {
        Lead ld = new Lead();
        ld.FirstName = firstName;
        ld.LastName = lastName;
        ld.Company = company;
        ld.Title = title;
        ld.LeadSource = leadSource;
        ld.Email = email;
        ld.Phone = phone;
        insert ld;
        return ld.Id;
    }

    @HttpDelete
    global static String deleteLead() {
        RestRequest request = RestContext.request;
        String endpoint = request.requestURI;
        Integer lastIndex = endpoint.lastIndexOf('/');
        Id leadId = endpoint.substring(lastIndex+1);
        try {
            Lead ld = [SELECT Id FROM Lead WHERE Id = :leadId];
            delete ld;
        } catch(Exception ex) {
            return 'Fail';
        }
        return 'Success';
    }

    @HttpPut
    global static Lead putLead() {
        RestRequest request = RestContext.request;
        String body = request.requestBody.toString();
        Lead ld = (Lead)JSON.deserialize(body, Lead.class);
        upsert ld;
        return ld;
    }

    @HttpPatch
    global static Lead patchLead() {
        RestRequest request = RestContext.request;
        String body = request.requestBody.toString();
        Lead ld = (Lead)JSON.deserialize(body, Lead.class);
        update ld;
        Lead updatedLead = [SELECT Id, Name, Company, Title, LeadSource, Email, Phone FROM Lead WHERE Id = :ld.Id];
        return updatedLead;
    }
}
