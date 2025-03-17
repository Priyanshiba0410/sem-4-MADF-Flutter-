import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matrimony_new/new_matrimony/db_helper.dart';

import 'registration_form.dart';

class UserList extends StatefulWidget {
  final Function(Map<String, dynamic>) onEdit;
  final Function(String) onDelete;
  final Function(Map<String, dynamic>) onFavorite;

  UserList({
    required this.onEdit,
    required this.onDelete,
    required this.onFavorite,
    super.key,
    required List<Map<String, dynamic>> usersList,
  });

  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  TextEditingController searchController = TextEditingController();
  List<Map<String, dynamic>> users = [];
  List<Map<String, dynamic>> filteredUsers = [];
  final DBHelper dbHelper = DBHelper();

  @override
  void initState() {
    super.initState();
    loadUsers();
  }

  // Load all users from the database
  Future<void> loadUsers() async {
    final userList = await dbHelper.getUsers();
    setState(() {
      users = userList;
      filteredUsers = userList;
    });
  }

  // Search users by name, age, or city
  void _searchUser(String query) {
    setState(() {
      filteredUsers = users.where((user) {
        return user["name"].toLowerCase().contains(query.toLowerCase()) ||
            user["age"].toString().toLowerCase().contains(query.toLowerCase()) ||  // FIXED: Convert age to string
            user["city"].toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  // Show confirmation dialog before deleting a user
  void _showDeleteDialog(String email) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Confirm Deletion"),
        content: const Text("Are you sure you want to delete this user?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("No"),
          ),
          TextButton(
            onPressed: () async {
              await dbHelper.deleteUser(email);
              Navigator.pop(context);
              loadUsers();
            },
            child: const Text("Yes"),
          ),
        ],
      ),
    );
  }

  // Toggle favorite status for a user
  void _toggleFavorite(Map<String, dynamic> user) async {
    Map<String,dynamic> temp=Map.from(user);
    int newFavStatus = temp['isFav'] == 1 ? 0 : 1;  // FIXED: Corrected field name (was 'isFavorite')
    await dbHelper.toggleFavorite(temp["email"], newFavStatus);

    setState(() {
      user['isFav'] = newFavStatus;  // FIXED: Ensure state updates correctly
    });

    loadUsers();
  }

  void _showUserDetailsDialog(BuildContext context, Map<String, dynamic> user) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.pinkAccent,
                child: Text(
                  user["name"][0].toUpperCase(),
                  style: const TextStyle(fontSize: 30, color: Colors.white),
                ),
              ),
              const SizedBox(height: 10),
              Text(user["name"], style: GoogleFonts.aladin(fontSize: 22, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              const Text("Personal Details", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black)),
              const SizedBox(height: 5),
              _buildDetailRow(Icons.phone, "Phone", user["phone"]),
              _buildDetailRow(Icons.email, "Email", user["email"]),
              _buildDetailRow(Icons.person, "Gender", user["gender"]),
              _buildDetailRow(Icons.location_city, "City", user["city"]),
              _buildDetailRow(Icons.cake, "Birthdate", user["dob"]),
              _buildDetailRow(Icons.tag, "Age", user["age"].toString()),
              _buildDetailRow(Icons.fact_check_outlined, "Hobbies", user["hobbies"].toString()),
              const SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pinkAccent,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: () => Navigator.pop(context),
                child: const Text("Close", style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDetailRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(icon, color: Colors.black, size: 18),
          const SizedBox(width: 10),
          Expanded(child: Text("$label: $value", style: GoogleFonts.actor(fontSize: 16))),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "User List",
          style: GoogleFonts.abhayaLibre(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: "Search according to your need",
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide.none,
                  ),
                ),
                onChanged: _searchUser,
              ),
            ),
            Expanded(
              child: filteredUsers.isEmpty
                  ? const Center(child: Text("No users found."))
                  : ListView.builder(
                itemCount: filteredUsers.length,
                itemBuilder: (context, index) {
                  final user = filteredUsers[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 4,
                      child: ListTile(
                        onTap: () => _showUserDetailsDialog(context, user),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        leading: CircleAvatar(
                          backgroundColor: Colors.pink,
                          radius: 30,
                          child: Text(
                            user["name"][0].toUpperCase(),
                            style: GoogleFonts.alata(fontSize: 24, color: Colors.white),
                          ),
                        ),
                        title: Text(
                          user["name"] ?? "",
                          style: GoogleFonts.alata(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                        subtitle: Text(
                          "${user["age"]} years | ${user["city"]}",
                          style: GoogleFonts.actor(fontSize: 15, color: Colors.grey[700]),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Favorite button
                            IconButton(
                              icon: Icon(
                                user['isFav'] == 1 ? Icons.favorite : Icons.favorite_border,  // FIXED: Corrected field name
                                color: Colors.red,
                              ),
                              onPressed: () => _toggleFavorite(user),
                            ),
                            // Edit button
                            IconButton(
                              icon: const Icon(Icons.edit, color: Colors.black),
                              onPressed: () async {
                                final updatedUser = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RegistrationForm(userDetail: user),
                                  ),
                                );
                                if (updatedUser != null && updatedUser is Map<String, dynamic>) {
                                  // Preserve isFav status before updating
                                  updatedUser['isFav'] = user['isFav'];  // FIXED: Keep favorite status

                                  await dbHelper.updateUser(updatedUser);
                                  loadUsers();
                                }
                              },
                            ),
                            // Delete button
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.black),
                              onPressed: () => _showDeleteDialog(user['email']),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
