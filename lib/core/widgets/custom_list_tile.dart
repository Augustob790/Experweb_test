import 'package:flutter/material.dart';
import '../../modules/experweb/domain/model/user_model.dart';
import 'custom_text.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({super.key, this.onTap, required this.user});
  final User user;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color: const Color.fromRGBO(27, 44, 59, 0.85),
        child: Row(
          children: [
            Container(
              height: 45,
              width: 10,
              color: Colors.white,
            ),
            const SizedBox(
              width: 10,
            ),
            CustomText(
              text: '${user.horario} - ',
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 15,
              height: 0.13,
            ),
            CustomText(
              text: user.nome,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 15,
              height: 0.13,
            ),
          ],
        ),
      ),
    );
  }
}
