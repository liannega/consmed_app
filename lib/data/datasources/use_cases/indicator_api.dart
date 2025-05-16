import 'package:consmed_app/config/constants/paths.dart';
import 'package:consmed_app/data/json/json_medicamento.dart';
import 'package:consmed_app/data/mappers/dpt_mapper.dart';
import 'package:consmed_app/data/mappers/medicamento_mapper.dart';
import 'package:consmed_app/data/models/medicamento_model.dart';
import 'package:consmed_app/data/myDio/my_dio.dart';
import 'package:consmed_app/domain/entities/custom_response.dart';
import 'package:consmed_app/domain/entities/medicamento_entity.dart';
import 'package:consmed_app/domain/repositories/use_cases/indicator_repository.dart';

class IndicatorApi extends IndicatorRepository {
  final MyDio _dio;
  IndicatorApi(this._dio);

  final String _localUrl = Paths.indicators;

  @override
  Future<CustomResponse<List<MedicamentoEntity>>> getIndicator(
      String idDpt) async {
    try {
      // final json = await _dio.request(
      //   requestType: RequestType.GET,
      //   path: "$_localUrl/?iddpt=$idDpt",
      // );
      final json = endpointMedicamentos;
      await Future.delayed(const Duration(seconds: 2));
      return CustomResponse(
          status: 200,
          data: List.from((json as List).map((x) =>
              MedicamentoMapper.fromModel(MedicamentoModel.fromJson(x)))));
    } on CustomDioError catch (e) {
      return CustomResponse(
          status: e.code, message: e.message ?? e.data.toString());
    } catch (e) {
      return CustomResponse(status: 400, message: e.toString());
    }
  }
}
