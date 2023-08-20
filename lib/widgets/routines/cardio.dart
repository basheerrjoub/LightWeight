import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../models/AppUser.dart';
import '../../models/Exercise_data.dart';
import 'package:lightweight/AppConstants.dart';
import '../../Ads/BannerAdWidget.dart';
import '../top_slider/meal_widgets/hotel_app_theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Exercise_card.dart';
import '../Exercise_details.dart';
class Cardio extends StatefulWidget {

  @override
  _DetailPageState createState() => _DetailPageState();
}



class _DetailPageState extends State<Cardio> {
  AppUser user = AppConstants.currentUser!;
  TextStyle textStyle = const  TextStyle(color: Colors.white, fontSize: 22, fontFamily: "OnelySans");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MealAppTheme.buildLightTheme().backgroundColor,
        elevation: 0,  // Set elevation for shadow
        title: Text(
          'Cardio Exercies',
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
                        child: Image.asset("assets/images/cardio_logo.png",
                            width: 200.w, height: 250.h, fit: BoxFit.contain),
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
                  BannerAdWidget(adUnitId: AppConstants.adID, size: 3),
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
                              "Cardiovascular exercise, commonly referred to as cardio, plays a crucial role in promoting heart health, enhancing lung capacity, and burning calories. Engaging in regular cardio workouts can improve endurance, reduce the risk of chronic diseases, and promote overall well-being. Beyond physical benefits, cardio activities also serve as a means to relieve stress and boost mood, making it an essential component of a balanced fitness routine",
                              style: TextStyle(color: Colors.white, fontSize: 18.sp),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 40.h,),

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
                    itemCount: cardioWorkout.length,
                    itemBuilder: (context, index) {
                      return ExerciseCard(exercise: cardioWorkout[index],onTap: () {

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  ExerciseDetailScreen(exercise: cardioWorkout[index],)),
                        );
                      },);
                    },
                  ),


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