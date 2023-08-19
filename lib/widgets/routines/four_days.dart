import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../models/AppUser.dart';
import 'package:lightweight/AppConstants.dart';
import '../../Ads/BannerAdWidget.dart';
import '../top_slider/meal_widgets/hotel_app_theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../models/Exercise.dart';
import '../../models/Exercise_data.dart';
import '../Exercise_card.dart';
import '../Exercise_details.dart';

class FourDays extends StatefulWidget {

  @override
  _DetailPageState createState() => _DetailPageState();
}



class _DetailPageState extends State<FourDays> {
  AppUser user = AppConstants.currentUser!;
  TextStyle textStyle = const  TextStyle(color: Colors.white, fontSize: 22, fontFamily: "OnelySans");

  final List<Exercise> day1exercises = [
    chestWorkout[0],  // Incline Presses
    chestWorkout[1],  // Bench Press
    chestWorkout[6],  // Dumbbell Presses
    chestWorkout[7],  // Dumbbell Flys
    tricepsWorkout[0],// Push Downs
    tricepsWorkout[2],// Triceps Extension
    tricepsWorkout[4],// EZ BAR EXTENSION
  ];
  final List<Exercise> day2exercises = [
    backWorkout[0],   // Reverse Chin Ups
    backWorkout[2],   // Lat Pull-Downs
    backWorkout[4],   // Straight Arm Lat Pull-Downs
    backWorkout[6],   // One Arm Rows
    bicepsWorkout[0], // Curls
    bicepsWorkout[2], // Hammer Curls
    bicepsWorkout[5], // Barbell Curls
  ];
  final List<Exercise> day3exercises = [
    legsWorkout[0],   // Dumbbell Goblet Squat
    legsWorkout[1],   // Barbell Squat
    legsWorkout[2],   // Leg Press
    legsWorkout[4],   // Leg Extensions
    legsWorkout[9],   // Standing Calf Raises
    legsWorkout[10],  // Seated Calf Raises
  ];
  final List<Exercise> day4exercises = [
    shouldersWorkout[0], // Military Press
    shouldersWorkout[1], // Lateral Raises
    shouldersWorkout[2], // Front Raises
    shouldersWorkout[3], // Shrugs
    absWorkout[0],      // Crunches
    absWorkout[1],      // Leg Raises
    absWorkout[2],      // Planks
    forearmsWorkout[0],  // Wrist Curls
    forearmsWorkout[1],  // Reverse Wrist Curls
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MealAppTheme.buildLightTheme().backgroundColor,
        elevation: 0,  // Set elevation for shadow
        title: Text(
          'Four Days Routine',
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
                        child: Image.asset("assets/images/four_days_logo.png",
                            width: 190.w, height: 235.h, fit: BoxFit.contain),
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
                  SizedBox(height: 10,),
                  BannerAdWidget(adUnitId: "ca-app-pub-3940256099942544/6300978111", size: 3),
                  SizedBox(height: 10,),

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
                              "This four-day workout split covers all major muscle groups for balanced growth. Day 1 targets the chest and triceps, with Day 2 focusing on the back and biceps. Day 3 is dedicated to leg training, from thighs to calves. The routine wraps up on Day 4, emphasizing shoulders, abs, and forearms. By segmenting muscle groups this way, the regimen ensures comprehensive development, offering a harmonized approach to strength and muscular symmetry. Proper warm-ups, cool-downs, and recovery are key to its success.",
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
                  Text("Rest", textAlign: TextAlign.center,style: TextStyle(fontSize: 50,color: Colors.white60, fontFamily: "ROYALMOSCOW"),),

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
                    itemCount: day4exercises.length,
                    itemBuilder: (context, index) {
                      return ExerciseCard(exercise: day4exercises[index],onTap: () {

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
                      "Day 6",
                      style: TextStyle(color: Colors.white, fontSize: 23.w, fontFamily: "ROYALMOSCOW"),
                    ),
                  ),
                  SizedBox(height: 30,),
                  Text("Rest", textAlign: TextAlign.center,style: TextStyle(fontSize: 50,color: Colors.white60, fontFamily: "ROYALMOSCOW"),),

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
                  Text("Rest", textAlign: TextAlign.center,style: TextStyle(fontSize: 50,color: Colors.white60, fontFamily: "ROYALMOSCOW"),),




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