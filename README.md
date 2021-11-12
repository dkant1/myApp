# mycapappjava - CAP JAVA Based Application



CAP based application with support for SAP HANA database. 

### Database support
Depending on the spring profile 'default' or 'cloud' the app will use H2 in memory database or will try to connect to bound HANA Database service on Cloud Foundry(does not run on local computer as of now). 

### Cloud Foundry support
The app can be pushed to Cloud Foundry.


### To Do
* Step by Step explaination of app. 
    Creation of CAP JAVA app
    Addition of schema.cds(or equivalent) in db folder
    Addition of a service.cds file in srv folder
    Addition of POM dependencies to support HANA
    CDS commands to enable HANA support

    Creation of manifest.yml for pushing app to CF with automatic creation of HANA service instance
    
* Simple list UI support in the same app
* Create Book form to create a new record
* make it MTA app so that all modules can be pused together to Cloud Foundry
* Integrate with Message Queuing service on BTP Cloud Foundry


### Reference
* https://developers.sap.com/mission.cap-java-app.html



