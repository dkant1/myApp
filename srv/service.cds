using { com.dk.mycapappjava as db } from '../db/schema';

service CustomerService {
    entity Customers as projection on db.Customers;
    entity Addresses as projection on db.Addresses;
    entity Products as projection on db.Products;
}