import 'package:flutter/material.dart';
import '../models/Exercise.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExerciseCard extends StatelessWidget {
  final Exercise exercise;
  final VoidCallback onTap;

  ExerciseCard({required this.exercise, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        clipBehavior: Clip.hardEdge,
        color: Color(0xFFFF3C3C),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),  // Rounded corners
        ),
        elevation: 5.0,
        margin: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Container(

              child: Image.asset(exercise.image, fit: BoxFit.fill),
            ),
            Expanded(
              child: Center(child: Text(exercise.name,textAlign: TextAlign.center, style: TextStyle(fontSize: 15.w,color: Colors.white, fontFamily: "OnelySans"),)),
            ),
          ],

        ),
      ),
    );
  }
}
