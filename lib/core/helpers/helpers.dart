import 'package:flutter/material.dart';

class Helpers {
  static final monthsName = {
    1: 'Janeiro 2024',
    2: 'Fevereiro 2024',
    3: 'Março 2024',
    4: 'Abril 2024',
    5: 'Maio 2024',
    6: 'Junho 2024',
    7: 'Julho 2024',
    8: 'Agosto 2024',
    9: 'Setembro 2024',
    10: 'Outubro 2024',
    11: 'Novembro 2024',
    12: 'Dezembro 2024',
  };

  static const colorPrimary = Color.fromRGBO(11, 28, 43, 1);
  static const colorEdit = Color.fromARGB(247, 15, 40, 139);


  static formatDateForBR(String dateTime) {
    final date = DateTime.parse(dateTime);
    String day = "";
    String month = "";
    String year = "";
    day = date.day.toString();
    month = date.month.toString();
    year = date.year.toString();
    return "$day/$month/$year";
  }

  static String formatDateForBRDate(DateTime dateTime) {
    List<String> months = [
      "jan.",
      "fev.",
      "mar.",
      "abr.",
      "mai.",
      "jun.",
      "jul.",
      "ago.",
      "set.",
      "out.",
      "nov.",
      "dez."
    ];

    String day = dateTime.day.toString();
    String month = months[dateTime.month - 1]; // Adjusting month index
    String year = dateTime.year.toString();

    return "$day de $month de $year";
  }
}
