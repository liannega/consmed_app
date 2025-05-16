import 'package:consmed_app/domain/entities/custom_response.dart';
import 'package:consmed_app/domain/entities/dpt_entity.dart';

abstract class MunicipalityRepository {
  Future<CustomResponse<List<DptEntity>>> getMunicipality(String idPadre);
}