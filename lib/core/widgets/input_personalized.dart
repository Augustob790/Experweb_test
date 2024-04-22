// ignore_for_file: unnecessary_const

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputPersonalized extends StatefulWidget {
  const InputPersonalized({
    super.key,
    required this.width,
    this.icon,
    this.onTap,
    this.onEditingComplete,
    this.controller,
    this.labelText,
    this.hintText,
    this.validator,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.keyboardType,
    this.maxLength,
    this.inputFormatters,
    this.onChanged,
    this.obscureText = false,
    this.height = 60.0,
    this.border,
    required this.fontSize,
  });
  final Widget? icon;
  final double height;
  final double width;
  final double fontSize;
  final Function()? onTap;
  final Function()? onEditingComplete;
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;
  final bool obscureText;
  final TextInputType? keyboardType;
  final int? maxLength;
  final BoxBorder? border;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String)? onChanged;

  @override
  State<InputPersonalized> createState() => _InputPersonalizedState();
}

class _InputPersonalizedState extends State<InputPersonalized> {
  bool obscureText = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
        border: Border.all(width: 0.2, color: Colors.white),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        gradient: const LinearGradient(end: Alignment(0.5, 10), colors: [
          Color.fromRGBO(255, 255, 255, 0.2),
          Color.fromRGBO(255, 255, 255, 0.04),
          Color.fromRGBO(255, 255, 255, 0),
        ]),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: SizedBox(
              width: 15,
              child: widget.icon,
            ),
          ),
          Container(width: 12),
          SizedBox(
            width: kIsWeb ? widget.width - 80 : widget.width - 40,
            height: widget.height,
            child: Center(
              child: TextFormField(
                maxLength: widget.maxLength,
                keyboardType: widget.keyboardType,
                obscureText: widget.obscureText,
                autovalidateMode: widget.autovalidateMode,
                controller: widget.controller,
                style: TextStyle(
                    fontFamily: 'Manrope',
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: widget.fontSize),
                inputFormatters: widget.inputFormatters,
                onEditingComplete: widget.onEditingComplete,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintText: widget.hintText,
                  labelText: widget.labelText,
                  // suffixIcon: IconButton(
                  //   icon: Icon(
                  //     color: Colors.white,
                  //     widget.obscureText
                  //         ? Icons.visibility
                  //         : Icons.visibility_off,
                  //   ),
                  //   onPressed: () {
                  //     setState(() {
                  //       _obscureText = !_obscureText;
                  //     });
                  //   },
                  // ),
                  labelStyle: TextStyle(
                      fontFamily: 'Nunito',
                      color: Colors.white,
                      fontSize: widget.fontSize),
                  errorStyle: const TextStyle(
                      fontFamily: 'Nunito', color: Colors.red, fontSize: 12),
                  counterText: "",
                ),
                validator: widget.validator,
                onChanged: widget.onChanged,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
