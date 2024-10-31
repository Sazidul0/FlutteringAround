import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  late Database? _database;

   Future<Database> get database async {
    // if (_database != null) return _database;
    _database = await initializeDatabase();
    return _database!;
  }

   Future<Database> initializeDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'students.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE students(id TEXT PRIMARY KEY, name TEXT, description TEXT)",
        );
      },
      version: 1,
    );
  }

   Future<void> insertUser(String name, String id, String description) async {
    final db = await database;
    await db.insert(
      'students',
      {'id': id, 'name': name, 'description': description},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

   Future<List<Map<String, dynamic>>> getUsers() async {
    final db = await database;
    print(await db.query('students'));
    return await db.query('students');
  }
}
