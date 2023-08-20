import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../Animation/Fade_Animation.dart';
import '../../Colors/Hex_Color.dart';
import '../customize/show_custom_message.dart';
import 'login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

enum FormData { Name, Email, Gender, Weight, Height, Age, password, ConfirmPassword }

class SignupScreen extends StatefulWidget {
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  Color enabled = const Color.fromARGB(255, 63, 56, 89);
  Color enabledtxt = Colors.white;
  Color deaible = Colors.grey;
  Color backgroundColor = const Color(0xFF1F1A30);
  bool ispasswordev = true;

  FormData? selected;
  String? selectedGender;
  List<String> genders = ['Male', 'Female'];


  TextEditingController nameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController weightController = new TextEditingController();
  TextEditingController heightController = new TextEditingController();
  TextEditingController ageController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController confirmPasswordController = new TextEditingController();

  bool isValidEmail(String email) {
    Pattern pattern =
        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$';
    RegExp regex = RegExp(pattern.toString());
    return regex.hasMatch(email);
  }

  bool isValidPassword(String password) {
    // At least 8 characters, includes a number and a special character
    Pattern pattern = r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d!$%@#£€*?&]{8,}$';
    RegExp regex = RegExp(pattern.toString());
    return regex.hasMatch(password);
  }


