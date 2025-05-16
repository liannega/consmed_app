 import 'package:consmed_app/data/datasources/use_cases/fecha_actualizacion_api.dart';
import 'package:consmed_app/data/datasources/use_cases/indicator_api.dart';
import 'package:consmed_app/data/datasources/use_cases/municipality_api.dart';
import 'package:consmed_app/data/datasources/use_cases/pharmacy_api.dart';
import 'package:consmed_app/data/datasources/use_cases/province_api.dart';
import 'package:consmed_app/data/myDio/my_dio.dart';
import 'package:consmed_app/domain/repositories/remote_repository.dart';
import 'package:consmed_app/domain/repositories/use_cases/fecha_actualizacion_repository.dart';
import 'package:consmed_app/domain/repositories/use_cases/indicator_repository.dart';
import 'package:consmed_app/domain/repositories/use_cases/municipality_repository.dart';
import 'package:consmed_app/domain/repositories/use_cases/pharmacy_repository.dart';
import 'package:consmed_app/domain/repositories/use_cases/province_repository.dart';

class ApiConsumer extends RemoteRepository{
  late MyDio _dio;

  late FechaActualizacionApi _fechaActualizacionApi;
  late IndicatorApi _indicatorApi;
  late MunicipalityApi _municipalityApi;
  late PharmacyApi _pharmacyApi;
  late ProvinceApi _provinceApi;

  ApiConsumer(){
    _dio = MyDio();
    _fechaActualizacionApi = FechaActualizacionApi(_dio);
    _indicatorApi = IndicatorApi(_dio);
    _municipalityApi = MunicipalityApi(_dio);
    _pharmacyApi = PharmacyApi(_dio);
    _provinceApi = ProvinceApi(_dio);
  }
  @override
  FechaActualizacionRepository get fechaActualizacion => _fechaActualizacionApi;

  @override
  IndicatorRepository get indicator => _indicatorApi;

  @override
  MunicipalityRepository get municipality => _municipalityApi;

  @override
  PharmacyRepository get pharmacy => _pharmacyApi;

  @override
  ProvinceRepository get province => _provinceApi;
  
}