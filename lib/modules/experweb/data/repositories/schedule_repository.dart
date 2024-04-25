import 'package:dio/dio.dart';
import 'package:experweb_app/core/const/api.dart';

abstract class ScheduleRepository {}

class ScheduleRepositoryImpl implements ScheduleRepository {
  late Dio dio = Apis.dio;

}
