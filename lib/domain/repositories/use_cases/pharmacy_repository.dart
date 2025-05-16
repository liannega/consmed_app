import 'package:consmed_app/domain/entities/custom_response.dart';
import 'package:consmed_app/domain/entities/pharmacy_entity.dart';

abstract class PharmacyRepository {
  Future<CustomResponse<List<PharmacyEntity>>> getPharmacy(String idDpt, String idIndicator);
}