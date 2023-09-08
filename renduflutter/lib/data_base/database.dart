import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static const databaseName = 'users.db';
  static const tableUsers = 'users';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final path = join(await getDatabasesPath(), databaseName);
    return await openDatabase(path, version: 1, onCreate: _createDatabase);
  }

  Future<int> insertUser(String loginUser, String loginPassword) async {
    final db = await database;
    final id = await db.insert(tableUsers, {
      'loginUser': loginUser,
      'loginPassword': loginPassword,
    });
    return id;
  }

  Future<List<Map<String, dynamic>>> getUsers() async {
    final db = await database;
    return await db.query(tableUsers);
  }

  Future<int> deleteUser(int id) async {
    final db = await database;
    return await db.delete(tableUsers, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> updateUser(int id, String newLoginPassword) async {
    final db = await database;
    return await db.update(tableUsers, {'loginPassword': newLoginPassword},
        where: 'id = ?', whereArgs: [id]);
  }

  Future close() async {
    final db = await database;
    db.close();
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tableUsers (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        loginUser TEXT,
        loginPassword TEXT
      )
    ''');
  }
}
