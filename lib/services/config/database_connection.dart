import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Mydatabase {
  static const databaseName = "gestionComposant.db";
  static const databaseVersion = 1;
  static Database? _database;

  static Future<Database> getDatabase() async {
    return _database ??= await initDatabase();
  }

  static Future<Database> initDatabase() async {
    String documentDirectory = await getDatabasesPath();
    String path = join(documentDirectory, databaseName);
    return await openDatabase(path,
        version: databaseVersion, onCreate: _onCreate);
  }

  static Future _onCreate(Database db, int version) async {
    await db.execute('''CREATE TABLE USERS (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      username TEXT NOT NULL,
      email TEXT NOT NULL,
      password TEXT NOT NULL
    )
    ''');
  }
}
