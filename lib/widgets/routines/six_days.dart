import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lightweight/customize/BigText.dart';
import '../../../models/AppUser.dart';
import '../../Ads/BannerAdWidget.dart';
import '../../customize/icons.dart';
import '../../models/Exercise.dart';
import '../../models/Exercise_data.dart';
import '../Exercise_card.dart';
import '../Exercise_details.dart';
import 'package:lightweight/AppConstants.dart';
import '../svg_asset.dart';
import '../top_slider/meal_widgets/hotel_app_theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SixDays extends StatefulWidget {

  @override
  _DetailPageState createState() => _DetailPageState();
}



class _DetailPageState extends State<SixDays> {
  AppUser user = AppConstants.currentUser!;
  TextStyle textStyle = const  TextStyle(color: Colors.white, fontSize: 22, fontFamily: "OnelySans");

  final List<Exercise> day1exercises = [
    legsWorkout[1],  // Seated Leg Curls
    legsWorkout[2],  // Standing Calf Raises
    legsWorkout[3],  // Seated Calf Raises
    legsWorkout[0],  // Leg Presses
    legsWorkout[6],  // Lunges (added for diversity)
    backWorkout[1],  // Lat Pulldowns (as it uses a similar group)
    chestWorkout[0], // Chest Press (as it's similar to your earlier example)
    bicepsWorkout[0],// Bicep Curls (similar muscle group)
    absWorkout[0],   // Crunches (similar muscle group)
  ];

  final List<Exercise> day2exercises = [
    legsWorkout[0],  // Leg Presses
    legsWorkout[4],  // Squats
    legsWorkout[5],  // Deadlifts (as it's a major compound exercise)
    shouldersWorkout[1], // Upright Rows (utilizes traps which is part of back group)
    chestWorkout[2], // Bench Press (major compound exercise)
    tricepsWorkout[1], // Tricep Dips (similar muscle group)
    bicepsWorkout[2],  // Hammer Curls
    absWorkout[1],   // Leg Raises (different form of abdominal exercise)
  ];

