public with sharing class RestTest {
    public static void oauthLogin() {
        HttpRequest req = new HttpRequest(); 
        req.setHeader('Authorization', 'Basic NDc5MjU2ODhiOTA5NDYwMThmN2IzNDlkNTQ5MjZhNmI6MjM5NWI1NDIzMjk2NDlFODkyZTI1ZTYzOGZBN2NEQjc=');
        req.setHeader('Content-Type', 'application/json');
        req.setMethod('POST');
        String reqBody= '{"mode": "raw","raw": "[ { \"producer\": \"Workday\", \"type\": \"object\", \"code\": \"create\", \"name\": \"Employee\", \"guid\": \"0010N000048bs4iQAA\", \"description\": \"An employee has been created in Workday.\", \"object\": { \"employeeId\": \"4711\", \"employeeName\": \"Employee One\" }, \"consumers\": \"Workday, SAP\", \"timestamp\": \"yyyy-MM-dd HH:mm:ss.SSS\" }, { \"producer\": \"Workday\", \"type\": \"object\", \"code\": \"update\", \"name\": \"Employee\", \"guid\": \"0010N000048bs4iQAA\", \"description\": \"An employee has been updated in Workday.\", \"object\": { \"employeeId\": \"4711\", \"employeeName\": \"Employee One\" }, \"consumers\": \"Workday, SAP\", \"timestamp\": \"yyyy-MM-dd HH:mm:ss.SSS\" }, { \"producer\": \"Workday\", \"type\": \"object\", \"code\": \"delete\", \"name\": \"Employee\", \"guid\": \"0010N000048bs4iQAA\", \"description\": \"An employee has been deleted in Workday.\", \"object\": { \"employeeId\": \"4711\", \"employeeName\": \"Employee One\" }, \"consumers\": \"Workday, SAP\", \"timestamp\": \"yyyy-MM-dd HH:mm:ss.SSS\" } \n]"}';
        req.setEndpoint('http://gfk-eas-event-mock-api.de-c1.eu1.cloudhub.io/api/events');
        req.setBody(reqBody);
        
        //testing for the pull request
    
        Http http = new Http();
        HTTPResponse res = http.send(req);

        System.debug('BODY: '+res.getBody());
        System.debug('STATUS:'+res.getStatus());
        //System.debug('STATUS_CODE:'+res.getStatusCode());
        
        //return new (res.getBody());
    }
    
}