  Future<bool> signUp(BuildContext context) async {
    // Check if the fields are not empty
    if (emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        nameController.text.isEmpty ||
        weightController.text.isEmpty ||
        heightController.text.isEmpty ||
        ageController.text.isEmpty) {
      showCustomSnackBar(context, "All fields are required.");
      return false;
    }

    // Check email and password validity
    if (!isValidEmail(emailController.text.trim())) {
      showCustomSnackBar(context, "Enter a valid email.");
      return false;
    }
    if (!isValidPassword(passwordController.text.trim())) {
      showCustomSnackBar(
          context, "Password must be at least 8 characters and include a number.");
      return false;
    }

    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      String uid = userCredential.user!.uid;

      await FirebaseFirestore.instance.collection('users').doc(uid).set({
        'name': nameController.text.trim(),
        'email': emailController.text.trim(),
        'weight': weightController.text.trim(),
        'height': heightController.text.trim(),
        'age': ageController.text.trim(),
        'gender': selectedGender.toString()
      });

      showCustomSnackBar(context, "Registration successful!", isError: false);
      return true;
    } on FirebaseAuthException catch (e) {
      showCustomSnackBar(context, "Error while Authentication: ${e.message}");
      return false;
    } catch (e) {
      showCustomSnackBar(context, "Unexpected error: ${e.toString()}");
      return false;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: const [0.1, 0.4, 0.7, 0.9],
            colors: [
              HexColor("#7c4293").withOpacity(0.8),
              HexColor("#9a447b"),
              HexColor("#d74141"),
              HexColor("#d20401")
            ],
          ),
          image: DecorationImage(
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                HexColor("#fff").withOpacity(0.7), BlendMode.dstATop),
            image: const AssetImage(
              'assets/images/background_auth.png',
            ),
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  elevation: 5,
                  color:
                  const Color.fromARGB(255, 171, 211, 250).withOpacity(0.4),
                  child: Container(
                    width: 400,
                    padding: const EdgeInsets.all(40.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FadeAnimation(
                          delay: 0.8,
                          child:  Image.asset('assets/images/logo1024x1024.png', width: 150, height: 150,),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        FadeAnimation(
                          delay: 1,
                          child: Container(
                            child: Text(
                              "Create your account",
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.9),
                                  letterSpacing: 0.5),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        FadeAnimation(
                          delay: 1,
                          child: Container(
                            width: 300,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              color: selected == FormData.Email
                                  ? enabled
                                  : backgroundColor,
                            ),
                            padding: const EdgeInsets.all(5.0),
                            child: TextField(
                              controller: nameController,
                              onTap: () {
                                setState(() {
                                  selected = FormData.Name;
                                });
                              },
                              decoration: InputDecoration(
                                enabledBorder: InputBorder.none,
                                border: InputBorder.none,
                                prefixIcon: Icon(
                                  Icons.title,
                                  color: selected == FormData.Name
                                      ? enabledtxt
                                      : deaible,
                                  size: 20,
                                ),
                                hintText: 'Full Name',
                                hintStyle: TextStyle(
                                    color: selected == FormData.Name
                                        ? enabledtxt
                                        : deaible,
                                    fontSize: 12),
                              ),
                              textAlignVertical: TextAlignVertical.center,
                              style: TextStyle(
                                  color: selected == FormData.Name
                                      ? enabledtxt
                                      : deaible,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        FadeAnimation(
                          delay: 1,
                          child: Container(
                            width: 300,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              color: selected == FormData.Age
                                  ? enabled
                                  : backgroundColor,
                            ),
                            padding: const EdgeInsets.all(5.0),
                            child: TextField(

                              keyboardType: TextInputType.number,
                              controller: ageController,  // Assuming you have an ageController defined elsewhere
                              onTap: () {
                                setState(() {
                                  selected = FormData.Age;
                                });
                              },

                              decoration: InputDecoration(
                                enabledBorder: InputBorder.none,
                                border: InputBorder.none,
                                prefixIcon: Icon(
                                  Icons.cake,  // Icon representing age/birthday
                                  color: selected == FormData.Age
                                      ? enabledtxt
                                      : deaible,
                                  size: 20,
                                ),
                                hintText: 'Age',
                                hintStyle: TextStyle(
                                    color: selected == FormData.Age
                                        ? enabledtxt
                                        : deaible,
                                    fontSize: 12),
                              ),
                              textAlignVertical: TextAlignVertical.center,
                              style: TextStyle(
                                  color: selected == FormData.Age
                                      ? enabledtxt
                                      : deaible,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        FadeAnimation(
                          delay: 1,
                          child: Container(
                            width: 300,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              color: selected == FormData.Weight
                                  ? enabled
                                  : backgroundColor,
                            ),
                            padding: const EdgeInsets.all(5.0),
                            child: TextField(

                              keyboardType: TextInputType.number,
                              controller: weightController,  // Assuming you have an ageController defined elsewhere
                              onTap: () {
                                setState(() {
                                  selected = FormData.Weight;
                                });
                              },

                              decoration: InputDecoration(
                                enabledBorder: InputBorder.none,
                                border: InputBorder.none,
                                prefixIcon: Icon(
                                  Icons.fitness_center,  // Icon representing age/birthday
                                  color: selected == FormData.Weight
                                      ? enabledtxt
                                      : deaible,
                                  size: 20,
                                ),
                                hintText: 'Weight',
                                hintStyle: TextStyle(
                                    color: selected == FormData.Weight
                                        ? enabledtxt
                                        : deaible,
                                    fontSize: 12),
                              ),
                              textAlignVertical: TextAlignVertical.center,
                              style: TextStyle(
                                  color: selected == FormData.Weight
                                      ? enabledtxt
                                      : deaible,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                        FadeAnimation(
                          delay: 1,
                          child: Container(
                            width: 300,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              color: selected == FormData.Height
                                  ? enabled
                                  : backgroundColor,
                            ),
                            padding: const EdgeInsets.all(5.0),
                            child: TextField(

                              keyboardType: TextInputType.number,
                              controller: heightController,  // Assuming you have an ageController defined elsewhere
                              onTap: () {
                                setState(() {
                                  selected = FormData.Height;
                                });
                              },

                              decoration: InputDecoration(
                                enabledBorder: InputBorder.none,
                                border: InputBorder.none,
                                prefixIcon: Icon(
                                  Icons.height,  // Icon representing age/birthday
                                  color: selected == FormData.Height
                                      ? enabledtxt
                                      : deaible,
                                  size: 20,
                                ),
                                hintText: 'Height',
                                hintStyle: TextStyle(
                                    color: selected == FormData.Height
                                        ? enabledtxt
                                        : deaible,
                                    fontSize: 12),
                              ),
                              textAlignVertical: TextAlignVertical.center,
                              style: TextStyle(
                                  color: selected == FormData.Height
                                      ? enabledtxt
                                      : deaible,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                          ),
                        ),

                        const SizedBox(
                          height: 20,
                        ),
                        FadeAnimation(
                          delay: 1, // Incrementing the delay for the new widget
                          child: Container(
                            width: 300,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              color: selected == FormData.Gender
                                  ? enabled
                                  : backgroundColor,
                            ),
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: Icon(
                                    Icons.person, // Icon representing gender
                                    color: selected == FormData.Gender
                                        ? enabledtxt
                                        : deaible,
                                    size: 20,
                                  ),
                                ),

                                Expanded(
                                  child: DropdownButtonHideUnderline( // Hide the underline to make it blend in
                                    child: DropdownButton<String>(
                                      isExpanded: true, // Ensures that dropdown is aligned properly
                                      items: <String>['Male', 'Female'].map((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,

                                          child: Text(value, style: TextStyle(fontSize: 12, color: Colors.grey),),
                                        );
                                      }).toList(),
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          selectedGender = newValue;
                                          selected = FormData.Gender;
                                        });
                                      },
                                      value: selectedGender,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),


                        const SizedBox(
                          height: 20,
                        ),


                        FadeAnimation(
                          delay: 1,
                          child: Container(
                            width: 300,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              color: selected == FormData.Email
                                  ? enabled
                                  : backgroundColor,
                            ),
                            padding: const EdgeInsets.all(5.0),
                            child: TextField(
                              controller: emailController,
                              onTap: () {
                                setState(() {
                                  selected = FormData.Email;
                                });
                              },
                              decoration: InputDecoration(
                                enabledBorder: InputBorder.none,
                                border: InputBorder.none,
                                prefixIcon: Icon(
                                  Icons.email_outlined,
                                  color: selected == FormData.Email
                                      ? enabledtxt
                                      : deaible,
                                  size: 20,
                                ),
                                hintText: 'Email',
                                hintStyle: TextStyle(
                                    color: selected == FormData.Email
                                        ? enabledtxt
                                        : deaible,
                                    fontSize: 12),
                              ),
                              textAlignVertical: TextAlignVertical.center,
                              style: TextStyle(
                                  color: selected == FormData.Email
                                      ? enabledtxt
                                      : deaible,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        FadeAnimation(
                          delay: 1,
                          child: Container(
                            width: 300,
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                color: selected == FormData.password
                                    ? enabled
                                    : backgroundColor),
                            padding: const EdgeInsets.all(5.0),
                            child: TextField(
                              controller: passwordController,
                              onTap: () {
                                setState(() {
                                  selected = FormData.password;
                                });
                              },
                              decoration: InputDecoration(
                                  enabledBorder: InputBorder.none,
                                  border: InputBorder.none,
                                  prefixIcon: Icon(
                                    Icons.lock_open_outlined,
                                    color: selected == FormData.password
                                        ? enabledtxt
                                        : deaible,
                                    size: 20,
                                  ),
                                  suffixIcon: IconButton(
                                    icon: ispasswordev
                                        ? Icon(
                                      Icons.visibility_off,
                                      color: selected == FormData.password
                                          ? enabledtxt
                                          : deaible,
                                      size: 20,
                                    )
                                        : Icon(
                                      Icons.visibility,
                                      color: selected == FormData.password
                                          ? enabledtxt
                                          : deaible,
                                      size: 20,
                                    ),
                                    onPressed: () => setState(
                                            () => ispasswordev = !ispasswordev),
                                  ),
                                  hintText: 'Password',
                                  hintStyle: TextStyle(
                                      color: selected == FormData.password
                                          ? enabledtxt
                                          : deaible,
                                      fontSize: 12)),
                              obscureText: ispasswordev,
                              textAlignVertical: TextAlignVertical.center,
                              style: TextStyle(
                                  color: selected == FormData.password
                                      ? enabledtxt
                                      : deaible,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        FadeAnimation(
                          delay: 1,
                          child: Container(
                            width: 300,
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                color: selected == FormData.ConfirmPassword
                                    ? enabled
                                    : backgroundColor),
                            padding: const EdgeInsets.all(5.0),
                            child: TextField(
                              controller: confirmPasswordController,
                              onTap: () {
                                setState(() {
                                  selected = FormData.ConfirmPassword;
                                });
                              },
                              decoration: InputDecoration(
                                  enabledBorder: InputBorder.none,
                                  border: InputBorder.none,
                                  prefixIcon: Icon(
                                    Icons.lock_open_outlined,
                                    color: selected == FormData.ConfirmPassword
                                        ? enabledtxt
                                        : deaible,
                                    size: 20,
                                  ),
                                  suffixIcon: IconButton(
                                    icon: ispasswordev
                                        ? Icon(
                                      Icons.visibility_off,
                                      color: selected ==
                                          FormData.ConfirmPassword
                                          ? enabledtxt
                                          : deaible,
                                      size: 20,
                                    )
                                        : Icon(
                                      Icons.visibility,
                                      color: selected ==
                                          FormData.ConfirmPassword
                                          ? enabledtxt
                                          : deaible,
                                      size: 20,
                                    ),
                                    onPressed: () => setState(
                                            () => ispasswordev = !ispasswordev),
                                  ),
                                  hintText: 'Confirm Password',
                                  hintStyle: TextStyle(
                                      color:
                                      selected == FormData.ConfirmPassword
                                          ? enabledtxt
                                          : deaible,
                                      fontSize: 12)),
                              obscureText: ispasswordev,
                              textAlignVertical: TextAlignVertical.center,
                              style: TextStyle(
                                  color: selected == FormData.ConfirmPassword
                                      ? enabledtxt
                                      : deaible,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        FadeAnimation(
                          delay: 1,
                          child: TextButton(
                              onPressed: () async {
                                print('Name: ${nameController.text.trim()}');
                                print('Email: ${emailController.text.trim()}');
                                print('Weight: ${weightController.text.trim()}');
                                print('Height: ${heightController.text.trim()}');
                                print('Age: ${ageController.text.trim()}');
                                print('Gender: ${selectedGender.toString()}');
                                print('Password: ${passwordController.text.trim()}');
                                print('Confirm Password: ${confirmPasswordController.text.trim()}');
                                bool isSuccess = await signUp(context);
                                if (isSuccess) {
                                  Navigator.of(context).pop();
                                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
                                } else {
                                  // Handle signup failure (e.g., show a toast or snackbar)
                                }

                              },

                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                  color: Colors.white,
                                  letterSpacing: 0.5,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              style: TextButton.styleFrom(
                                  backgroundColor: const Color(0xffff6347),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 14.0, horizontal: 80),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(12.0)))),
                        ),
                      ],
                    ),
                  ),
                ),

                //End of Center Card
                //Start of outer card
                const SizedBox(
                  height: 20,
                ),

                FadeAnimation(
                  delay: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text("If you have an account ",
                          style: TextStyle(
                            color: Colors.grey,
                            letterSpacing: 0.5,
                          )),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return LoginScreen();
                          }));
                        },
                        child: Text("Sing in",
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.9),
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                                fontSize: 14)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}