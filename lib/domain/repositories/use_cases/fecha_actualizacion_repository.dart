import 'package:consmed_app/domain/entities/custom_response.dart';
import 'package:consmed_app/domain/entities/fecha_actualizacion_entity.dart';

abstract class FechaActualizacionRepository {
  Future<CustomResponse<FechaActualizacionEntity>> getFechaActualizacion();
}