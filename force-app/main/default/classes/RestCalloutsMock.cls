public with sharing class RestCalloutsMock implements HttpCalloutMock {
    
    public HttpResponse respond(HttpRequest request) {
        //Fake response for getAnimals
        if(request.getEndpoint() == 'https://th-apex-http-callout.herokuapp.com/animals' && request.getMethod() == 'GET') {
            //fake response preparation
            HttpResponse response = new HttpResponse();
            response.setStatus('OK');
            response.setStatusCode(200);
            String body = '{"animals":["majestic badger","fluffy bunny","scary bear","chicken"]}';
            response.setBody(body);
            return response;
        }
        //Fake response for getAirlines
        else if(request.getEndpoint() == 'https://api.instantwebtools.net/v1/airlines/1' && request.getMethod() == 'GET') {
            //fake response preparation
            HttpResponse response = new HttpResponse();
            response.setStatus('OK');
            response.setStatusCode(200);
            String body = '{"id":1,"name":"Quatar Airways","country":"Quatar","logo":"https://upload.wikimedia.org/wikipedia/en/thumb/9/9b/Qatar_Airways_Logo.svg/300px-Qatar_Airways_Logo.svg.png","slogan":"Going Places Together","head_quaters":"Qatar Airways Towers, Doha, Qatar","website":"www.qatarairways.com","established":"1994"}';
            response.setBody(body);
            return response;
        }
        //Fake response for postAirlines
        else if(request.getEndpoint() == 'https://api.instantwebtools.net/v1/airlines' && request.getMethod() == 'POST') {
            //fake response preparation
            HttpResponse response = new HttpResponse();
            response.setStatus('OK');
            response.setStatusCode(200);
            return response;
        }
        return null;
    }
}
