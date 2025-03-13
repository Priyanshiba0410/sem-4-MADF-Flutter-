import 'package:crud_db/Lab_19/user.dart';
import 'package:crud_db/lab_20/apiService.dart';
import 'package:flutter/material.dart';

class ApiPage extends StatefulWidget {
  const ApiPage({super.key});

  @override
  State<ApiPage> createState() => _ApiPageState();
}

class _ApiPageState extends State<ApiPage> {
  ApiService apiService = ApiService();

  Future<void> _deleteUser(String id) async {
    await apiService.deleteUser(id);
    setState(() {}); // Refresh UI after deletion
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Api Crud')),
      body: FutureBuilder<List<User>>(
        future: apiService.getAllUser(),
        builder: (context, snapshot) {
            List<User> users = snapshot.data!;
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(users[index].name),
                  subtitle: Text(users[index].email),
                  trailing: Container(
                    width: 100,
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () async {
                            await _deleteUser(users[index].id);
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.black),
                          onPressed: () async {
                            TextEditingController nameController = TextEditingController(text: users[index].name.toString());
                            TextEditingController emailController = TextEditingController(text: users[index].email.toString());
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text("Edit user"),
                                content: Column(
                                  children: [
                                    TextFormField(
                                      controller: nameController,
                                      decoration: const InputDecoration(labelText: "Enter name"),
                                    ),
                                    SizedBox(height: 20,),
                                    TextFormField(
                                      controller: emailController,
                                      decoration: const InputDecoration(labelText: "Enter email"),
                                    ),
                                  ],
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () async {
                                      if (nameController.text.isNotEmpty) {
                                        await apiService.editUser(User(id: users[index].id, name: nameController.text, email: emailController.text));
                                        setState(() {});
                                      }
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text("edit"),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
        },
      ),
      floatingActionButton: Center(
        child: FloatingActionButton(
          onPressed: () {
            TextEditingController nameController = TextEditingController();
            TextEditingController emailController = TextEditingController();
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text("Add User"),
                content: Column(
                  children: [
                    TextFormField(
                      controller: nameController,
                      decoration: const InputDecoration(labelText: "Enter name"),
                    ),
                    SizedBox(height: 20,),
                    TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(labelText: "Enter email"),
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () async {
                      if (nameController.text.isNotEmpty) {
                        User newUser = User(name: nameController.text, id: '', email: emailController.text);
                        await apiService.addUser(newUser);
                        setState(() {}); // Refresh UI after adding user
                      }
                      Navigator.pop(context);
                    },
                    child: const Text("Add"),
                  ),
                ],
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}