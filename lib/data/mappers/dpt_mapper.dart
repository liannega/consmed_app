import 'package:consmed_app/data/models/dpt_model.dart';
import 'package:consmed_app/domain/entities/dpt_entity.dart';

class DptMapper {
  static DptEntity fromModel(DptModel municipio) {
    return DptEntity(
        iddpt: municipio.iddpt,
        idpadre: municipio.idpadre,
        denominacion: municipio.denominacion);
  }
}
