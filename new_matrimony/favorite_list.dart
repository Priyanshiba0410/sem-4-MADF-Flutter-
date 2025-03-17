import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matrimony_new/new_matrimony/db_helper.dart';


class FavoriteList extends StatefulWidget {
  const FavoriteList({super.key, required void Function(Map<String, dynamic> user) onFavorite});

  @override
  _FavoriteListState createState() => _FavoriteListState();
}

class _FavoriteListState extends State<FavoriteList> {
  TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> _favorites = [];
  List<Map<String, dynamic>> _filteredFavorites = [];
  final DBHelper _dbHelper = DBHelper();

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    final favorites = await _dbHelper.getFavUsers();
    setState(() {
      _favorites = favorites;
      _filteredFavorites = List.from(favorites);
    });
  }

  void _filterFavorites(String query) {
    setState(() {
      _filteredFavorites = _favorites.where((user) {
        return user["name"].toLowerCase().contains(query.toLowerCase()) ||
            user["age"].toString().toLowerCase().contains(query.toLowerCase()) ||
            user["city"].toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  void _toggleFavorite(Map<String, dynamic> user) async {
    await _dbHelper.toggleFavorite(user["email"], 0);
    setState(() {
      _favorites.removeWhere((u) => u["email"] == user["email"]);
      _filteredFavorites.removeWhere((u) => u["email"] == user["email"]);
    });
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
        title: Text(
          "Favorite Users",
          style: GoogleFonts.abhayaLibre(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.black),
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
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  labelText: "Search here...",
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onChanged: _filterFavorites,
              ),
            ),
            Expanded(
              child: _filteredFavorites.isEmpty
                  ? const Center(child: Text("No favorite users found."))
                  : ListView.builder(
                itemCount: _filteredFavorites.length,
                itemBuilder: (context, index) {
                  final user = _filteredFavorites[index];
                  return Card(
                    elevation: 5,
                    margin: const EdgeInsets.all(10),
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
                      trailing: IconButton(
                        icon: const Icon(Icons.favorite, color: Colors.red),
                        onPressed: () => _toggleFavorite(user),
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
