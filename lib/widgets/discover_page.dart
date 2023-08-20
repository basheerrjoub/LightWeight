import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lightweight/Ads/BannerAdWidget.dart';
import 'package:lightweight/widgets/routines/cardio.dart';
import 'package:lightweight/widgets/routines/four_days.dart';
import 'package:lightweight/widgets/routines/six_days.dart';
import 'package:lightweight/widgets/routines/two_days.dart';
import '../AppConstants.dart';
import '../customize/icons.dart';
import 'discover_card.dart';
import 'discover_small_card.dart';
import 'svg_asset.dart';
import 'workouts_screen.dart';
import '../models/Exercise_data.dart';
import 'top_slider/BMI.dart';
import 'top_slider/Tips.dart';
import 'top_slider/favourite.dart';
import 'top_slider/meal_widgets/meal_home_screen.dart';

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
    ScreenUtil.init(context);
    return Scaffold(
      backgroundColor: Color(0xff3d1007),
      body: SafeArea(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Container(child: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Image(
                image: AssetImage("assets/images/dashboardLogo.png"),),
            ),),
            Container(
              height: 90,
              margin: EdgeInsets.only(top: 20),
              child: ListView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: 10.w,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MealHomeScreen()),
                      );
                    },
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
                              "Meal Suggestions",
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
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Favourite()),
                      );
                    },
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
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BMI()),
                      );
                    },
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
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Tips()),
                      );
                    },
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
                "Routines",
                style: TextStyle(color: Colors.white,
                    fontSize: 30.w,
                    fontFamily: "ROYALMOSCOW"),
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
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SixDays()),
                      );
                    },
                    title: "Six Days Routine",
                    subtitle: "One of the Best training shcedules",
                    gradientStartColor: Color(0xff911700),
                    gradientEndColor: Color(0x19bdff3a),
                  ),
                  SizedBox(width: 20.w),
                  DiscoverCard(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FourDays()),
                      );
                    },
                    tag: "fourDaysRoutine",
                    title: "Four Day Routine",
                    subtitle: "Four Day Routine",
                    gradientStartColor: Color(0xc31432A7),
                    gradientEndColor: Color(0xc3148ca7),
                  ),
                  SizedBox(width: 20.w),
                  DiscoverCard(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TwoDays()),
                      );
                    },
                    tag: "twoDaysRoutine",
                    title: "Two Days Routine",
                    subtitle: "Two Day Routine",
                    gradientStartColor: Color(0xc31432A7),
                    gradientEndColor: Color(0xc3148ca7),
                  ),
                  SizedBox(width: 20.w),
                  DiscoverCard(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Cardio()),
                      );
                    },
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
                "Workouts",
                style: TextStyle(color: Colors.white,
                    fontSize: 30.w,
                    fontFamily: "ROYALMOSCOW"),
              ),
            ),
            SizedBox(height: 16.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 28.w),
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 19.w,
                    mainAxisExtent: 125.w,
                    mainAxisSpacing: 19.w),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  DiscoverSmallCard(
                    onTap: () { //DetailPage
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const WorkoutsScreen(
                              workoutName: "Chest",
                              workout: chestWorkout,
                              describtion: "Chest strength is about more than physical definition—strong pectoral muscles can help improve posture, benefit breathing and support the surrounding muscles and joints. While building muscle can take time, developing a strong chest doesn’t have to be time-consuming",)),
                      );
                    },
                    title: "Chest",
                    gradientStartColor: Color(0xff13DEA0),
                    gradientEndColor: Color(0xff06B782),
                    icon: SvgAsset(
                      assetName: AssetName.chest,
                      height: 58.w,
                      width: 58.w,
                    ),
                  ),
                  DiscoverSmallCard(
                    onTap: () { //DetailPage
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const WorkoutsScreen(
                              workoutName: "Triceps",
                              workout: tricepsWorkout,
                              describtion: "The triceps consist of three heads: the long head, lateral head, and medial head. While all heads engage during triceps exercises, certain movements emphasize specific areas. To develop robust triceps, opt for exercises that target all these heads comprehensively, ensuring thorough muscle engagement.",)),
                      );
                    },
                    title: "Triceps",
                    gradientStartColor: Color(0xffFC67A7),
                    gradientEndColor: Color(0xffF6815B),
                    icon: SvgAsset(
                      assetName: AssetName.triceps,
                      height: 58.w,
                      width: 58.w,
                    ),
                  ),
                  DiscoverSmallCard(
                    onTap: () { //DetailPage
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const WorkoutsScreen(
                              workoutName: "Back",
                              workout: backWorkout,
                              describtion: "A well-developed, robust back makes a strong impression. Whether your goal is enhanced muscle definition, improved performance in weightlifting, or increased overall well-being, dedicated back training is essential. Properly executed back exercises are key to achieving these objectives effectively.",)),
                      );
                    },
                    title: "Back",
                    gradientStartColor: Color(0xffFFD541),
                    gradientEndColor: Color(0xffF0B31A),
                    icon: SvgAsset(
                      assetName: AssetName.backBody,
                      height: 58.w,
                      width: 58.w,
                    ),
                  ),
                  DiscoverSmallCard(
                    onTap: () { //DetailPage
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const WorkoutsScreen(
                              workoutName: "Biceps",
                              workout: bicepsWorkout,
                              describtion: "Biceps workouts focus on developing the muscles located on the front of your upper arm. These muscles, collectively known as the biceps brachii, play a crucial role in various upper body movements such as lifting, pulling, and bending your arm at the elbow. ",)),
                      );
                    },
                    title: "Biceps",
                    gradientStartColor: Color(0xf23ac033),
                    gradientEndColor: Color(0x1141ca33),
                    icon: SvgAsset(
                      assetName: AssetName.biceps,
                      height: 58.w,
                      width: 58.w,
                    ),

                  ),
                  DiscoverSmallCard(
                    onTap: () { //DetailPage
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const WorkoutsScreen(
                              workoutName: "Legs",
                              workout: legsWorkout,
                              describtion: "Training your legs in bodybuilding is crucial for several reasons. While many people tend to focus on working their upper body muscles, neglecting your leg muscles can lead to an imbalanced physique and missed opportunities for overall strength and athleticism. ",)),
                      );
                    },
                    title: "Legs",
                    gradientStartColor: Color(0xf23ac033),
                    gradientEndColor: Color(0x1141ca33),
                    icon: SvgAsset(
                      assetName: AssetName.legs,
                      height: 58.w,
                      width: 60.w,
                    ),
                  ),
                  DiscoverSmallCard(
                    onTap: () { //DetailPage
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const WorkoutsScreen(
                              workoutName: "Abs",
                              workout: absWorkout,
                              describtion: "Training abs is vital for both health and aesthetics. Strong abdominal muscles stabilize the core, preventing injuries and supporting good posture. Additionally, toned abs are a sought-after physical trait, signifying fitness and vitality.",)),
                      );
                    },
                    title: "Abs",
                    gradientStartColor: Color(0x19ffb8ad),
                    gradientEndColor: Color(0xe4ff0044),
                    icon: SvgAsset(
                      assetName: AssetName.abs,
                      height: 58.w,
                      width: 58.w,
                    ),
                  ),
                  DiscoverSmallCard(
                    onTap: () { //DetailPage
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const WorkoutsScreen(
                              workoutName: "Shoulders",
                              workout: shouldersWorkout,
                              describtion: "Training your shoulders is crucial for a balanced physique and functional strength. Well-developed shoulders support better posture, facilitate daily movements, and reduce injury risks. Additionally, strong shoulders provide a foundation for other upper body exercises, optimizing overall athletic performance.",)),
                      );
                    },
                    title: "Shoulders",
                    gradientStartColor: Color(0xfe0f0133),
                    gradientEndColor: Color(0xFF38A4F3),
                    icon: SvgAsset(
                      assetName: AssetName.shoulders,
                      height: 40.w,
                      width: 75.w,
                    ),
                  ),
                  DiscoverSmallCard(
                    onTap: () { //DetailPage
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const WorkoutsScreen(
                              workoutName: "Forearms",
                              workout: forearmsWorkout,
                              describtion: "Training the forearms is vital for enhancing grip strength, aiding in daily tasks and sports. Additionally, it ensures a balanced aesthetic with the upper arm, promoting overall upper body development.",)),
                      );
                    },
                    title: "Forearms",
                    gradientStartColor: Color(0x1141ca33),
                    gradientEndColor: Color(0xbd732733),
                    icon: SvgAsset(
                      assetName: AssetName.forearms,
                      height: 40.w,
                      width: 75.w,
                    ),
                  ),
                ],

              ),
            ),
            SizedBox(height: 20.h,),
            BannerAdWidget(adUnitId: AppConstants.adID, size: 3)

          ],

        ),
      ),

    );
  }


}