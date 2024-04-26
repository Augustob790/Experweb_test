// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/const/image_constant.dart';
import '../../../../core/helpers/helpers.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_image_view.dart';
import '../../../../core/widgets/custom_snackbar.dart';
import '../../../../core/widgets/input_personalized.dart';
import '../../presentation/store/auth_store.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.authStore});

  final AuthStore authStore;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

//Rasheed.Rodriguez16@hotmail.com
//zKAi7T9AtmzpLqE

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
    widget.authStore.deletePreferenceUserUsecase();
  }

  @override
  Widget build(BuildContext context) {
    final loginFormKey = GlobalKey<FormState>();
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        color: Helpers.colorPrimary,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(
                  top: 150,
                  bottom: 10,
                ),
                alignment: Alignment.center,
                child: CustomImageView(
                  imagePath: ImageConstant.logo,
                  height: 141,
                  width: 399,
                ),
              ),
              Form(
                key: loginFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: InputPersonalized(
                        icon: const Icon(Icons.person_outlined,
                            color: Colors.white),
                        controller: widget.authStore.emailController,
                        labelText: 'E-mail',
                        keyboardType: TextInputType.emailAddress,
                        autovalidateMode: AutovalidateMode.disabled,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Informe o email corretamente!';
                          }
                          return null;
                        },
                        height: 55,
                        width: size.width / 1.15,
                        fontSize: 12,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                      child: InputPersonalized(
                        icon:
                            const Icon(Icons.key_outlined, color: Colors.white),
                        controller: widget.authStore.passwordController,
                        labelText: 'Senha',
                        obscureText: true,
                        autovalidateMode: AutovalidateMode.disabled,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Informa sua senha!';
                          } else if (value.length < 6) {
                            return 'Sua senha deve ter no mínimo 6 caracteres';
                          }
                          return null;
                        },
                        height: 55,
                        width: size.width / 1.15,
                        fontSize: 12,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () => {},
                              child: const Text(
                                'Esqueci minha senha',
                                style: TextStyle(color: Colors.white),
                              )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: CustomButtonStandard(
                        onTap: () async {
                          if (loginFormKey.currentState!.validate()) {
                            try {
                              await widget.authStore.login(
                                  widget.authStore.emailController.text,
                                  widget.authStore.passwordController.text);
                              Modular.to.pushReplacementNamed('/experweb/home');
                              widget.authStore.dispose();
                            } catch (e) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(CustomSnackBar(
                                size: size,
                                message: '$e',
                              ));
                            }
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(CustomSnackBar(
                              size: size,
                              message: 'Prencha todos os campos!',
                            ));
                          }
                        },
                        color: const Color(0xFF947CCD),
                        isLoading: true,
                        text: "Acessar",
                        height: 40,
                        width: size.width / 1.15,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
