import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../customize/icons.dart';
import '../../svg_asset.dart';
import '../../../models/AppUser.dart';
import '../../../models/Meal.dart';
import 'package:lightweight/AppConstants.dart';
import 'hotel_app_theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MealDetails extends StatefulWidget {
  final Meal meal;
  const MealDetails({required this.meal});

  @override
  _DetailPageState createState() => _DetailPageState();
}



class _DetailPageState extends State<MealDetails> {
  AppUser user = AppConstants.currentUser!;
  TextStyle textStyle = const  TextStyle(color: Colors.white, fontSize: 22, fontFamily: "OnelySans");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MealAppTheme.buildLightTheme().backgroundColor,
        elevation: 0,  // Set elevation for shadow
        title: Text(
          'Meals',
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
            child: Icon(Icons.arrow_back, color: Colors.white),
          ),
        ),actions: <Widget>[
        InkWell(
          borderRadius: BorderRadius.circular(32.0),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.food_bank,
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
              FontAwesomeIcons.calculator,
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
                        child: Image.asset(widget.meal.imageUrl,
                            width: 200.w, height: 200.h, fit: BoxFit.contain),
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
                  SizedBox(height: 15.h),
                  Center(child: Text(widget.meal.name, style: TextStyle(color: Colors.white, fontSize: 24.sp, fontWeight: FontWeight.bold))),
                  SizedBox(height: 10.h),
                  Text(widget.meal.description,textAlign: TextAlign.center, style: TextStyle(color: Colors.white70, fontSize: 18.sp)),
                  SizedBox(height: 10.h),

                  Card(
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: Color(0xff912b1d),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.autorenew_rounded,size: 30 ,color: Colors.yellow),

                                  Text(
                                    "Cal ${widget.meal.calories} kcal",
                                    style: textStyle,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.food_bank_rounded,size: 30, color: Colors.yellow),

                                  Text(
                                    "Protein ${widget.meal.protein}g",
                                    style: textStyle,
                                  ),
                                ],
                              ),
                            ],
                          ),

                          SizedBox(height: 8.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.breakfast_dining,size: 30, color: Colors.yellow),

                                  Text(
                                    "Carbs  ${widget.meal.carbs.toInt()}g",
                                    style: textStyle,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.food_bank_outlined ,size: 30, color: Colors.yellow),

                                  Text(
                                    " Fat  ${widget.meal.fat}g",
                                    style: textStyle,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 8.0),

                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 30.h),
                  Text("Ingredients", textAlign: TextAlign.center, style: TextStyle(color: Colors.white,fontSize: 22.sp, fontWeight: FontWeight.bold)),
                  Container(

                    height: (widget.meal.ingredients.length / 2 * 70).h,  // height should be adjusted based on your needs
                    child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(), // to disable GridView's scrolling
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 3,
                        mainAxisSpacing: 10.h,
                        crossAxisSpacing: 10.w,
                      ),
                      itemCount: widget.meal.ingredients.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          margin: EdgeInsets.symmetric(vertical: 5.h), // added margin
                          color: Color(0xff912b1d),
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              child: Text(
                                widget.meal.ingredients[index],
                                style: TextStyle(color: Colors.white, fontSize: 18.sp),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),

                        );
                      },
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Text("Steps", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 22.sp, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10.h),


                  for (String step in widget.meal.steps)
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.h),
                      child: Container(
                        padding: EdgeInsets.all(10.h),  // Padding inside the container for better appearance
                        decoration: BoxDecoration(
                          color: Color(0xff912b1d),  // You can adjust the color as needed
                          borderRadius: BorderRadius.circular(10.h),  // Rounded corners
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,  // To ensure the icon is aligned with the top of text if the text wraps to next line
                          children: [
                            Icon(Icons.format_list_bulleted, color: Colors.white, size: 22.sp),  // Bullet point using icon
                            SizedBox(width: 5.w),  // Space between the bullet and text
                            Expanded(  // To ensure the text takes up the remaining space and wraps if needed
                              child: Text(
                                step,
                                style: TextStyle(color: Colors.white, fontSize: 18.sp),
                              ),
                            ),
                          ],
                        ),
                      ),
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