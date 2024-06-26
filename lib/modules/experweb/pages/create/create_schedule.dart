// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/helpers/scaffold_mensseger_ui.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../../core/widgets/dropdown.dart';
import '../../../../core/widgets/input_personalized.dart';
import '../../../auth/presentation/store/auth_store.dart';
import '../../domain/model/schedule_model.dart';
import '../../presentation/store/schedule_store.dart';
import '../edit/widgets/custom_calendar_create.dart';

class CreateSchedulePage extends StatefulWidget {
  const CreateSchedulePage(
      {super.key, required this.scheduleStore, required this.authStore});

  final ScheduleStore scheduleStore;
  final AuthStore authStore;

  @override
  State<CreateSchedulePage> createState() => _CreateSchedulePageState();
}

class _CreateSchedulePageState extends State<CreateSchedulePage> {
  final addNewFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(43, 60, 79, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(43, 60, 79, 1),
        leading: IconButton(
          onPressed: () {
            Modular.to.pushNamed('/experweb/home');
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: CustomText(
            text: "Adicionar uma consulta",
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            height: 0.3),
      ),
      body: SizedBox(
        height: size.height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 55,
                  width: size.width / 1.15,
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.2, color: Colors.white),
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    gradient:
                        const LinearGradient(end: Alignment(0.5, 10), colors: [
                      Color.fromRGBO(255, 255, 255, 0.2),
                      Color.fromRGBO(255, 255, 255, 0.04),
                      Color.fromRGBO(255, 255, 255, 0),
                    ]),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: DropdownButtonForm(
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Selecione a categoria';
                        }
                        return null;
                      },
                      onTap: (String? value) {
                        widget.scheduleStore.onSelectedCategory(value ?? "");
                      },
                      value: widget.scheduleStore.dropdownTimesValue,
                      lists: widget.scheduleStore.times,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                    width: size.width / 1.15,
                    height: 55,
                    child: CustomDateCalendar(
                      date: widget.scheduleStore.dateInit,
                      fontSize: 15,
                      onChangedDate: (DateTime date) {
                        setState(() {
                          widget.scheduleStore.initializeInit(date);
                        });
                      },
                      positionedLeft: 65,
                      positionedTop: 150,
                    )),
              ),
              Form(
                key: addNewFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: InputPersonalized(
                        controller: widget.scheduleStore.nameController,
                        labelText: 'Nome',
                        keyboardType: TextInputType.name,
                        autovalidateMode: AutovalidateMode.disabled,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Digite seu nome!';
                          }
                          return null;
                        },
                        height: 55,
                        width: size.width / 1.15,
                        fontSize: 15,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: InputPersonalized(
                        controller: widget.scheduleStore.streetController,
                        labelText: 'Rua',
                        autovalidateMode: AutovalidateMode.disabled,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Informe seu endereço!';
                          }
                          return null;
                        },
                        height: 55,
                        width: size.width / 1.15,
                        fontSize: 15,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: InputPersonalized(
                        controller: widget.scheduleStore.numberController,
                        labelText: 'Número',
                        autovalidateMode: AutovalidateMode.disabled,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Informe seu endereço!';
                          }
                          return null;
                        },
                        height: 55,
                        width: size.width / 1.15,
                        fontSize: 15,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: InputPersonalized(
                        controller: widget.scheduleStore.cityController,
                        labelText: 'Cidade',
                        autovalidateMode: AutovalidateMode.disabled,
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Informe seu endereço!';
                          }
                          return null;
                        },
                        height: 55,
                        width: size.width / 1.15,
                        fontSize: 15,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: InputPersonalized(
                        controller: widget.scheduleStore.stateController,
                        labelText: 'Estado',
                        autovalidateMode: AutovalidateMode.disabled,
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Informe seu endereço!';
                          }
                          return null;
                        },
                        height: 55,
                        width: size.width / 1.15,
                        fontSize: 15,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: CustomButtonStandard(
                          onTap: () async {
                            if (addNewFormKey.currentState!.validate()) {
                              try {
                                await widget.scheduleStore.insert(
                                  ScheduleModel(
                                    scheduleTo:
                                        widget.scheduleStore.dropdownTimesValue,
                                    dateSchedule: widget.scheduleStore.dateInit
                                        .toIso8601String(),
                                    victimName: widget
                                        .scheduleStore.nameController.text,
                                    professionalId: int.parse(
                                        widget.authStore.userModel?.id ?? ""),
                                    city: widget
                                        .scheduleStore.cityController.text,
                                    state: widget
                                        .scheduleStore.stateController.text,
                                    street: widget
                                        .scheduleStore.streetController.text,
                                    number: widget
                                        .scheduleStore.numberController.text,
                                  ),
                                );
                                await widget.scheduleStore.getAllPeriods();
                                widget.scheduleStore.dispose();
                                Navigator.pop(context);
                              } catch (e) {
                                MessagesUi().snackE(context, e.toString());
                              }
                            } else {
                              MessagesUi()
                                  .snackUi(context, "Prencha todos os campos!");
                            }
                          },
                          color: const Color(0xFF947CCD),
                          isLoading:
                              widget.scheduleStore.isLoading == "isLoading"
                                  ? false
                                  : true,
                          text: "Cadastrar",
                          height: 40,
                          width: size.width / 1.15),
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
