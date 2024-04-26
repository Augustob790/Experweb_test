import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_text.dart';


class CustomButtonCreateStandard extends StatelessWidget {
  const CustomButtonCreateStandard({
    super.key,
    required this.onTap,
    required this.text,
    this.isLoading = false,
    required this.height,
    required this.width,
    this.color = Colors.orangeAccent,
    this.margin,
    this.size = 18.0,
  });

  final Function() onTap;
  final String text;
  final bool isLoading;
  final double height;
  final double width;
  final EdgeInsetsGeometry? margin;
  final Color? color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        margin: margin,
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          border: Border.all(width: 0.2, color: Colors.black),
          // gradient: const LinearGradient(end: Alignment(0, 1), colors: [
          //   Color.fromRGBO(27, 44, 59, 1),
          //   Color.fromRGBO(11, 28, 43, 1),
          // ]),
        ),
        child: Center(
          child: isLoading
              ? CustomText(
                  text: text,
                  fontSize: size,
                  height: 0.08,
                  fontWeight: FontWeight.w500,
                )
              : Container(
                  height: height,
                  width: width,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.grey,
                  ),
                  child: const Center(
                    child: SizedBox(
                      width: 25,
                      height: 25,
                      child: CircularProgressIndicator(
                          backgroundColor: Color(0xFF947CCD),
                          color: Colors.amber),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
