

class DptModel {
  final int iddpt;
  final int? idpadre;
  final String denominacion;

  DptModel({
    required this.iddpt,
    required this.idpadre,
    required this.denominacion,
  });

  factory DptModel.fromJson(Map<String, dynamic> json) => DptModel(
        iddpt: json["iddpt"].toInt(),
        idpadre: json["idpadre"],
        denominacion: json["denominacion"],
      );

  Map<String, dynamic> toJson() => {
        "iddpt": iddpt,
        "idpadre": idpadre,
        "denominacion": denominacion,
      };
}
