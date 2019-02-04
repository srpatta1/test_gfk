public with sharing class MuleSoftPoC {
   
    public static void oauthLogin() {
        HttpRequest req = new HttpRequest(); 
        req.setHeader('Authorization', 'Basic NDc5MjU2ODhiOTA5NDYwMThmN2IzNDlkNTQ5MjZhNmI6MjM5NWI1NDIzMjk2NDlFODkyZTI1ZTYzOGZBN2NEQjc=');
        req.setHeader('Content-Type', 'application/json');
        //req.setHeader('username', '79c814b948344ee09e521d95b9f77aea');
        //req.setHeader('password', '144eE068b9314FC4bf6d75B5C28cDAA3');
        req.setMethod('POST');
        //String reqBody='{"mode": "raw","raw": "[ { "producer": "Workday", "type": "object", "code": "create", "name": "Employee", "guid": "0010N000048bs4iQAA", "description": "An employee has been created in Workday.", "object": { "employeeId": "4711", "employeeName": "Employee One" }, "consumers": "Workday, SAP", "timestamp": "yyyy-MM-dd HH:mm:ss.SSS" }, { "producer": "Workday", "type": "object", "code": "update", "name": "Employee", "guid": "0010N000048bs4iQAA", "description": "An employee has been updated in Workday.", "object": { "employeeId": "4711", "employeeName": "Employee One" }, "consumers": "Workday, SAP", "timestamp": "yyyy-MM-dd HH:mm:ss.SSS" }, { "producer": "Workday", "type": "object", "code": "delete", "name": "Employee", "guid": "0010N000048bs4iQAA", "description": "An employee has been deleted in Workday.", "object": { "employeeId": "4711", "employeeName": "Employee One" }, "consumers": "Workday, SAP", "timestamp": "yyyy-MM-dd HH:mm:ss.SSS" }]"}';
         String reqBody='[ { "producer": "Workday", "type": "object", "code": "create", "name": "Employee", "guid": "0010N000048bs4iQAA", "description": "An employee has been created in Workday.", "object": { "employeeId": "4711", "employeeName": "Employee One" }, "consumers": "Workday, SAP", "timestamp": "yyyy-MM-dd HH:mm:ss.SSS" }, { "producer": "Workday", "type": "object", "code": "update", "name": "Employee", "guid": "0010N000048bs4iQAA", "description": "An employee has been updated in Workday.", "object": { "employeeId": "4711", "employeeName": "Employee One" }, "consumers": "Workday, SAP", "timestamp": "yyyy-MM-dd HH:mm:ss.SSS" }, { "producer": "Workday", "type": "object", "code": "delete", "name": "Employee", "guid": "0010N000048bs4iQAA", "description": "An employee has been deleted in Workday.", "object": { "employeeId": "4711", "employeeName": "Employee One" }, "consumers": "Workday, SAP", "timestamp": "yyyy-MM-dd HH:mm:ss.SSS" }]';
        req.setEndpoint('https://gfk-eas-event-mock-api.de-c1.eu1.cloudhub.io/api/events');
        req.setBody(reqBody);
    
        Http http = new Http();
       
       //demo
  
        HTTPResponse res = http.send(req);

        System.debug('BODY: '+res.getBody());
        System.debug('STATUS:'+res.getStatus());
        System.debug('STATUS_CODE:'+res.getStatusCode());
        
        //return new (res.getBody());
    

}
}
