import 'package:frontend/models/Famille.dart';
import 'package:frontend/services/config/database_connection.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// ignore: camel_case_types
class familyservice {
  static const storage = FlutterSecureStorage();
  static Future<bool> add(Famille fam) async {
    Database db = await Mydatabase.getDatabase();
    List<Map> _user = await db
        .query("FAMILY", where: "familyname = ?", whereArgs: [fam.nomFamille]);
    if (_user.isEmpty) {
      await db.insert("FAMILY", fam.toMap());
      return true;
    }
    return false;
  }
}
