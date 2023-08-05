import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  final String title;
  final double size;
  const BigText({required this.title, required this.size});

  @override
  Widget build(BuildContext context) {
    TextStyle style = new TextStyle(fontSize: this.size, fontFamily: "ROYALMOSCOW");
    return Text(this.title, style: style);
  }
}
