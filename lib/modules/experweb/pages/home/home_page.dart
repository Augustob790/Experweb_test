import 'package:experweb_app/core/widgets/custom_text.dart';
import 'package:experweb_app/modules/auth/presentation/store/auth_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/helpers/helpers.dart';
import '../../../../core/widgets/custom_calendar.dart';
import '../../../../core/widgets/custom_list_tile.dart';
import '../../presentation/store/schedule_store.dart';
import '../create_account/create_schedule_page.dart';
import '../details/details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage(
      {super.key, required this.authStore, required this.scheduleStore});

  final AuthStore authStore;
  final ScheduleStore scheduleStore;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    inicialize();
  }

  inicialize() async {
    await widget.scheduleStore.getAllPeriods();
    await widget.scheduleStore.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Helpers.colorPrimary,
      appBar: AppBar(
        backgroundColor: Helpers.colorPrimary,
        leading: IconButton(
          onPressed: () {
            Modular.to.pushReplacementNamed('/auth/login');
          },
          icon: const Icon(
            Icons.exit_to_app,
            color: Colors.white,
          ),
        ),
        title: CustomText(
            text: "Olá,${widget.authStore.userModel?.name ?? ""}",
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            height: 0.3),
      ),
      body: Observer(builder: (context) {
        return Column(
          children: [
            const CustomCalendar(),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.separated(
                itemCount: widget.scheduleStore.scheduleModelList.length,
                itemBuilder: (context, index) {
                  final schudule =
                      widget.scheduleStore.scheduleModelList[index];
                  return CustomListTile(
                    agenda: schudule,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailsPage(
                                  agenda: schudule,
                                  scheduleStore: widget.scheduleStore,
                                  authStore: widget.authStore,
                                )),
                      );
                    },
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(height: 5);
                },
              ),
            ),
          ],
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AddNewSchudule(
                    authStore: widget.authStore,
                    scheduleStore: widget.scheduleStore)),
          );
        },
        backgroundColor: Colors.white, // Cor de fundo do botão
        shape: const CircleBorder(),
        child: const Icon(Icons.add), // Forma do botão (círculo)
      ),
    );
  }
}
