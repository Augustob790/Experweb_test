import 'package:flutter/material.dart';

import '../../../../../core/helpers/helpers.dart';
import 'calendar_custom.dart';

class CustomDateCalendar extends StatelessWidget {
  const CustomDateCalendar(
      {super.key,
      required this.onChangedDate,
      this.initialDate,
      required this.date,
      this.positionedLeft,
      this.positionedRight,
      this.positionedBottom,
      this.positionedTop,
      this.fontSize = 16});

  final DateTime? initialDate;
  final DateTime date;
  final double? fontSize;
  final double? positionedLeft;
  final double? positionedRight;
  final double? positionedBottom;
  final double? positionedTop;
  final Function(DateTime) onChangedDate;

  @override
  Widget build(BuildContext context) {
    return CustomCalendarWidget(
      onChangedDate: onChangedDate,
      positionedTop: positionedTop,
      positionedLeft: positionedLeft,
      positionedRight: positionedRight,
      positionedBottom: positionedBottom,
      child: Container(
        height: 40,
        width: 120,
        decoration: BoxDecoration(
          border: Border.all(width: 0.2, color: Colors.white),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          gradient: const LinearGradient(end: Alignment(0.5, 10), colors: [
            Color.fromRGBO(255, 255, 255, 0.2),
            Color.fromRGBO(255, 255, 255, 0.04),
            Color.fromRGBO(255, 255, 255, 0),
          ]),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left:35.0),
              child: Text(
                Helpers.formatDateForBRDate(date),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: fontSize,
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
