import 'package:consmed_app/domain/entities/custom_response.dart';
import 'package:consmed_app/domain/entities/medicamento_entity.dart';

abstract class IndicatorRepository {
  Future<CustomResponse<List<MedicamentoEntity>>> getIndicator(String idDpt);
}
