import 'dart:async';

import 'package:experweb_app/modules/auth/presentation/store/auth_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../const/api.dart';
import '../../const/image_constant.dart';
import '../../helpers/helpers.dart';
import '../../widgets/custom_image_view.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key, required this.authStore});

  final AuthStore authStore;

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  startTimeout() {
    return Timer(const Duration(seconds: 2), verificationAuth);
  }

  verificationAuth() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('id') &&
        prefs.containsKey('name') &&
        prefs.containsKey('email') &&
        prefs.containsKey('password')) {
      await widget.authStore.checkDataUser();
      Modular.to.pushReplacementNamed('/experweb/home');
    } else {
      Modular.to.pushReplacementNamed('/auth/login');
    }
  }

  @override
  void initState() {
    super.initState();
    Apis();
    startTimeout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Helpers.colorPrimary,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(
                  top: 15.0,
                ),
                child: CustomImageView(
                  imagePath: ImageConstant.logo,
                  height: 141,
                  width: 399,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
