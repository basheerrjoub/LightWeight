import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../customize/icons.dart';
import '../svg_asset.dart';
import '../../models/AppUser.dart';
import '../../models/Tip.dart';
import 'package:lightweight/AppConstants.dart';
import '../../customize/icons.dart';
import '../discover_card.dart';
import '../discover_small_card.dart';
import '../svg_asset.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../workouts_screen.dart';
import '../../models/Exercise_data.dart';
import '../../models/Exercise.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Favourite extends StatefulWidget {
  const Favourite({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}



class _DetailPageState extends State<Favourite> {
  List<Exercise> chestExercises = [];

  Future<List<String>> getFavouriteExerciseIds() async {
    await FirebaseFirestore.instance.disableNetwork();

    List<String> favouriteIds = [];
    try {
      String currentUser = await AppConstants.getUserID();
      if (currentUser != "null") {
        QuerySnapshot snapshot = await FirebaseFirestore.instance
            .collection('favourite')
            .where('userId', isEqualTo: currentUser)
            .get();

        for (DocumentSnapshot doc in snapshot.docs) {
          // Assuming the document structure has 'exerciseId' as a key for the exercise ID
          favouriteIds.add(doc['exerciseId'] as String);
        }
      }
    } catch (e) {
      print("Error fetching favourite exercise IDs: " + e.toString());
    }
    print("Complete");
    await FirebaseFirestore.instance.enableNetwork();
    return favouriteIds;
  }

  void populateFavouriteChestExercises() async {
    List<String> favouriteIds = await getFavouriteExerciseIds();
    chestExercises = chestWorkout.where((exercise) => favouriteIds.contains(exercise.eid)).toList();
    chestExercises.forEach((element) {print(element.eid);});
    setState(() {});  // Notify the UI to rebuild if this is within a StatefulWidget
  }

  @override
  void initState() {
    super.initState();
    populateFavouriteChestExercises();
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: getFavouriteExerciseIds(),
      builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return Scaffold(
            backgroundColor: const Color(0xff460f06),
            body: SafeArea(
              child: Stack(
                children: [
                  ListView(
                    physics: BouncingScrollPhysics(),
                    children: [
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

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 28.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Hero(
                              tag: "Favourite Workouts",
                              child: Material(
                                color: Colors.transparent,
                                child: Text(
                                  "Favourite Workouts",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 32.w,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              "Your favourite exercises, that you liked!",
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.7),
                                fontWeight: FontWeight.w400,
                                fontSize: 18.w,
                              ),
                            ),
                            SizedBox(height: 20.h),
                            Divider(
                              color: Colors.white.withOpacity(0.5),
                              thickness: 1.w,
                            ),
                            SizedBox(height: 20.h),
                          ],
                        ),
                      ),

                      //Todo
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
                                  MaterialPageRoute(builder: (context) =>  WorkoutsScreen(workoutName: "Chest", workout: chestExercises, describtion: "Chest strength is about more than physical definition—strong pectoral muscles can help improve posture, benefit breathing and support the surrounding muscles and joints. While building muscle can take time, developing a strong chest doesn’t have to be time-consuming",)),
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
                      ),

                      SizedBox(height: 50.h),

                    ],
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
      },
    );

  }

  void onStartButtonPressed() {

  }

  void onBackIconTapped() {
    Navigator.pop(context);
  }

}