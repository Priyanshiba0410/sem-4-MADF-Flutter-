import 'dart:convert';
import 'package:crud_db/Lab_19/user.dart';
import 'package:http/http.dart' as http;

class ApiService{

  String baseUrl = "https://66f11aa541537919154f88ba.mockapi.io/Student";

  Future<List<User>> getAllUser() async{
    var res = await http.get(Uri.parse(baseUrl));
    List<dynamic> data = jsonDecode(res.body);
    List<User> users = [];
    data.forEach((element) {
      users.add(User.toUser(element));
    },);
    return users;
  }

  Future<void> addUser(User user) async {
    var res = await http.post(Uri.parse(baseUrl),
      body: user.toMap()
    );
    print(res.body);
    print(res.statusCode);
  }

  Future<void> deleteUser(String id) async {
    var res = await http.delete(Uri.parse("$baseUrl/$id"));
    print(res.body);
  }

  Future<void> editUser(User user) async {
    var res = await http.put(Uri.parse("$baseUrl/${user.id}"),
        body: user.toMap()
    );
    print(res.body);
    print(res.statusCode);
  }

}