import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:frontend/models/materiel.dart';
import 'package:frontend/services/config/database_connection.dart';
import 'package:sqflite/sqflite.dart';

class Materielservice {
  static Future<bool> add(Materiel mat) async {
    Database db = await Mydatabase.getDatabase();
    List<Map> material = await db.query("MATERIEL",
        where: "nomMateriel=? and quantite=? and dateAcquisition=? and nomF=?",
        whereArgs: [
          mat.nomMateriel,
          mat.quantite,
          mat.dateAcqui!.microsecondsSinceEpoch,
          mat.nomF
        ]);
    if (material.isEmpty) {
      await db.insert("MATERIEL", mat.toMap());
      return true;
    }
    return false;
  }
}
