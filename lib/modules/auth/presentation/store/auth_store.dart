// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/model/user_model.dart';
import '../../domain/usecases/check_data_user_use_case.dart';
import '../../domain/usecases/get_user_login_use_case.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  final GetUserLoginUsecase getUserLoginUsecase;
  final CheckDataUserUsecase checkDataUserUsecase;
  final loginFormKey = GlobalKey<FormState>();

  _AuthStoreBase({
    required this.checkDataUserUsecase,
    required this.getUserLoginUsecase,
  });

  @observable
  TextEditingController emailController = TextEditingController();

  @observable
  TextEditingController passwordController = TextEditingController();

  @observable
  dynamic errorMessage;

  @observable
  dynamic isLoading;

  @observable
  UserModel? userModel;

  @action
  logout() async {
    deletePreferenceUserUsecase();
    Modular.to.pushNamedAndRemoveUntil('/auth/login', (route) => false);
  }

  @action
  dispose() async {
    emailController.clear();
    passwordController.clear();
  }

  @action
  Future<UserModel?> login(String email, String password) async {
    isLoading = "isLoading";
    try {
      final response = await getUserLoginUsecase(email, password);
      userModel = response;
      isLoading = "sucess";
      return userModel;
    } catch (e) {
      isLoading = "error";
      throw e.toString();
    }
  }

  @action
  Future<UserModel> checkDataUser() async {
    isLoading = "isLoading";
    try {
      final response = await checkDataUserUsecase();
      userModel = response;
      isLoading = "sucess";
      return userModel!;
    } catch (e) {
      isLoading = "error";
      throw e.toString();
    }
  }

  @action
  Future<void> deletePreferenceUserUsecase() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('email');
    prefs.remove('id');
    prefs.remove('name');
    prefs.remove('password');
  }
}
