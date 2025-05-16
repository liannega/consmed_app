import 'package:consmed_app/domain/entities/custom_response.dart';
import 'package:consmed_app/domain/entities/dpt_entity.dart';

abstract class ProvinceRepository {
  Future<CustomResponse<List<DptEntity>>> getProvince();
}