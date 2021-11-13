namespace com.dk.mycapappjava;
using{ cuid, managed } from '@sap/cds/common';

entity Customers : cuid, managed {
firstname : String(100);
lastname : String(100);
email : String(100);
telephone : String(20);
mobile : String(15);
toaddresses : Association to many Addresses on toaddresses.customer = $self;
}

entity Addresses : cuid {
    line1 : String(100);
    line2 : String(100);
    city : String(30);
    postalcode : String(10);
    country : String(3);   
    customer : Association to Customers not null;
}

entity Products : cuid, managed {
    name : String(100);
    description : String(200);
    category : String(5);
}


