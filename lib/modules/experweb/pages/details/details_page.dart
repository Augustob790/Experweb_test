import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/helpers/helpers.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../domain/model/schedule_model.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key, required this.agenda});

  final ScheduleModel agenda;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Helpers.colorPrimary,
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
            text: "${agenda.scheduleTo} - ${agenda.victimName}",
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
        height: size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CustomText(
                text: "Cidade: ${agenda.city}",
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
                height: 0.3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CustomText(
                text: "Estado: ${agenda.state}",
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
                height: 0.3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CustomText(
                text: "Rua: ${agenda.street}",
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
                height: 0.3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CustomText(
                text: "Número: ${agenda.number}",
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
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: CustomButtonStandard(
                    onTap: () {
                      
                    },
                    color: Helpers.colorEdit,
                    isLoading: true,
                    text: "Editar",
                    height: 40,
                    width: 100,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: CustomButtonStandard(
                    onTap: () {},
                    color: Colors.red,
                    isLoading: true,
                    text: "Excluir",
                    height: 40,
                    width: 100,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
