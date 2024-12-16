import 'dart:io';
void greet(String Firstname,String lastname){
  print('hello,$Firstname $lastname');
}
void greet2(String? lastname,{String? Firstname}){
  print('hello,$Firstname $lastname');
}
void greet3(String? lastname,[String? Firstname ='smith']){
  print('hello,$Firstname $lastname');
}
void main(){
  greet('john','doe');
  greet2(Firstname: 'john','doe');
  greet3('doe');
}