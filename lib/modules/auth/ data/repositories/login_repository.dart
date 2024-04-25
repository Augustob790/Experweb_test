import 'package:dio/dio.dart';
import 'package:experweb_app/core/const/api.dart';
import 'package:experweb_app/modules/auth/domain/model/user_model.dart';

abstract class AuthRepository {
  Future<UserModel> login(String email, String password);
}

class AuthRepositoryImpl implements AuthRepository {
  late Dio dio = Apis.dio;

  @override
  Future<UserModel> login(String email, String password) async {
    String url = 'user?email=$email&pass=$password';
    try {
      final response = await dio.get(url);
      List<UserModel> userModel = [];
      for (var satisfactionSurvey in response.data) {
        userModel.add(UserModel.fromJson(satisfactionSurvey));
      }
      return userModel.first;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw "Por favor, verifique sua conexão e tente novamente.";
      } else if (e.type == DioExceptionType.connectionError) {
        throw "Erro de conexão: $e";
      } else {
        throw e.toString();
      }
    } catch (e) {
      throw Exception("Falha no login. Por favor, tente novamente: $e");
    }
  }
}
