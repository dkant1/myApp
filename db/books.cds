namespace com.dk.myapp;



entity Books{
    key id: Integer;
    title: String(200);
    descr: String(500);
    author: String(200);
    genre: String(40);

}

entity Authors{
    key name: String;
}