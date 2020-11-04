import 'package:BMI/Controller/controller_binding.dart';
import 'package:flutter/material.dart';
import 'package:BMI/Homepage.dart';
import 'package:get/get.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.dark(),
      initialBinding: ControllerBinding(),
      home: HomePage(),
    );
  }
}