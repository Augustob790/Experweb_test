import 'package:dio/dio.dart';
import 'package:experweb_app/core/const/api.dart';
import 'package:experweb_app/modules/auth/domain/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthRepository {
  Future<UserModel> login(String email, String password);
  Future<UserModel> checkDataSave();
}

class AuthRepositoryImpl implements AuthRepository {
  late Dio dio = Apis.dio;

  @override
  Future<UserModel> login(String email, String password) async {
    String url = 'user?email=$email&pass=$password';
    try {
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        List<UserModel> userModel = [];
        for (var satisfactionSurvey in response.data) {
          userModel.add(UserModel.fromJson(satisfactionSurvey));
        }
        await saveDataUser(userModel.first);
        return userModel.first;
      } else if (response.statusCode == 404) {
        throw "Verifique suas crendencias!";
      } else {
        throw "Falha no login. Por favor, tente novamente";
      }
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

  Future<void> saveDataUser(UserModel user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('id', user.id);
    prefs.setString('name', user.name);
    prefs.setString('email', user.email);
    prefs.setString('password', user.password);
  }

  @override
  Future<UserModel> checkDataSave() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.containsKey('id') &&
        prefs.containsKey('name') &&
        prefs.containsKey('email') &&
        prefs.containsKey('password')) {
      var map = {
        'id': prefs.getString('id') ?? "",
        'name': prefs.getString('name') ?? '',
        'email': prefs.getString('email') ?? '',
        'password': prefs.getString('password') ?? '',
      };
      return UserModel.fromJson(map);
    } else {
      return UserModel(
        name: "",
        email: "",
        password: "",
        id: "",
      );
    }
  }
}
