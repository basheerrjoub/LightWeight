import 'package:flutter/material.dart';

void showCustomSnackBar(BuildContext context, String message,
    {bool isError = true, String title = "Error"}) {
  final snackBar = SnackBar(
    content: Text(
      message,
      style: TextStyle(
        fontSize: 20.0,
        fontFamily: 'ROYALMOSCOW'
      ),
    ),
    backgroundColor:
    isError ? Colors.red.withOpacity(0.2) : Colors.green.withOpacity(0.2),
    duration: Duration(seconds: 2),
    behavior: SnackBarBehavior.floating,
    action: SnackBarAction(
      label: 'DISMISS',
      onPressed: () {},
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
