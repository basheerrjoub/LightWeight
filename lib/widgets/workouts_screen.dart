import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../customize/icons.dart';
import 'svg_asset.dart';
import '../models/Exercise.dart';
import '../models/Exercise_data.dart';
import 'Exercise_card.dart';
import 'Exercise_details.dart';

class WorkoutsScreen extends StatefulWidget {
  final String workoutName;
  final bool isCardio;
  final List<Exercise> workout;
  final String describtion;

  const WorkoutsScreen({this.workoutName = "Default", this.isCardio = false, this.workout = chestWorkout, this.describtion = ' '});

  @override
  _WorkoutsScreenState createState() => _WorkoutsScreenState();
}

class _WorkoutsScreenState extends State<WorkoutsScreen> {
  bool? isHeartIconTapped = false;

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
                    tag: "WorkoutName",
                    child: Material(
                      color: Colors.transparent,
                      child: Text("${widget.workoutName} Workout",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 34.w,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 28.w),
                  child: Text(
                    "Following are set of Exercises, that are focused on the ${widget.workoutName} area",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 16.w),
                  ),
                ),

                SizedBox(height: 32.h),
                Padding(
                  padding: EdgeInsets.only(left: 28.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 56.w,
                        width: 50.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white.withOpacity(0.1),
                        ),
                        child: Center(
                            child: widget.isCardio?
                            SvgAsset(
                                assetName: AssetName.cardio,
                                height: 28.w,
                                width: 28.w): SvgAsset(
                                assetName: AssetName.bodybuilding,
                                height: 28.w,
                                width: 28.w) ),
                      ),
                      SizedBox(width: 16.w),
                      Container(
                        height: 56.w,
                        width: 56.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white.withOpacity(0.1),
                        ),
                        child: Center(
                            child: SvgAsset(
                                assetName: AssetName.workout,
                                height: 28.w,
                                width: 28.w)),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 50,
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
                    "Exercises",
                    style: TextStyle(color: Colors.white, fontSize: 30.w, fontFamily: "ROYALMOSCOW"),
                  ),
                ),
                GridView.builder(
                  padding: const EdgeInsets.all(8.0),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,  // Number of cards in a row
                    childAspectRatio: 0.8,  // Adjust based on your design preference
                    mainAxisSpacing: 8.0,   // Spacing between rows
                    crossAxisSpacing: 8.0,  // Spacing between cards
                  ),
                  itemCount: widget.workout.length,
                  itemBuilder: (context, index) {
                    return ExerciseCard(exercise: widget.workout[index],onTap: () {

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  ExerciseDetailScreen(exercise: widget.workout[index],)),
                      );
                    },);
                  },
                ),

                SizedBox(height: 30.h),
                Container(
                  height: 50,
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
                    "${widget.describtion}",
                    style: TextStyle(
                        color: Color(0xffffffff).withOpacity(0.7),
                        fontWeight: FontWeight.w400,
                        fontSize: 16.w),
                  ),
                )
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

}