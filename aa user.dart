class User{
  String id;
  String name;
  String email;

  User({required this.id,required this.name,required this.email});

  static User toUser(Map<String,dynamic> u){
    return User(
        id: u["id"],
        name: u["name"],
        email: u["email"]
    );
  }
  Map<String,dynamic> toMap(){
    return {"id" : this.id,"name":this.name,"email":this.email};
  }
}