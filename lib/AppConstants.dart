import 'package:flutter/material.dart';
import 'models/AppUser.dart';
class AppConstants {
  static AppUser? currentUser;
  static double deviceWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double deviceHeigh(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}
