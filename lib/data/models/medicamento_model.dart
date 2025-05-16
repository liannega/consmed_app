import 'dart:convert';

List<MedicamentoModel> medicamentoFromJson(String str) => List<MedicamentoModel>.from(json.decode(str).map((x) => MedicamentoModel.fromJson(x)));

String medicamentoToJson(List<MedicamentoModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MedicamentoModel {
    final int idindicador;
    final String denominacion;
    final String? descripcion;
    final String? codigoprod;
    final String codigobarra;
    final String precioventa;

    MedicamentoModel({
        required this.idindicador,
        required this.denominacion,
        required this.descripcion,
        required this.codigoprod,
        required this.codigobarra,
        required this.precioventa,
    });

    factory MedicamentoModel.fromJson(Map<String, dynamic> json) => MedicamentoModel(
        idindicador: json["idindicador"],
        denominacion: json["denominacion"],
        descripcion: json["descripcion"],
        codigoprod: json["codigoprod"],
        codigobarra: json["codigobarra"],
        precioventa: json["precioventa"],
    );

    Map<String, dynamic> toJson() => {
        "idindicador": idindicador,
        "denominacion": denominacion,
        "descripcion": descripcion,
        "codigoprod": codigoprod,
        "codigobarra": codigobarra,
        "precioventa": precioventa,
    };
}
