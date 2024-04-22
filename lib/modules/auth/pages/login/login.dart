import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../core/const/image_constant.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_image_view.dart';
import '../../../../core/widgets/custom_snackbar.dart';
import '../../../../core/widgets/input_personalized.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loginFormKey = GlobalKey<FormState>();
    TextEditingController emailController = TextEditingController();

    TextEditingController passwordController = TextEditingController();
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        color: const Color.fromRGBO(11, 28, 43, 1),
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
                        controller: emailController,
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
                        controller: passwordController,
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
                                Modular.to.pushReplacementNamed('/experweb/home');

                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(CustomSnackBar(
                              size: size,
                              message: 'Usuário e senha inválidos',
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