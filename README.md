# mycapappjava - CAP JAVA Application
CAP based application with support for SAP HANA database. 

### Steps to create a CAP JAVA application

* Use maven command to create the project 
   ```  mvn -B archetype:generate -DarchetypeArtifactId=cds-services-archetype -DarchetypeGroupId=com.sap.cds -DarchetypeVersion=RELEASE -DgroupId=com.dk -DartifactId=mycapappj -Dpackage=com.dk.mycapappjava ```
* Add `schema.cds` and `service.cds` files.
* Run the project using `mvn spring-boot:run`. The project should already run and at `http://localhost:8080` you should see a page having links to service document and metadata of the OData API.
* CAP will automatically initialize an in memory H2 database for us. The JAVA mdoule in a CAP app is in fact based on spring boot. At this moment basic CRUD operations should work already with default handlers provided by CAP.
* To add HANA support use command `cds add hana`. This command will do the following:
   * add a `.hdiconfig` file in `db/src` folder.
   * add a `package.json` file in the `db` folder. The `package.json` file will have a dependency of `@sap/hdi-deploy`. They deployment of `db` artifacts defined in `schema.cds` file will be done by a node js based module on cloud foundry. The `package.json` is needed for that module.
   * add new `requires` and `hana` sections in `.cdsrc.json` file which is in the root of the project.
       ``` 
       "requires": {
		    "db": {
		        "kind": "sql"
		        }
		    },
		"hana": {
		    "deploy-format": "hdbtable"
		    } 
        ```
* Add MTA support for the project to facilitate deployment to cloud foundry by using command `cds add mta` -> pre requisite is (`cds add hana`). This command will add `mta.yml` file with `db deployer`, `srv` modules and resources section containing details of HDI container.
* Build the MTAR file by using command `mbt build` in the root of the project.
* Finally deploy the application to cloud foundry using command `cf deploy <MTAR archive name>`. The deployment process will automatically create the HDI container on cloud foundry if it is not pre existing. 
* If you want to enable local testing with remote HANA(on cloud foundry) the use the command `cds deploy to hana : <HDI container name>`. This command will generate a `default-env.json` file containing binding information etc in `VCAP_SERVICES` environment variable. After this use the command `mvn spring-boot:run -Dspring-boot.run.profiles=cloud` to run the application with `cloud` profile, otherwise CAP will use `default` profile and it will instantiate H2 database on local machine.

        







