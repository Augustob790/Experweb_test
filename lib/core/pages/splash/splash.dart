import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../const/api.dart';
import '../../const/image_constant.dart';
import '../../widgets/custom_image_view.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  startTimeout() {
    return Timer(const Duration(seconds: 2), verificationAuth);
  }

  verificationAuth() async {
    Modular.to.pushReplacementNamed('/auth/login');
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
        color: const Color.fromRGBO(11, 28, 43, 1),
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
