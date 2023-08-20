import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../Ads/BannerAdWidget.dart';
import '../customize/icons.dart';
import 'svg_asset.dart';
import '../models/Exercise.dart';
import '../models/Exercise_data.dart';
import 'Exercise_card.dart';
import '../models/AppUser.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lightweight/AppConstants.dart';

class ExerciseDetailScreen extends StatefulWidget {
  final Exercise exercise;

  const ExerciseDetailScreen({required this.exercise});


  @override
  _ExerciseDetailScreenState createState() => _ExerciseDetailScreenState();
}

class _ExerciseDetailScreenState extends State<ExerciseDetailScreen> {
  bool? isHeartIconTapped = false;
  Future<bool> isExerciseFavorited(String exerciseId) async {
    try {
      String currentUser = await AppConstants.getUserID();
      if (currentUser != "null") {
        QuerySnapshot snapshot = await FirebaseFirestore.instance
            .collection('favourite')
            .where('userId', isEqualTo: currentUser)
            .where('exerciseId', isEqualTo: exerciseId)
            .get();

        return snapshot.docs.isNotEmpty;
      }
      return false;
    } catch (e) {
      print("Error checking if exercise is favorited: " + e.toString());
      return false;
    }
  }
  @override
  void initState() {
    super.initState();
    initializeHeartIconState();
  }

  void initializeHeartIconState() async {
    bool favorited = await isExerciseFavorited(widget.exercise.eid);
    setState(() {
      isHeartIconTapped = favorited;
    });
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xff3d1007),
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              physics: BouncingScrollPhysics(),
              children: [
                SizedBox(
                  height: 66.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 28.w),
                  child: Hero(
                    tag: "ExerciseName",
                    child: Material(
                      color: Colors.transparent,
                      child: Text("${widget.exercise.name}",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 34.w,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),

                BannerAdWidget(adUnitId: AppConstants.adID, size: 3),



                SizedBox(height: 32.h),

                Container(
                  height: 80,
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF5E1508),
                        Color(0xFFC23019),
                        Color(0xFF5E1508),
                      ],
                    ),
                  ),
                  child: Text(
                    "How to Do it?",
                    style: TextStyle(color: Colors.white, fontSize: 30.w, fontFamily: "ROYALMOSCOW"),
                  ),
                ),
                SizedBox(height: 20.h),
                Container(
                  width: double.infinity,
                  child: Image.asset(

                    widget.exercise.image,
                    fit: BoxFit.cover,
                  ),
                ),


                SizedBox(height: 30.h),
                Container(
                  height: 80,
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF5E1508),
                        Color(0xFFC23019),
                        Color(0xFF5E1508),
                      ],
                    ),
                  ),
                  child: Text(
                    "Describtion",
                    style: TextStyle(color: Colors.white, fontSize: 30.w, fontFamily: "ROYALMOSCOW"),
                  ),
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.only(left: 28.w, right: 28.w, bottom: 80.h),
                  child: Text(
                    "${widget.exercise.description}",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "OnelySans",
                        fontSize: 18.w),
                  ),
                ),
                Container(
                  height: 80,
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF5E1508),
                        Color(0xFFC23019),
                        Color(0xFF5E1508),
                      ],
                    ),
                  ),
                  child: Text(
                    "How Many?",
                    style: TextStyle(color: Colors.white, fontSize: 30.w, fontFamily: "ROYALMOSCOW"),
                  ),
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.only(left: 28.w, right: 28.w, bottom: 80.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Sets",
                            style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 20.w, fontFamily: "ROYALMOSCOW"),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            "${widget.exercise.sets}",
                            style: TextStyle(color: Colors.white, fontSize: 30.w, fontFamily: "ROYALMOSCOW", fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 2.h),
                          Container(
                            width: 80.w,
                            height: 3.h,
                            color: Colors.white, // Or any other color that matches your design
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "Reps",
                            style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 20.w, fontFamily: "ROYALMOSCOW"),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            "${widget.exercise.repetitions}",
                            style: TextStyle(color: Colors.white, fontSize: 30.w, fontFamily: "ROYALMOSCOW", fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 2.h),
                          Container(
                            width: 80.w,
                            height: 3.h,
                            color: Colors.white, // Or any other color that matches your design
                          )
                        ],
                      ),
                    ],
                  )

                ),
                BannerAdWidget(adUnitId: AppConstants.adID, size: 3),
                SizedBox(height: 70.h,),

              ],
            ),

            Align(alignment: Alignment.topCenter,
                child:   Container(
                  color:  Color(0xff441815),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 22.w,
                        right: 22.w,
                        top: 20.h,
                        bottom: 10.h
                    ),
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
                          InkWell(
                            borderRadius: BorderRadius.circular(360),
                            onTap: onHeartIconTapped,
                            child: Container(
                              height: 35.w,
                              width: 35.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(360),
                              ),
                              child: Center(
                                child: SvgAsset(
                                  assetName: AssetName.heart,
                                  height: 24.w,
                                  width: 24.w,
                                  color: isHeartIconTapped! ? Colors.red: Colors.white,
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                )
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 87.h,
                decoration: BoxDecoration(
                    color: Colors.black,
                    gradient: LinearGradient(
                        stops: [0,1],
                        colors: [
                          Color(0xff121421),
                          Colors.transparent,
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter
                    )
                ),

              ),
            ),



          ],
        ),
      ),
    );
  }


  void onBackIconTapped() {
    Navigator.pop(context);
  }

  void onHeartIconTapped() async {
    setState(() {
      isHeartIconTapped = !isHeartIconTapped!;
    });

    String currentUser = await AppConstants.getUserID();
    if (currentUser != "null") {
      if (isHeartIconTapped!) {
        // Add the exercise to favorite exercises
        await saveFavouriteExercise(widget.exercise.eid, widget.exercise.type);
      } else {
        // Remove the exercise from favorite exercises
        String? docId = await getFavouriteExerciseDocId(widget.exercise.eid, currentUser);
        if (docId != null) {
          await deleteFavouriteExercise(docId);
        }
      }
    }
  }
  Future<String?> getFavouriteExerciseDocId(String exerciseId, String userId) async {
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('favourite')
          .where('userId', isEqualTo: userId)
          .where('exerciseId', isEqualTo: exerciseId)
          .limit(1)
          .get();

      if (snapshot.docs.isNotEmpty) {
        return snapshot.docs.first.id;
      }
    } catch (e) {
      print("Error fetching favourite exercise docId: " + e.toString());
    }
    return null;
  }

  Future<void> saveFavouriteExercise(String exerciseId, String exerciseType) async {
    try {
      String currentUser = await AppConstants.getUserID();
      if (currentUser != "null") {
        // Check if the user has already favorited this exercise
        QuerySnapshot snapshot = await FirebaseFirestore.instance
            .collection('favourite')
            .where('userId', isEqualTo: currentUser)
            .where('exerciseId', isEqualTo: exerciseId)
            .get();

        if (snapshot.docs.isEmpty) {
          // Only add if no such record exists
          await FirebaseFirestore.instance.collection('favourite').add({
            'userId': currentUser,
            'exerciseId': exerciseId,
            'exerciseType': exerciseType,
          });
        }
      }
    } catch (e) {
      print("Error saving favourite exercise: " + e.toString());
    }
  }


  Future<void> deleteFavouriteExercise(String docId) async {
    try {
      await FirebaseFirestore.instance.collection('favourite').doc(docId).delete();
    } catch (e) {
      print("Error deleting favourite exercise: " + e.toString());
    }
  }


}