import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../domain/model/user_model.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key, this.user});

  final User? user;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(11, 28, 43, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(43, 60, 79, 1),
        leading: IconButton(
          onPressed: () {
            Modular.to.pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: CustomText(
            text: "${user?.horario} - ${user?.nome}",
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            height: 0.3),
      ),
      body: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(35),
              bottomRight: Radius.circular(35)),
          color: Color.fromRGBO(43, 60, 79, 1),
        ),
        width: size.width,
        height: 170,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CustomText(
                text: "Cidade: ${user?.cidade}",
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
                height: 0.3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CustomText(
                text: "Estado: ${user?.estado}",
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
                height: 0.3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CustomText(
                text: "Rua: ${user?.rua}",
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
                height: 0.3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CustomText(
                text: "Número: ${user?.numero}",
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
                height: 0.3,
              ),
            ),
            Center(
              child: IconButton(
                  onPressed: () {
                    Modular.to.pop();
                  },
                  icon: const Icon(
                    Icons.keyboard_arrow_up,
                    color: Colors.white,
                    size: 30,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
