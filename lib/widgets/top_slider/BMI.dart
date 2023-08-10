import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../customize/icons.dart';
import '../svg_asset.dart';
import '../../models/AppUser.dart';
import 'package:lightweight/AppConstants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BMI extends StatefulWidget {
  const BMI({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class BMIStatus {
  final String statusText;
  final Color statusColor;
  final String iconAsset;
  final String advice;

  BMIStatus({
    required this.statusText,
    required this.statusColor,
    required this.iconAsset,
    required this.advice
  });
}



class _DetailPageState extends State<BMI> {

  Stream<double> calculateBMI() async* {
    String currentUser = await AppConstants.getUserID();

    if (currentUser != "null") {
      await for (var snapshot in FirebaseFirestore.instance.collection('users').doc(currentUser).snapshots()) {
        if (snapshot.exists) {
          Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

          double weight = double.parse(data['weight'].toString());
          double height = double.parse(data['height'].toString());
          print("User: ${currentUser} weight: ${weight} height: ${height}");
          height /= 100;
          yield weight / (height * height);
        } else {
          yield 1.0;
        }
      }
    } else {
      yield 1.0;
    }
  }


  BMIStatus getBMIStatus(double bmi) {
    if (bmi < 18.5) {
      return BMIStatus(
        statusText: "Underweight",
        statusColor: Colors.blue,
        iconAsset: 'assets/underweight_icon.svg', // replace with your path
        advice: "Consider consuming more calories and maintaining a balanced diet.",
      );
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return BMIStatus(
        statusText: "Normal weight",
        statusColor: Colors.green,
        iconAsset: 'assets/normal_icon.svg', // replace with your path
        advice: "Continue your current diet and exercise regime to maintain your weight.",
      );
    } else if (bmi >= 24.9 && bmi < 29.9) {
      return BMIStatus(
        statusText: "Overweight",
        statusColor: Colors.orange,
        iconAsset: 'assets/overweight_icon.svg', // replace with your path
        advice: "Monitor your diet and increase physical activities. Consider consulting a nutritionist.",
      );
    } else {
      return BMIStatus(
        statusText: "Obesity",
        statusColor: Colors.red,
        iconAsset: 'assets/obesity_icon.svg', // replace with your path
        advice: "Seek guidance from a healthcare professional about a weight loss regime.",
      );
    }
  }




  @override
  Widget build(BuildContext context) {
    return StreamBuilder<double>(
      stream: calculateBMI(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (!snapshot.hasData || snapshot.hasError) {
          return Scaffold(

            body: Center(child: Text("Error fetching BMI")),
          );
        }

        double bmiValue = snapshot.data!;
        BMIStatus bmiStatus = getBMIStatus(bmiValue);

        return Scaffold(
          backgroundColor: const Color(0xff460f06),
          body: SafeArea(
            child: Stack(
              children: [
                ListView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    SizedBox(height: 66.h),
                    Padding(
                      padding: EdgeInsets.only(left: 28.w),
                      child: Hero(
                        tag: "BMI Calculator",
                        child: Material(
                          color: Colors.transparent,
                          child: Text("BMI Calculator",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 34.w,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Padding(
                      padding: EdgeInsets.only(left: 28.w),
                      child: Text(
                        "How healthy you are, according to BMI?",
                        style: TextStyle(
                            color: Color(0xffffffff).withOpacity(0.7),
                            fontWeight: FontWeight.w400,
                            fontSize: 16.w),
                      ),
                    ),
                    SizedBox(height: 25.h),
                    SizedBox(height: 30.h),
                    Center(
                      child: Column(
                        children: [
                          Text(
                            "Your BMI",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30.w,
                                fontFamily: "OnelySans"),
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            "${bmiValue.toStringAsFixed(2)}",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 36.w,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 20.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Icon
                              SvgAsset(
                                assetName: AssetName.bmi,
                                height: 40.w,
                                width: 40.w,
                              ),
                              SizedBox(width: 10.w),
                              // Text status
                              Text(
                                bmiStatus.statusText,
                                style: TextStyle(
                                    color: bmiStatus.statusColor,
                                    fontSize: 22.w,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                          Card(
                            color: bmiStatus.statusColor.withOpacity(0.6),
                            elevation: 5.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            margin: EdgeInsets.symmetric(
                                horizontal: 25.w, vertical: 20.h),
                            child: Padding(
                              padding: EdgeInsets.all(15.w),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.privacy_tip_rounded,
                                          size: 28.w, color: Color(0xff3a0400)),
                                      Text(
                                        "Advice",
                                        style: TextStyle(
                                            color: Color(0xff3a0400),
                                            fontSize: 22.w,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10.h),
                                  Text(
                                    bmiStatus.advice,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color(0xff121421),
                                        fontSize: 16.w,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 25.h),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 28.w, right: 28.w, bottom: 80.h),
                      child: Text(
                        "The Body Mass Index (BMI) Calculator can be used to calculate BMI value and corresponding weight status while taking age into consideration. Use the \"Metric Units\" tab for the International System of Units or the \"Other Units\" tab to convert units into either US or metric units. Note that the calculator also computes the Ponderal Index in addition to BMI, both of which are discussed below in detail.",
                        style: TextStyle(
                            color: Color(0xffffffff).withOpacity(0.7),
                            fontWeight: FontWeight.w400,
                            fontSize: 16.w),
                      ),
                    )
                  ],
                ),
                Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      color: Color(0xff340c06),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 22.w,
                            right: 22.w,
                            top: 20.h,
                            bottom: 10.h),
                        child: Material(
                          color: Colors.transparent,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                borderRadius: BorderRadius.circular(360),
                                onTap: onBackIconTapped,
                                child: Container(
                                  height: 35.w,
                                  width: 35.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(360),
                                  ),
                                  child: Center(
                                    child: SvgAsset(
                                      assetName: AssetName.back,
                                      height: 20.w,
                                      width: 20.w,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 87.h,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        gradient: LinearGradient(stops: [
                          0,
                          1
                        ], colors: [
                          Color(0xff2c0904),
                          Colors.transparent,
                        ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void onStartButtonPressed() {}

  void onBackIconTapped() {
    Navigator.pop(context);
  }
}
