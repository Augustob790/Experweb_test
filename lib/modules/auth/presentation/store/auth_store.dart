// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../domain/model/user_model.dart';
import '../../domain/usecases/get_user_login_use_case.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  final GetUserLoginUsecase getUserLoginUsecase;
  final loginFormKey = GlobalKey<FormState>();

  _AuthStoreBase({
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
    Modular.to.pushReplacementNamed('/auth/login');
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
}
