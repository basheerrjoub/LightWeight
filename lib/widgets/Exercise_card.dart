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
            Expanded(
              child: Image.network(exercise.prevImage, fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(exercise.name, style: TextStyle(fontSize: 17.w,color: Colors.white, fontFamily: "OnelySans"),),
            ),
          ],
        ),
      ),
    );
  }
}
