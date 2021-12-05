import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:frontend/models/materiel.dart';
import 'package:frontend/services/config/database_connection.dart';
import 'package:sqflite/sqflite.dart';

// ignore: camel_case_types
class materielservice {
  static const storage = FlutterSecureStorage();
  static Future<bool> add(Materiel mat) async {
    Database db = await Mydatabase.getDatabase();
    List<Map> _user = await db.query("MATERIEL",
        where: "nomMateriel = ? ,quantite=?,dateAcqui=?,dateRetour=?,nomF=?",
        whereArgs: [
          mat.nomMateriel,
          mat.quantite,
          mat.dateAcqui,
          mat.dateRetour,
          mat.nomF
        ]);
    if (_user.isEmpty) {
      await db.insert("MATERIEL", mat.toMap());
      return true;
    }
    return false;
  }
}
