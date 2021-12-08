import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:frontend/models/materiel.dart';
import 'package:frontend/models/membre.dart';
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

  static Future<List<Materiel>> getAllMaterial() async {
    Database db = await Mydatabase.getDatabase();
    List<Map<String, Object?>> mapMaterial = await db.query("MATERIEL");
    List<Materiel> allMaterial = [];
    mapMaterial
        .forEach((element) => allMaterial.add(Materiel.fromMap(element)));
    return allMaterial;
  }

  static Future<bool> borrowMaterial(Member mem, Materiel mat) async {
    Database db = await Mydatabase.getDatabase();
    int idMember = await db.insert("MEMBERS", mem.toMap());
    mat.setIdMember(idMember);
    mat.stateBorrow = true;
    await db.update("MATERIEL", mat.toMap());
    return true;
  }
}
