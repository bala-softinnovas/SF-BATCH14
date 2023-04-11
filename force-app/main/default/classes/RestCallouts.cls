public with sharing class RestCallouts {
    
    //Endpoint: https://th-apex-http-callout.herokuapp.com/animals
    //Http Method: GET
    public static HttpResponse getAnimals() {
        //1. Prepare HttpRequest and wrap all the necessary data in it
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setMethod('GET');

        //2. Prepare internet
        Http http = new Http();

        //3. Send the request over the internet to receive HttpResponse
        HttpResponse response = http.send(request);

        //4. Process the response
        System.debug(response.getStatus());
        System.debug(response.getStatusCode());
        System.debug(response.getBody());
        return response;
    }

    //Endpoint: https://api.instantwebtools.net/v1/airlines/1
    //Http Method: GET
    public static HttpResponse getAirlines() {
        //1. Prepare HttpRequest and wrap all the necessary data in it
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.instantwebtools.net/v1/airlines/1');
        request.setMethod('GET');

        //2. Prepare internet
        Http http = new Http();

        //3. Send the request over the internet in order to receive HttpResponse
        HttpResponse response = http.send(request);

        //4. Process the response
        if(response.getStatusCode() == 200) {
            String jsonString = response.getBody();
            //Convert json string into wrapper
            AirlinesWrapper wrapper = (AirlinesWrapper)JSON.deserialize(jsonString, AirlinesWrapper.class);

            //Convert wrapper into sobject record
            Airlines__c airline = new Airlines__c();
            airline.Name = String.valueOf(wrapper.id);
            airline.Name__c = wrapper.name;
            airline.Country__c = wrapper.country;
            airline.LogoURL__c = wrapper.logo;
            airline.Slogan__c = wrapper.slogan;
            airline.HeadQuaters__c = wrapper.head_quaters;
            airline.Website__c = wrapper.website;
            airline.Established__c = wrapper.established;

            //create airlines record
            try {
                insert airline;
            } catch(Exception ex) {
                System.debug(ex.getMessage());
            }
        } else {
            System.debug(response.getStatus());
            System.debug(response.getStatusCode());
            System.debug(response.getBody());
        }
        return response;
    }

    //Endpoint: https://api.onlinewebtutorblog.com/employees
    //Http Method: GET
    public static HttpResponse getEmployees() {
        //1. Prepare HttpRequest and wrap all the necessary data in it
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.onlinewebtutorblog.com/employees');
        request.setMethod('GET');

        //2. Prepare internet
        Http http = new Http();

        //3. Send the request over the internet in order to receive HttpResponse
        HttpResponse response = http.send(request);

        //4. Process the response
        if(response.getStatusCode() == 200) {
            String jsonString = response.getBody();
            //Convert the json string into wrapper class
            EmployeeWrapper empWrapper = (EmployeeWrapper)JSON.deserialize(jsonString, EmployeeWrapper.class);
            List<EmployeeWrapper.Employee> employees = empWrapper.data;

            //Convert the wrapper into sObject
            List<Employee__c> emps = new List<Employee__c>();
            for(EmployeeWrapper.Employee empWrap : employees) {
                Employee__c emp = new Employee__c();
                emp.Name = String.valueOf(empWrap.id);
                emp.Name__c = empWrap.name;
                emp.Username__c = empWrap.username;
                emp.Email__c = empWrap.email;
                emp.Designation__c = empWrap.designation;
                emp.Gender__c = empWrap.gender;
                emp.Complete_Address__c = empWrap.complete_address;
                emp.Phone_Number__c = empWrap.phone_number;
                emps.add(emp);
            }
            //insert employee records
            try {
                insert emps;
            } catch(Exception ex) {
                System.debug(ex.getMessage());
            }
        } else {
            System.debug(response.getStatus());
            System.debug(response.getStatusCode());
            System.debug(response.getBody());
        }
        return response;
    }

    //Endpoint: https://sfdev12-dev-ed.trailblaze.my.salesforce.com/services/apexrest/Case/5002w00000cm3P5AAI
    //Http Method: GET
    public static HttpResponse getCaseInfo() {
        //1. Prepare HttpRequest and wrap all the necessary data in it
        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:NC_SFDEV12/services/apexrest/Case/5002w00000cm3P5AAI');
        request.setMethod('GET');

        //2. Prepare internet
        Http http = new Http();

        //3. Send the request over the internet in order to receive HttpResponse
        HttpResponse response = http.send(request);

        //4. Process the response
        System.debug(response.getStatus());
        System.debug(response.getStatusCode());
        System.debug(response.getBody());
        return response;
    }
}
