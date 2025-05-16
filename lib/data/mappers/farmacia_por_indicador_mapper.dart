import 'package:consmed_app/data/models/farmacia_por_indicador_model.dart';
import 'package:consmed_app/domain/entities/pharmacy_entity.dart';

class FarmaciaPorIndicadorMapper {
  static PharmacyEntity fromModel(FarmaciaPorIndicadorModel farm) {
    return PharmacyEntity(
      idestructura: farm.idestructura,
      entidad: farm.entidad,
      codigo: farm.codigo,
      telefono: farm.telefono,
      correo: farm.correo,
      direccion: farm.direccion,
      latitud: farm.latitud,
      longitud: farm.longitud,
      iddpt: farm.iddpt,
    );
  }
}
