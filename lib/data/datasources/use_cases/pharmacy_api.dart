import 'package:consmed_app/config/constants/paths.dart';
import 'package:consmed_app/data/json/json_pharmacy_indicador.dart';
import 'package:consmed_app/data/mappers/farmacia_por_indicador_mapper.dart';
import 'package:consmed_app/data/models/farmacia_por_indicador_model.dart';
import 'package:consmed_app/data/myDio/my_dio.dart';
import 'package:consmed_app/domain/entities/custom_response.dart';
import 'package:consmed_app/domain/entities/pharmacy_entity.dart';
import 'package:consmed_app/domain/repositories/use_cases/pharmacy_repository.dart';

class PharmacyApi extends PharmacyRepository {
  final MyDio _dio;
  PharmacyApi(this._dio);

  final String _localUrl = Paths.pharmacy;

  @override
  Future<CustomResponse<List<PharmacyEntity>>> getPharmacy(
      String idDpt, String idIndicator) async {
    try {
      // final json = await _dio.request(
      //   requestType: RequestType.GET,
      //   path: "$_localUrl/?iddpt=$idDpt&idindicador=$idIndicator",
      // );
      final json = endpointPharmacyIndicator;
      await Future.delayed(const Duration(seconds: 2));
      return CustomResponse(
          status: 200,
          data: List.from((json as List).map((x) =>
              FarmaciaPorIndicadorMapper.fromModel(
                  FarmaciaPorIndicadorModel.fromJson(x)))));
    } on CustomDioError catch (e) {
      return CustomResponse(
          status: e.code, message: e.message ?? e.data.toString());
    } catch (e) {
      return CustomResponse(status: 400, message: e.toString());
    }
  }
}
