// ignore_for_file: use_build_context_synchronously

import 'package:experweb_app/modules/auth/presentation/store/auth_store.dart';
import 'package:experweb_app/modules/experweb/pages/edit/edit_schedule_page.dart';
import 'package:experweb_app/modules/experweb/presentation/store/schedule_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/helpers/helpers.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../../core/widgets/scaffold_mensseger_ui.dart';
import '../../domain/model/schedule_model.dart';
import 'widgets/custom_button_create.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage(
      {super.key,
      required this.agenda,
      required this.scheduleStore,
      required this.authStore});

  final ScheduleModel agenda;
  final ScheduleStore scheduleStore;
  final AuthStore authStore;

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
                  child: CustomButtonCreateStandard(
                    onTap: () {
                      scheduleStore.dropdownTimesValue = agenda.scheduleTo;
                      scheduleStore.dateInit =
                          DateTime.parse(agenda.dateSchedule);
                      scheduleStore.nameController.text = agenda.victimName;
                      scheduleStore.cityController.text = agenda.city;
                      scheduleStore.stateController.text = agenda.state;
                      scheduleStore.streetController.text = agenda.street;
                      scheduleStore.numberController.text = agenda.number;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditNewSchedule(
                                id: agenda.id!,
                                scheduleStore: scheduleStore,
                                authStore: authStore)),
                      );
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
                  child: CustomButtonCreateStandard(
                    onTap: () async {
                      await scheduleStore.delete(agenda.id!);
                      scheduleStore.getAllPeriods();
                      Modular.to.pop();
                      MessagesUi().snackUi(context, "Excluido com Sucesso!");
                    },
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
