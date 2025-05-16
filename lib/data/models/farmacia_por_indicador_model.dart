import 'dart:convert';

List<FarmaciaPorIndicadorModel> welcomeFromJson(String str) => List<FarmaciaPorIndicadorModel>.from(json.decode(str).map((x) => FarmaciaPorIndicadorModel.fromJson(x)));

String welcomeToJson(List<FarmaciaPorIndicadorModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FarmaciaPorIndicadorModel {
    final int idestructura;
    final String entidad;
    final String codigo;
    final String telefono;
    final String correo;
    final String direccion;
    final String latitud;
    final String longitud;
    final int iddpt;

    FarmaciaPorIndicadorModel({
        required this.idestructura,
        required this.entidad,
        required this.codigo,
        required this.telefono,
        required this.correo,
        required this.direccion,
        required this.latitud,
        required this.longitud,
        required this.iddpt,
    });

    factory FarmaciaPorIndicadorModel.fromJson(Map<String, dynamic> json) => FarmaciaPorIndicadorModel(
        idestructura: json["idestructura"],
        entidad: json["entidad"],
        codigo: json["codigo"],
        telefono: json["telefono"],
        correo: json["correo"],
        direccion: json["direccion"],
        latitud: json["latitud"],
        longitud: json["longitud"],
        iddpt: json["iddpt"],
    );

    Map<String, dynamic> toJson() => {
        "idestructura": idestructura,
        "entidad": entidad,
        "codigo": codigo,
        "telefono": telefono,
        "correo": correo,
        "direccion": direccion,
        "latitud": latitud,
        "longitud": longitud,
        "iddpt": iddpt,
    };
}