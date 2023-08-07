import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'detail_page.dart';
import 'category_boxes.dart';
import '../customize/icons.dart';
import 'discover_card.dart';
import 'discover_small_card.dart';
import 'svg_asset.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'workouts_screen.dart';
import '../models/Exercise.dart';
import '../models/Exercise_data.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({
    Key? key,
  }) : super(key: key);

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    ScreenUtil.init(context);
    return Scaffold(
      backgroundColor: Color(0xff3d1007),
      body: SafeArea(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Container(child: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Image(image: AssetImage("assets/images/dashboardLogo.png"),),
            ),),
            Container(
              height: 70.h,
              margin: EdgeInsets.only(top:20),
              child: ListView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: 10.w,
                  ),
              GestureDetector(
                onTap: null,
                child: Container(
                  padding: EdgeInsets.all(12),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color(0xFFA61400),
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 6.0,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Row(
                      children: [
                        SvgAsset(
                          assetName: AssetName.diet,
                          height: 25.w,
                          width: 25.w,
                        ),
                        SizedBox(width: 5.w,),
                        Text(
                          "Diet",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontFamily: "ONELYSANS"
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
                  GestureDetector(
                    onTap: null,
                    child: Container(
                      padding: EdgeInsets.all(12),
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Color(0xFFA61400),
                        borderRadius: BorderRadius.circular(12.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 6.0,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Row(
                          children: [
                            SvgAsset(
                              assetName: AssetName.favourite,
                              height: 25.w,
                              width: 25.w,
                            ),
                            SizedBox(width: 5.w,),
                            Text(
                              "Favourite Exercises",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontFamily: "ONELYSANS"
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: null,
                    child: Container(
                      padding: EdgeInsets.all(12),
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Color(0xFFA61400),
                        borderRadius: BorderRadius.circular(12.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 6.0,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Row(
                          children: [
                            SvgAsset(
                              assetName: AssetName.bmi,
                              height: 25.w,
                              width: 25.w,
                            ),
                            SizedBox(width: 5.w,),
                            Text(
                              "BMI",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontFamily: "ONELYSANS"
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: null,
                    child: Container(
                      padding: EdgeInsets.all(12),
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Color(0xFFA61400),
                        borderRadius: BorderRadius.circular(12.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 6.0,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Row(
                          children: [
                            SvgAsset(
                              assetName: AssetName.bulb,
                              height: 25.w,
                              width: 25.w,
                            ),
                            SizedBox(width: 5.w,),
                            Text(
                              "Tips",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontFamily: "ONELYSANS"
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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
                "Routines",
                style: TextStyle(color: Colors.white, fontSize: 30.w, fontFamily: "ROYALMOSCOW"),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            SizedBox(
              height: 176.w,
              child: ListView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(width: 28.w),
                  DiscoverCard(
                    tag: "sixDaysRoutine",
                    onTap: null,
                    title: "Six Days Routine",
                    subtitle: "One of the Best training shcedules",
                    gradientStartColor: Color(0xff911700),
                    gradientEndColor: Color(0x19bdff3a),
                  ),
                  SizedBox(width: 20.w),
                  DiscoverCard(
                    onTap: null,
                    tag: "fourDaysRoutine",
                    title: "Four Day Routine",
                    subtitle: "Four Day Routine",
                    gradientStartColor: Color(0xc31432A7),
                    gradientEndColor: Color(0xc3148ca7),
                  ),
                  SizedBox(width: 20.w),
                  DiscoverCard(
                    onTap: null,
                    tag: "twoDaysRoutine",
                    title: "Two Days Routine",
                    subtitle: "Two Day Routine",
                    gradientStartColor: Color(0xc31432A7),
                    gradientEndColor: Color(0xc3148ca7),
                  ),
                  SizedBox(width: 20.w),
                  DiscoverCard(
                    onTap: null,
                    isCardio: true,
                    title: "Cardio Workouts",
                    subtitle: "10 Days Audio and Video Series",
                    gradientStartColor: Color(0xc31432A7),
                    gradientEndColor: Color(0xc3148ca7),
                  ),
                ],
              ),
            ),
            SizedBox(height: 28.h),
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
                "Workouts",
                style: TextStyle(color: Colors.white, fontSize: 30.w, fontFamily: "ROYALMOSCOW"),
              ),
            ),
            SizedBox(height: 16.h),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 28.w),
              child: GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 19.w, mainAxisExtent:  125.w, mainAxisSpacing: 19.w),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  DiscoverSmallCard(
                    onTap: (){//DetailPage
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const WorkoutsScreen(workoutName: "Chest", workout: chestWorkout, describtion: "Chest strength is about more than physical definition—strong pectoral muscles can help improve posture, benefit breathing and support the surrounding muscles and joints. While building muscle can take time, developing a strong chest doesn’t have to be time-consuming",)),
                      );
                    },
                    title: "Chest",
                    gradientStartColor: Color(0xff13DEA0),
                    gradientEndColor: Color(0xff06B782),
                    icon:    SvgAsset(
                      assetName: AssetName.chest,
                      height: 58.w,
                      width: 58.w,
                    ),
                  ),
                  DiscoverSmallCard(
                    onTap: (){},
                    title: "Triceps",
                    gradientStartColor: Color(0xffFC67A7),
                    gradientEndColor: Color(0xffF6815B),
                    icon:    SvgAsset(
                      assetName: AssetName.triceps,
                      height: 58.w,
                      width: 58.w,
                    ),
                  ),
                  DiscoverSmallCard(
                    onTap: (){
                    },
                    title: "Back",
                    gradientStartColor: Color(0xffFFD541),
                    gradientEndColor: Color(0xffF0B31A),
                    icon:    SvgAsset(
                      assetName: AssetName.backBody,
                      height: 58.w,
                      width: 58.w,
                    ),
                  ),
                  DiscoverSmallCard(
                    onTap: (){},
                    title: "Biceps",
                    gradientStartColor: Color(0xf23ac033),
                    gradientEndColor: Color(0x1141ca33),
                    icon:  SvgAsset(
                      assetName: AssetName.biceps,
                      height: 58.w,
                      width: 58.w,
                    ),

                  ),
                  DiscoverSmallCard(
                    onTap: (){},
                    title: "Legs",
                    gradientStartColor: Color(0xf23ac033),
                    gradientEndColor: Color(0x1141ca33),
                    icon:  SvgAsset(
                      assetName: AssetName.legs,
                      height: 58.w,
                      width: 60.w,
                    ),
                  ),
                  DiscoverSmallCard(
                    onTap: (){},
                    title: "Abs",
                    gradientStartColor: Color(0x19ffb8ad),
                    gradientEndColor: Color(0xe4ff0044),
                    icon:  SvgAsset(
                      assetName: AssetName.abs,
                      height: 58.w,
                      width: 58.w,
                    ),
                  ),
                  DiscoverSmallCard(
                    onTap: (){},
                    title: "Shoulders",
                    gradientStartColor: Color(0xfe0f0133),
                    gradientEndColor: Color(0xFF38A4F3),
                    icon:  SvgAsset(
                      assetName: AssetName.shoulders,
                      height: 40.w,
                      width: 75.w,
                    ),
                  ),
                  DiscoverSmallCard(
                    onTap: (){},
                    title: "Forearms",
                    gradientStartColor: Color(0x1141ca33),
                    gradientEndColor: Color(0xbd732733),
                    icon:  SvgAsset(
                      assetName: AssetName.forearms,
                      height: 40.w,
                      width: 75.w,
                    ),
                  ),
                ],

              ),
            )
          ],
        ),
      ),
    );
  }



}