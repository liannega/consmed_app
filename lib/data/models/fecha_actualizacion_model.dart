import 'dart:convert';

FechaActualizacionModel municipioFromJson(String str) => FechaActualizacionModel.fromJson(json.decode(str));

String municipioToJson(FechaActualizacionModel data) => json.encode(data.toJson());

class FechaActualizacionModel {
    final DateTime fechaActualizacion;

    FechaActualizacionModel({
        required this.fechaActualizacion,
    });

    factory FechaActualizacionModel.fromJson(Map<String, dynamic> json) => FechaActualizacionModel(
        fechaActualizacion: DateTime.parse(json["fecha_actualizacion"]),
    );

    Map<String, dynamic> toJson() => {
        "fecha_actualizacion": fechaActualizacion.toIso8601String(),
    };
}
