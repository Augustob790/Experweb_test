import 'package:experweb_app/core/widgets/custom_text.dart';
import 'package:experweb_app/modules/auth/presentation/store/auth_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/helpers/helpers.dart';
import '../../../../core/widgets/custom_calendar.dart';
import '../../../../core/widgets/custom_list_tile.dart';
import '../details/details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.authStore});

  final AuthStore authStore;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(11, 28, 43, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(11, 28, 43, 1),
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
      body: Column(
        children: [
          const CustomCalendar(),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.separated(
              itemCount: Helpers.user.length,
              itemBuilder: (context, index) {
                final user = Helpers.user[index];
                return CustomListTile(
                  user: user,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailsPage(user: user)),
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
      ),
    );
  }
}
