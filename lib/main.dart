import 'package:flutter/material.dart';
import 'package:session3_4course4/bmi_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BMICalculator(),
    );
  }
}
