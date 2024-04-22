import 'package:flutter/material.dart';

showSnackBarFun(context) {
  SnackBar snackBar = const SnackBar(
    content:
        Text('Yay! A SnackBar at the top!', style: TextStyle(fontSize: 20)),
    backgroundColor: Colors.indigo,
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
