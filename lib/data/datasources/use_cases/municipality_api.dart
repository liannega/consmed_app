import 'package:consmed_app/config/constants/paths.dart';
import 'package:consmed_app/data/json/json_dpt_municipality.dart';
import 'package:consmed_app/data/mappers/dpt_mapper.dart';
import 'package:consmed_app/data/models/dpt_model.dart';
import 'package:consmed_app/data/myDio/my_dio.dart';
import 'package:consmed_app/domain/entities/custom_response.dart';
import 'package:consmed_app/domain/entities/dpt_entity.dart';
import 'package:consmed_app/domain/repositories/use_cases/municipality_repository.dart';

class MunicipalityApi extends MunicipalityRepository {
  final MyDio _dio;
  MunicipalityApi(this._dio);

  final String _localUrl = Paths.municipality;

  @override
  Future<CustomResponse<List<DptEntity>>> getMunicipality(
      String idPadre) async {
    try {
      // final json = await _dio.request(
      //   requestType: RequestType.GET,
      //   path: "$_localUrl/?idpadre=$idPadre",
      // );
      final json = endpointMunicipality;
      await Future.delayed(const Duration(seconds: 2));
      return CustomResponse(
          status: 200,
          data: List.from((json as List)
              .map((x) => DptMapper.fromModel(DptModel.fromJson(x)))));
    } on CustomDioError catch (e) {
      return CustomResponse(
          status: e.code, message: e.message ?? e.data.toString());
    } catch (e) {
      return CustomResponse(status: 400, message: e.toString());
    }
  }
}
