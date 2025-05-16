import 'package:consmed_app/data/models/fecha_actualizacion_model.dart';
import 'package:consmed_app/domain/entities/fecha_actualizacion_entity.dart';

class FechaActualizacionMapper {
  static FechaActualizacionEntity fromModel(FechaActualizacionModel fecha) {
    return FechaActualizacionEntity(
      fechaActualizacion: fecha.fechaActualizacion,
    );
  }
}
