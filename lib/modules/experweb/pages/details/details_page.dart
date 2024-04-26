// ignore_for_file: use_build_context_synchronously, must_be_immutable

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

class DetailsPage extends StatefulWidget {
  DetailsPage(
      {super.key,
      this.agenda,
      required this.scheduleStore,
      required this.authStore});

  ScheduleModel? agenda;
  final ScheduleStore scheduleStore;
  final AuthStore authStore;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
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
            text: "${widget.agenda?.scheduleTo} - ${widget.agenda?.victimName}",
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
                text: "Nome: ${widget.agenda?.victimName}",
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
                height: 0.3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CustomText(
                text: "Horário: ${widget.agenda?.scheduleTo}",
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
                height: 0.3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CustomText(
                text:
                    "Data: ${Helpers.formatDateForBR(widget.agenda!.dateSchedule)}",
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
                height: 0.3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CustomText(
                text: "Rua: ${widget.agenda?.street}",
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
                height: 0.3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CustomText(
                text: "Número: ${widget.agenda?.number}",
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
                height: 0.3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CustomText(
                text: "Cidade: ${widget.agenda?.city}",
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
                height: 0.3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CustomText(
                text: "Estado: ${widget.agenda?.state}",
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
                      widget.scheduleStore.dropdownTimesValue =
                          widget.agenda!.scheduleTo;
                      widget.scheduleStore.dateInit =
                          DateTime.parse(widget.agenda!.dateSchedule);
                      widget.scheduleStore.nameController.text =
                          widget.agenda!.victimName;
                      widget.scheduleStore.cityController.text =
                          widget.agenda!.city;
                      widget.scheduleStore.stateController.text =
                          widget.agenda!.state;
                      widget.scheduleStore.streetController.text =
                          widget.agenda!.street;
                      widget.scheduleStore.numberController.text =
                          widget.agenda!.number;
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditNewSchedule(
                                id: widget.agenda!.id!,
                                scheduleStore: widget.scheduleStore,
                                authStore: widget.authStore)),
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
                      await widget.scheduleStore.delete(widget.agenda!.id!);
                      widget.scheduleStore.getAllPeriods();
                      MessagesUi().snackUi(context, "Excluido com Sucesso!");
                      Modular.to.pop();
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
