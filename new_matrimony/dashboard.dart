import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matrimony_new/new_matrimony/about_us.dart';
import 'package:matrimony_new/new_matrimony/db_helper.dart';
import 'package:matrimony_new/new_matrimony/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'registration_form.dart';
import 'user_list.dart';
import 'favorite_list.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<Map<String, dynamic>> usersList = [];
  final DBHelper _dbHelper = DBHelper();

  @override
  void initState() {
    super.initState();
    _loadUsers();
  }

  Future<void> _loadUsers() async {
    final users = await _dbHelper.getUsers();
    setState(() {
      usersList = users;
    });
  }

  void addUser(Map<String, dynamic> newUser) async {
    await _dbHelper.insertUser(newUser);
    _loadUsers();
  }

  void editUser(Map<String, dynamic> updatedUser) async {
    await _dbHelper.updateUser(updatedUser);
    _loadUsers();
  }

  void deleteUser(String email) async {
    await _dbHelper.deleteUser(email);
    _loadUsers();
  }

  void toggleFavorite(Map<String, dynamic> user) async {
    final updatedUser = {...user, 'isFavorite': user['isFavorite'] == 1 ? 0 : 1};
    await _dbHelper.updateUser(updatedUser);
    _loadUsers();
  }

  Future<void> _confirmLogout() async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Logout"),
        content: Text("Are you sure you want to logout?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: _logout,
            child: Text("Logout"),
          ),
        ],
      ),
    );
  }

  Future<void> _logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('userName'); // Remove saved username
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dashboard',
          style: GoogleFonts.abhayaLibre(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.logout, color: Colors.black),
            onPressed: _confirmLogout, // Show logout confirmation dialog
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          padding: const EdgeInsets.all(16),
          children: [
            _buildCard(
              icon: Icons.person_add,
              title: "Add User",
              onTap: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegistrationForm()),
                );

                if (result != null && result is Map<String, dynamic>) {
                  addUser(result);
                }
              },
            ),
            _buildCard(
              icon: Icons.list_alt,
              title: "User List",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserList(
                      onEdit: editUser,
                      onDelete: deleteUser,
                      onFavorite: toggleFavorite,
                      usersList: usersList,
                    ),
                  ),
                ).then((_) => _loadUsers());
              },
            ),
            _buildCard(
              icon: Icons.favorite,
              title: "Favorite Users",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FavoriteList(
                      onFavorite: toggleFavorite,
                    ),
                  ),
                ).then((_) => _loadUsers());
              },
            ),
            _buildCard(
              icon: Icons.info,
              title: "About Us",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutUs()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({required IconData icon, required String title, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.black),
            const SizedBox(height: 10),
            Text(title, style: const TextStyle(fontSize: 16, color: Colors.pink)),
          ],
        ),
      ),
    );
  }
}
