
using {com.dk.myapp as myapp} from '../db/books';


service myservice{
    entity Books as projection on myapp.Books;
    entity Authors as projection on myapp.Authors;
//     function hello (to:String) returns String;
}