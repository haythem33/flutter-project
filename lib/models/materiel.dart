class Materiel {
  String? nomMateriel;
  int? quantite;
  DateTime? dateAcqui;
  DateTime? dateRetour;
  String? nomF;
  Materiel(
      {required this.nomMateriel,
      required this.quantite,
      required this.dateAcqui,
      required this.dateRetour,
      required this.nomF});
  Materiel.create(this.nomMateriel, this.quantite, this.dateAcqui, this.nomF);

  Map<String, dynamic> toMap() {
    return {
      'nomMateriel': nomMateriel,
      'quantite': quantite,
      'dateAcquisition': dateAcqui!.microsecondsSinceEpoch,
      'dateRetour': dateRetour,
      'nomF': nomF,
    };
  }

  static Materiel fromMap(Map<String, dynamic> json) {
    return Materiel(
      nomMateriel: json['nomMateriel'],
      quantite: json['quantite'],
      dateAcqui: json['dateAcquisition'],
      dateRetour: json['dateRetour'],
      nomF: json['nomF'],
    );
  }
}
