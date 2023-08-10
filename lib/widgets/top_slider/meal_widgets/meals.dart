import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../customize/icons.dart';
import '../../svg_asset.dart';
import '../../../models/AppUser.dart';
import '../../../models/Meal.dart';
import 'package:lightweight/AppConstants.dart';

class Meals extends StatefulWidget {
  const Meals({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}



class _DetailPageState extends State<Meals> {
  AppUser user = AppConstants.currentUser!;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff460f06),
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
                    tag: "Workout & Diet Tips",
                    child: Material(
                      color: Colors.transparent,
                      child: Text("Workout & Diet Tips",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30.w,
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
                    "Some useful tips that could help you.",
                    style: TextStyle(
                        color: Color(0xffffffff).withOpacity(0.7),
                        fontWeight: FontWeight.w400,
                        fontSize: 16.w),
                  ),
                ),
                SizedBox(height: 25.h),


                SizedBox(height: 150.h),

              ],
            ),

            Align(alignment: Alignment.topCenter,
                child:   Container(
                  color:  Color(0xff340c06),
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
                          Color(0xff2c0904),
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

  void onStartButtonPressed() {

  }

  void onBackIconTapped() {
    Navigator.pop(context);
  }




}