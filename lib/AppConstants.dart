import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'models/AppUser.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConstants {
  static bool isOffline = false;
  static String adID = "Not Ready Yet!";
  static AppUser? currentUser;
  static double deviceWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double deviceHeigh(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static Future<String> getUserID() async{
    if(AppConstants.isOffline) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? userUID = prefs.getString('userUID');
      if (userUID == null)
        return "null";
      return userUID;
    }else {
      User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null)
        return currentUser.uid.toString();
      else
        return "null";
    }

  }
}
