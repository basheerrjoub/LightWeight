import 'package:flutter/material.dart';
import 'dart:async';
import 'profile_widgets/edit_name.dart';
import '../models/AppUser.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import '../widgets/MainDashBoard.dart';
class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = FirebaseAuth.instance.currentUser;
    final user = AppUser.fromFirebaseUser(firebaseUser);
    print('User Name: ${user.name}');

    return Scaffold(
      backgroundColor: Color(0xFF5E251C),
      body: Column(
        children: [
          AppBar(
            backgroundColor: Color(0xFF440C00),
            elevation: 4.0,
            toolbarHeight: 56.0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white,),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainDashBoard(),
                  ),
                );
              },
            ),
            title: Text('Edit Profile', style: TextStyle(fontSize: 25,color: Colors.white, fontFamily: "OnelySans"),),
          ),
          SizedBox(height: 40),
          InkWell(
            onTap: () {
              // handle tap
            },
            child: buildUserInfoDisplay(user.name, 'Name', EditNameFormPage(user: user)),
          ),

          SizedBox(height: 20),
          InkWell(
            onTap: () {
              // handle tap
            },
            child: buildUserInfoDisplay(user.name, 'Email', EditNameFormPage(user: user)),
          )

        ],
      ),
    );
  }

  // Widget builds the display item with the proper formatting to display the user's info
  Widget buildUserInfoDisplay(String getValue, String title, Widget editPage) =>
      Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 1,
              ),
              Container(
                  width: 350,
                  height: 40,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                            color: Colors.white,
                            width: 1,
                          ))),
                  child: Row(children: [
                    Expanded(

                        child: TextButton(
                            onPressed: () {
                              navigateSecondPage(editPage);
                            },
                            child: Text(
                              getValue,
                              style: TextStyle(color:Colors.white,fontSize: 22, height: 1.4),
                            ))),
                    Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.white,
                      size: 40.0,
                    )
                  ]))
            ],
          ));

  // Refrshes the Page after updating user info.
  FutureOr onGoBack(dynamic value) {
    setState(() {});
  }

  // Handles navigation and prompts refresh.
  void navigateSecondPage(Widget editForm) {
    Route route = MaterialPageRoute(builder: (context) => editForm);
    Navigator.push(context, route).then(onGoBack);
  }
}
