import 'package:consmed_app/config/constants/paths.dart';
import 'package:consmed_app/data/json/json_fecha_actualizacion.dart';
import 'package:consmed_app/data/mappers/fecha_actualizacion_mapper.dart';
import 'package:consmed_app/data/models/fecha_actualizacion_model.dart';
import 'package:consmed_app/data/myDio/my_dio.dart';
import 'package:consmed_app/domain/entities/custom_response.dart';
import 'package:consmed_app/domain/entities/fecha_actualizacion_entity.dart';
import 'package:consmed_app/domain/repositories/use_cases/fecha_actualizacion_repository.dart';

class FechaActualizacionApi extends FechaActualizacionRepository {
  final MyDio _dio;
  FechaActualizacionApi(this._dio);

  final String _localUrl = Paths.fechaActualizacion;

  @override
  Future<CustomResponse<FechaActualizacionEntity>>
      getFechaActualizacion() async {
    try {
      // final json = await _dio.request(
      //   requestType: RequestType.GET,
      //   path: "$_localUrl/",
      // );
      final json = endpointFechaActualizacion;
      await Future.delayed(const Duration(seconds: 1));
      return CustomResponse(
          status: 200,
          data: FechaActualizacionMapper.fromModel(
              FechaActualizacionModel.fromJson(json)));
    } on CustomDioError catch (e) {
      return CustomResponse(
          status: e.code, message: e.message ?? e.data.toString());
    } catch (e) {
      return CustomResponse(status: 400, message: e.toString());
    }
  }
}
