class Materiel {
  String? nomMateriel;
  int? quantite;
  DateTime? dateAcqui;
  DateTime? dateRetour;
  String? nomF;
  bool? stateBorrow;
  int? idMember;
  Materiel(
      {required this.nomMateriel,
      required this.quantite,
      required this.dateAcqui,
      required this.dateRetour,
      required this.nomF,
      required this.stateBorrow,
      required this.idMember});
  Materiel.create(this.nomMateriel, this.quantite, this.dateAcqui, this.nomF,
      this.stateBorrow);

  void setIdMember(int id) {
    idMember = id;
  }

  Map<String, dynamic> toMap() {
    return {
      'nomMateriel': nomMateriel,
      'quantite': quantite,
      'dateAcquisition': dateAcqui!.microsecondsSinceEpoch,
      'dateRetour':
          dateRetour != null ? dateRetour!.microsecondsSinceEpoch : null,
      'nomF': nomF,
      'stateBorrow': stateBorrow,
      'idMember': idMember
    };
  }

  static Materiel fromMap(Map<String, dynamic> json) {
    return Materiel(
        nomMateriel: json['nomMateriel'],
        quantite: json['quantite'],
        dateAcqui: DateTime.fromMicrosecondsSinceEpoch(json['dateAcquisition']),
        dateRetour: json['dateRetour'] != null
            ? DateTime.fromMicrosecondsSinceEpoch(json['dateRetour'])
            : null,
        nomF: json['nomF'],
        stateBorrow: json['stateBorrow'] == 0 ? false : true,
        idMember: json['idMember']);
  }
}
