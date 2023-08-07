import 'package:flutter/material.dart';
import '../../models/AppUser.dart';
import '../profile_page.dart';
import '../../models/AppUser.dart';
import 'package:firebase_auth/firebase_auth.dart';
// This class handles the Page to edit the Name Section of the User Profile.
class EditNameFormPage extends StatefulWidget {
  final AppUser user;


  const EditNameFormPage({required this.user}) ;

  @override
  EditNameFormPageState createState() {
    return EditNameFormPageState();
  }
}

class EditNameFormPageState extends State<EditNameFormPage> {
  final _formKey = GlobalKey<FormState>();
  final displayNameController = TextEditingController();
  final firebaseUser = FirebaseAuth.instance.currentUser;


  @override
  void dispose() {
    displayNameController.dispose();
    super.dispose();
  }

  void updateUserValue(String name) async {
    widget.user.name = name;
    await firebaseUser?.updateDisplayName(name);

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
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
                      builder: (context) => ProfilePage(),
                    ),
                  );
                },
              ),
              title: Text('Edit Name', style: TextStyle(fontSize: 25,color: Colors.white, fontFamily: "OnelySans"),),
            ),
            SizedBox(height: 30,),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Center(
                      child: const Text(
                        "What's Your Name?",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                  Center(
                      child: Container(
                        width: 300,
                        child: TextFormField(
                          // Handles Form Validation for First Name
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            } else
                            return null;
                          },
                          decoration:
                              InputDecoration(icon: Icon(Icons.person_2),labelText: 'Display  Name'),
                          controller: displayNameController,
                        ),
                      )),
                  Padding(
                      padding: EdgeInsets.only(top: 150),
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: SizedBox(
                            width: 330,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                // Validate returns true if the form is valid, or false otherwise.
                                if (_formKey.currentState!.validate()) {
                                  updateUserValue(displayNameController.text);
                                  Navigator.pop(context);
                                }
                              },
                              child: const Text(
                                'Update',
                                style: TextStyle(fontSize: 24, fontFamily: "ROYALMOSCOW"),
                              ),
                            ),
                          )))
                ],
              ),
            ),
          ],
        ));
  }
}
