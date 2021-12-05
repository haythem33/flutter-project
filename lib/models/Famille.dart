class Famille {
  String? nomFamille;
  Famille({required this.nomFamille});
  Famille.instance(this.nomFamille);

  Map<String, dynamic> toMap() {
    return {
      'nomFamille': nomFamille,
    };
  }

  static Famille fromMap(Map<String, dynamic> json) {
    return Famille(
      nomFamille: json['nomFamille'],
    );
  }
}
