import 'package:consmed_app/data/models/medicamento_model.dart';
import 'package:consmed_app/domain/entities/medicamento_entity.dart';

class MedicamentoMapper {
  static MedicamentoEntity fromModel(MedicamentoModel med) {
    return MedicamentoEntity(
      idindicador: med.idindicador,
      denominacion: med.denominacion,
      descripcion: med.descripcion,
      codigoprod: med.codigoprod,
      codigobarra: med.codigobarra,
      precioventa: med.precioventa,
    );
  }
}
