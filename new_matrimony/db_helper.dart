import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDb();
    return _database!;
  }

  Future<Database> _initDb() async {
    String path = join(await getDatabasesPath(), 'users.db');
    return openDatabase(path, version: 1, onCreate: (db, version) {
      return db.execute('''
        CREATE TABLE users (
          email TEXT PRIMARY KEY,
          name TEXT,
          phone TEXT,
          gender TEXT,
          city TEXT,
          dob TEXT,
          age INTEGER,
          hobbies TEXT,
          isFav INTEGER DEFAULT 0
        )
      ''');
    });
  }

  Future<void> insertUser(Map<String, dynamic> user) async {
    final db = await database;
    user["isFav"] = 0; // Ensure user is not favorite on insertion
    await db.insert('users', user, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Map<String, dynamic>>> getUsers() async {
    final db = await database;
    return db.query('users');
  }

  Future<List<Map<String, dynamic>>> getFavUsers() async {
    final db = await database;
    return db.query('users', where: 'isFav = ?', whereArgs: [1]); // Only get favorite users
  }

  Future<void> deleteUser(String email) async {
    final db = await database;
    await db.delete('users', where: 'email = ?', whereArgs: [email]);
  }

  Future<void> updateUser(Map<String, dynamic> user) async {
    final db = await database;

    // Preserve isFav status before updating
    final currentUser = await db.query('users', where: 'email = ?', whereArgs: [user['email']]);
    if (currentUser.isNotEmpty) {
      user['isFav'] = currentUser.first['isFav']; // Keep favorite status
    }

    await db.update('users', user, where: 'email = ?', whereArgs: [user['email']]);
  }

  Future<void> toggleFavorite(String email, int isFav) async {
    final db = await database;
    await db.update('users', {'isFav': isFav}, where: 'email = ?', whereArgs: [email]);
  }
}
