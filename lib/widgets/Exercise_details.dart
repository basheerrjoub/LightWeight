import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../customize/icons.dart';
import 'svg_asset.dart';
import '../models/Exercise.dart';
import '../models/Exercise_data.dart';
import 'Exercise_card.dart';

class ExerciseDetailScreen extends StatefulWidget {
  final Exercise exercise;

  const ExerciseDetailScreen({required this.exercise});

  @override
  _ExerciseDetailScreenState createState() => _ExerciseDetailScreenState();
}

class _ExerciseDetailScreenState extends State<ExerciseDetailScreen> {
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
                SizedBox(
                  height: 10.h,
                ),


                SizedBox(height: 32.h),

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
                    "How to Do it?",
                    style: TextStyle(color: Colors.white, fontSize: 30.w, fontFamily: "ROYALMOSCOW"),
                  ),
                ),
                SizedBox(height: 20.h),
                Image.network(
                  widget.exercise.image,
                  fit: BoxFit.cover,
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
                    "${widget.exercise.description}",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "OnelySans",
                        fontSize: 18.w),
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