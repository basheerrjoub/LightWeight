import 'hotel_list_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'hotel_app_theme.dart';
import '../../../models/Meal.dart';
import '../BMI.dart';
import 'package:lightweight/AppConstants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'meal_details.dart';

class MealHomeScreen extends StatefulWidget {
  @override
  _MealHomeScreenState createState() => _MealHomeScreenState();
}

class _MealHomeScreenState extends State<MealHomeScreen>
    with TickerProviderStateMixin {
  AnimationController? animationController;
  List<Meal> mealList = Meal.mealList;
  final ScrollController _scrollController = ScrollController();

  // Removing this because we will be getting the value from FutureBuilder directly
  // double bmiValue = 0;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    super.initState();
  }

  Future<double> calculateBMI() async {
    String currentUser = await AppConstants.getUserID();

    if (currentUser != "null") {
      await for (var snapshot in FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser)
          .snapshots()) {
        if (snapshot.exists) {
          Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

          double weight = double.parse(data['weight'].toString());
          double height = double.parse(data['height'].toString());
          print("User: ${currentUser} weight: ${weight} height: ${height}");
          height /= 100;
          return weight / (height * height);
        } else {
          return 1.0;
        }
      }
    } else {
      return 1.0;
    }
    return 0;
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<double>(
        future: calculateBMI(),
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.hasError) {
            return Center(child: CircularProgressIndicator());
          }

          double bmiValue = snapshot.data!;
          List<Meal> filteredMeals = filterMealsForBMI(bmiValue);

          return Theme(
              data: MealAppTheme.buildLightTheme(),
              child: Container(
                child: Scaffold(
                  appBar: AppBar(
                    backgroundColor:
                        MealAppTheme.buildLightTheme().backgroundColor,
                    elevation: 2.0,
                    // Set elevation for shadow
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
                    ),
                    actions: <Widget>[
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
                  body: Column(
                    children: [
                      // Passing the BMI value here to be displayed
                      Expanded(
                        child: NestedScrollView(
                          controller: _scrollController,
                          headerSliverBuilder:
                              (BuildContext context, bool innerBoxIsScrolled) {
                            return <Widget>[
                              SliverList(
                                delegate: SliverChildBuilderDelegate(
                                    (BuildContext context, int index) {
                                  return Column(
                                    children: <Widget>[
                                      getTimeDateUI(bmiValue),
                                    ],
                                  );
                                }, childCount: 1),
                              ),
                            ];
                          },
                          body: ListView.builder(
                            itemCount: filteredMeals.length,
                            padding: const EdgeInsets.only(top: 8),
                            scrollDirection: Axis.vertical,
                            itemBuilder: (BuildContext context, int index) {
                              final int count = filteredMeals.length > 10
                                  ? 10
                                  : filteredMeals.length;
                              final Animation<double> animation =
                                  Tween<double>(begin: 0.0, end: 1.0).animate(
                                      CurvedAnimation(
                                          parent: animationController!,
                                          curve: Interval(
                                              (1 / count) * index, 1.0,
                                              curve: Curves.fastOutSlowIn)));
                              animationController?.forward();
                              return HotelListView(
                                callback: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => MealDetails(
                                          meal: filteredMeals[index]),
                                    ),
                                  );
                                },
                                mealData: filteredMeals[index],
                                animation: animation,
                                animationController: animationController!,
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ));
        });
  }

  List<Meal> filterMealsForBMI(double bmi) {
    print("BMI: ${bmi}: length: ${mealList.length}");
    if (bmi < 18.5) {
      // Underweight
      return mealList
          .where((meal) => meal.calories >= 500 && meal.calories <= 1000)
          .toList();
    } else if (bmi >= 18.5 && bmi <= 24.9) {
      // Healthy weight

      return mealList;
    } else if (bmi >= 25 && bmi <= 29.9) {
      // Overweight
      return mealList
          .where((meal) => meal.calories >= 50 && meal.calories <= 600)
          .toList();
    } else {
      // Obesity
      return mealList
          .where((meal) => meal.calories >= 50 && meal.calories <= 500)
          .toList();
    }
  }

  Widget getTimeDateUI(double bmiValue) {
    return Padding(
      padding: const EdgeInsets.only(left: 18, bottom: 16),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              'List of meals based on your BMI: ${bmiValue.toStringAsFixed(0)}',
              style: TextStyle(
                  fontSize: 22, color: Colors.white, fontFamily: "OnelySans"),
            ),
          ),
        ],
      ),
    );
  }

  Widget getAppBarUI() {
    return Container(
      decoration: BoxDecoration(
        color: MealAppTheme.buildLightTheme().backgroundColor,
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              offset: const Offset(0, 2),
              blurRadius: 8.0),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top, left: 8, right: 8),
        child: Row(
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              width: AppBar().preferredSize.height + 40,
              height: AppBar().preferredSize.height,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(32.0),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.arrow_back),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  'Meals',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: 28,
                  ),
                ),
              ),
            ),
            Container(
              width: AppBar().preferredSize.height + 40,
              height: AppBar().preferredSize.height,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(32.0),
                      ),
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
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(32.0),
                      ),
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

class ContestTabHeader extends SliverPersistentHeaderDelegate {
  ContestTabHeader(
    this.searchUI,
  );

  final Widget searchUI;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return searchUI;
  }

  @override
  double get maxExtent => 52.0;

  @override
  double get minExtent => 52.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
