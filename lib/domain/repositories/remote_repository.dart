import 'package:consmed_app/domain/repositories/use_cases/fecha_actualizacion_repository.dart';
import 'package:consmed_app/domain/repositories/use_cases/indicator_repository.dart';
import 'package:consmed_app/domain/repositories/use_cases/municipality_repository.dart';
import 'package:consmed_app/domain/repositories/use_cases/pharmacy_repository.dart';
import 'package:consmed_app/domain/repositories/use_cases/province_repository.dart';

abstract class RemoteRepository {
  ProvinceRepository get province;
  PharmacyRepository get pharmacy;
  IndicatorRepository get indicator;
  MunicipalityRepository get municipality;
  FechaActualizacionRepository get fechaActualizacion;
}