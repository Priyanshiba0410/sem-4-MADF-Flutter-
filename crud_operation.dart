import 'dart:io';
import 'crud_operation.dart';
import 'constant.dart';
void main() {
  User user = User();
  int? choice;
  do {
    print('Select Your Choice From Below Available Options:'
        '\n1. Insert User'
        '\n2. List User'
        '\n3. Update User'
        '\n4. Delete User'
        '\n5. Exit Application');
    choice = int.parse(stdin.readLineSync()!);
    switch (choice) {
      case 1:
// INSERT USER
        stdout.write('Enter a Name : ');
        String name = stdin.readLineSync()!;
        stdout.write('Enter a Age : ');
        int age = int.parse(stdin.readLineSync()!);
        stdout.write('Enter a Email : ');
        String email = stdin.readLineSync()!;
        user.addUserInList(NAME, AGE, EMAIL);

        break;
      case 2:
      // LIST USER
        List<Map<String, dynamic>> userList = user.getUserList();
        for (var element in userList) {
          print('${element[NAME]}.${element[AGE]}.${element[EMAIL]}');
        }
        break;
      case 3:
//UPDATE USER
        stdout.write('Enter Name : ');
        String name = stdin.readLineSync()!;
        stdout.write('Enter Age : ');
        int age = int.parse(stdin.readLineSync()!);
        stdout.write('Enter Email : ');
        String email = stdin.readLineSync()!;
        stdout.write('Enter id : ');
        int id = int.parse(stdin.readLineSync()!);
        user.updateUser(NAME, AGE, EMAIL, id);
        break;

      case 4:
// DELETE USER
        stdout.write('Enter Primary key : ');
        int id = int.parse(stdin.readLineSync()!);
        user.deleteUser(id);
        break;

      default:
        print('Invalid Choice Please Try Again');
        break;
    }
  }
  while (choice != 5);
}
class User{
  List<Map<String,dynamic>> UserList = [];

  // create
  void addUserInList(String name,age,email){
    Map<String,dynamic> map = {};
    map['NAME']=name;
    map['AGE']=age;
    map['EMAIL']=email;
    UserList.add(map);
  }

  //READ
  List<Map<String,dynamic>> getUserList(){
    return UserList;
  }

  //UPDATE
  void updateUser(name,age,email,id){
    Map<String,dynamic> map = {};
    map['NAME']=name;
    map['AGE']=age;
    map['EMAIL']=email;
    UserList[id] = map;
  }

//DELETE
  void deleteUser(id){
    UserList.removeAt(id);
  }
}
