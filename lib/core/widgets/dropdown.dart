import 'package:experweb_app/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class DropdownButtonForm extends StatelessWidget {
  const DropdownButtonForm(
      {super.key,
      required this.onTap,
      required this.value,
      required this.lists,
      this.initialValue,
      this.validator,
      this.color});
  final Function(String?) onTap;
  final String? value;
  final List<String> lists;
  final String? initialValue;
  final String? Function(String?)? validator;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      validator: validator,
      icon: const Icon(
        Icons.keyboard_arrow_down,
        color: Color.fromARGB(143, 157, 157, 157),
      ),
      decoration: const InputDecoration(border: InputBorder.none),
      value: initialValue ?? value,
      onChanged: onTap,
      items: lists.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: CustomText(
              text: value,
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w400,
              height: 0.3,
            ),
          ),
        );
      }).toList(),
    );
  }
}
