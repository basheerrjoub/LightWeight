import 'package:flutter/material.dart';

class AppConstants {
  static double deviceWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double deviceHeigh(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}
