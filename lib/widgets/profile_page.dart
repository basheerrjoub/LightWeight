import 'package:flutter/material.dart';
import 'dart:async';
import 'profile_widgets/edit_name.dart';
import 'profile_widgets/edit_age.dart';
import 'profile_widgets/edit_height.dart';
import 'profile_widgets/edit_weight.dart';
import '../models/AppUser.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../widgets/MainDashBoard.dart';
import 'package:lightweight/AppConstants.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    AppUser? user = AppConstants.currentUser;
    print(user);


    if (user == null || AppConstants.isOffline) {
      return Scaffold(
        backgroundColor: Color(0xFF5E251C),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppBar(
              actions: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: GestureDetector(
                    onTap: () {
                      FirebaseAuth.instance.signOut();
                      Navigator.of(context).popUntil((route) => route.isFirst);
                    },
                    child: Row(
                      children: [
                        Text(
                          'Logout ',
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontFamily: "OnelySans"),
                        ),
                        Icon(
                          Icons.login,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ), // Adjust height as needed
                ),
              ],
              backgroundColor: Color(0xFF440C00),
              elevation: 4.0,
              toolbarHeight: 56.0,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MainDashBoard(),
                    ),
                  );
                },
              ),
              title: Text(
                'Edit Profile',
                style: TextStyle(
                    fontSize: 25, color: Colors.white, fontFamily: "OnelySans"),
              ),
            ),
            SizedBox(height: 40),
            Text(
              'You are Offline',
              style: TextStyle(
                  fontSize: 30, color: Colors.white, fontFamily: "OnelySans"),
            ),
            SizedBox(height: 40),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: Card(
                color: Colors.red, // Red background for the card
                elevation: 5, // Elevation to make it stand out
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 20), // Margins for the card
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.warning, // The alert icon
                        color: Colors.white,
                        size: 40, // Adjust the size as needed
                      ),
                      SizedBox(width: 10), // Space between the icon and the text
                      Expanded(
                        child: Text(
                          'Connect to the internet to access profile!',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontFamily: "OnelySans",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
              ,
            ),
          ],
        ),
      );
    }
    return Scaffold(
      backgroundColor: Color(0xFF5E251C),
      body: Column(
        children: [
          AppBar(
            actions: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: GestureDetector(
                  onTap: () {
                    FirebaseAuth.instance.signOut();
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  },
                  child: Row(
                    children: [
                      Text(
                        'Logout ',
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontFamily: "OnelySans"),
                      ),
                      Icon(
                        Icons.login,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ), // Adjust height as needed
              ),
            ],
            backgroundColor: Color(0xFF440C00),
            elevation: 4.0,
            toolbarHeight: 56.0,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainDashBoard(),
                  ),
                );
              },
            ),
            title: Text(
              'Edit Profile',
              style: TextStyle(
                  fontSize: 25, color: Colors.white, fontFamily: "OnelySans"),
            ),
          ),
          SizedBox(height: 40),
          InkWell(
            onTap: () {
              // handle tap
            },
            child: buildUserInfoDisplay(
                user.name, 'Name', EditNameFormPage(user: user)),
          ),
          SizedBox(height: 20),
          InkWell(
            onTap: () {
              // handle tap
            },
            child: buildUserInfoDisplay(
                user.age.toString(), 'Age', EditAgeFormPage(user: user)),
          ),
          SizedBox(height: 40),
          InkWell(
            onTap: () {
              // handle tap
            },
            child: buildUserInfoDisplay(user.height.toString(), 'Height',
                EditHeightFormPage(user: user)),
          ),
          SizedBox(height: 40),
          InkWell(
            onTap: () {
              // handle tap
            },
            child: buildUserInfoDisplay(user.weight.toString(), 'Weight',
                EditWeightFormPage(user: user)),
          ),
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
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  height: 1.4),
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