  final List<Exercise> day3exercises = [
    legsWorkout[3],  // Seated Calf Raises
    legsWorkout[6],  // Lunges
    legsWorkout[7],  // Step-ups (for diversity)
    backWorkout[2],  // Rows (major compound exercise)
    shouldersWorkout[2], // Lateral Raises (isolates the deltoids)
    chestWorkout[4], // Flys (isolates the pecs)
    tricepsWorkout[2],   // Skull Crushers
    bicepsWorkout[3],    // Concentration Curls (for peak contraction)
    absWorkout[2],   // Russian Twists (for obliques)
  ];




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MealAppTheme.buildLightTheme().backgroundColor,
        elevation: 0,  // Set elevation for shadow
        title: Text(
          'Six Days Routine',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontSize: 28,
          ),
        ),
        centerTitle: true,
        leading: InkWell(
          borderRadius: BorderRadius.circular(32.0),
          onTap: () => Navigator.pop(context),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.arrow_back, color: Colors.white, size: 30,),
          ),
        ),actions: <Widget>[
        InkWell(
          borderRadius: BorderRadius.circular(32.0),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              FontAwesomeIcons.dumbbell,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
        InkWell(
          borderRadius: BorderRadius.circular(32.0),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              FontAwesomeIcons.list,
              size: 25,
              color: Colors.white,
            ),
          ),
        ),
      ],
      ),

      backgroundColor: const Color(0xff460f06),
      body: SafeArea(
        child: Stack(
          children: [

            //Footer
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

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 0.h),
              child: ListView(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xff912b1d),  // Move the color property inside BoxDecoration
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30.w),
                        bottomRight: Radius.circular(30.w),
                      ),
                    ),                    width: double.infinity,
                    height: 220.h,
                    child: Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.asset("assets/images/six_days_logo.png",
                            width: 250.w, height: 250.h, fit: BoxFit.contain),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Container(
                    alignment: Alignment.center,
                    child: Container(
                      width: 50.w,
                      height: 10.w,
                      color: Color(0xff912b1d),
                    ),
                  ),
                  SizedBox(height: 30,),
                  BannerAdWidget(adUnitId: AppConstants.adID, size: 3),

                  Card(
                    color: Color(0xFF9F1600),  // This sets the background color for the entire tile
                    child: Theme(
                      data: Theme.of(context).copyWith(
                        cardColor: Colors.white,  // This changes the icon color
                        unselectedWidgetColor: Colors.white, // In case you want to change the color when it's not expanded
                      ),
                      child: ExpansionTile(
                        title: Text(
                          "Description",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontFamily: "OnelySans", fontSize: 25.sp),
                        ),
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "The six-day split routine is a method where bodybuilders divide their training into three distinct workouts, performed over three consecutive days, followed by a day off. Some even opt to do the three-day cycles twice consecutively, training for six days and resting on the seventh. The main benefit of this approach is the ability to focus intensively on just a few muscles each day, allowing for more sets and exercises per muscle group. However, even for the most seasoned and genetically advantaged bodybuilders, sustaining this routine is challenging, often lasting only about two months. As a result, many reserve the six-day split for their pre-contest phase and revert to a four- or five-day routine post-contest.",
                              style: TextStyle(color: Colors.white, fontSize: 18.sp),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 40.h,),
                  Text(
                    "Workout Seperation",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontFamily: "OnelySans", fontSize: 25.sp),
                  ),
                  SizedBox(height: 10.h,),
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
                      "Day 1",
                      style: TextStyle(color: Colors.white, fontSize: 23.w, fontFamily: "ROYALMOSCOW"),
                    ),
                  ),
                  SizedBox(height: 30,),
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
                    itemCount: day1exercises.length,
                    itemBuilder: (context, index) {
                      return ExerciseCard(exercise: day1exercises[index],onTap: () {

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  ExerciseDetailScreen(exercise: day1exercises[index],)),
                        );
                      },);
                    },
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
                      "Day 2",
                      style: TextStyle(color: Colors.white, fontSize: 23.w, fontFamily: "ROYALMOSCOW"),
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
                    itemCount: day2exercises.length,
                    itemBuilder: (context, index) {
                      return ExerciseCard(exercise: day2exercises[index],onTap: () {

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  ExerciseDetailScreen(exercise: day1exercises[index],)),
                        );
                      },);
                    },
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
                      "Day 3",
                      style: TextStyle(color: Colors.white, fontSize: 23.w, fontFamily: "ROYALMOSCOW"),
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
                    itemCount: day3exercises.length,
                    itemBuilder: (context, index) {
                      return ExerciseCard(exercise: day3exercises[index],onTap: () {

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  ExerciseDetailScreen(exercise: day1exercises[index],)),
                        );
                      },);
                    },
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
                      "Day 4",
                      style: TextStyle(color: Colors.white, fontSize: 23.w, fontFamily: "ROYALMOSCOW"),
                    ),
                  ),
                  SizedBox(height: 30,),
                  Text("Break", textAlign: TextAlign.center,style: TextStyle(fontSize: 50,color: Colors.white60, fontFamily: "ROYALMOSCOW"),),
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
                      "Day 5",
                      style: TextStyle(color: Colors.white, fontSize: 23.w, fontFamily: "ROYALMOSCOW"),
                    ),
                  ),
                  SizedBox(height: 30,),
                  Text("Day 1", textAlign: TextAlign.center,style: TextStyle(fontSize: 50,color: Colors.white60, fontFamily: "ROYALMOSCOW"),),

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
                      "Day 6",
                      style: TextStyle(color: Colors.white, fontSize: 23.w, fontFamily: "ROYALMOSCOW"),
                    ),
                  ),
                  SizedBox(height: 30,),
                  Text("Day 2", textAlign: TextAlign.center,style: TextStyle(fontSize: 50,color: Colors.white60, fontFamily: "ROYALMOSCOW"),),

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
                      "Day 7",
                      style: TextStyle(color: Colors.white, fontSize: 23.w, fontFamily: "ROYALMOSCOW"),
                    ),
                  ),
                  SizedBox(height: 30,),
                  Text("Day 3", textAlign: TextAlign.center,style: TextStyle(fontSize: 50,color: Colors.white60, fontFamily: "ROYALMOSCOW"),),



                ],
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