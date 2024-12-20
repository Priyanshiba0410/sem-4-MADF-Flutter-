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
