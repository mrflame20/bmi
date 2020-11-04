import 'package:BMI/Controller/bmi_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';

class result extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      maintainBottomViewPadding: true,
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(5),
              alignment: Alignment.topLeft,
              child: Text(
                'Your Result',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: EdgeInsets.all(30),
              margin: EdgeInsets.all(15),
              height: 640,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blueGrey[700],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    getResult(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: getResult() == 'NORMAL'
                            ? Color(0xFF76FF03)
                            : Color(0xFFD50000)),
                  ),
                  Text(
                    bmiValue(),
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 130, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    getInterpretation(),
                    textAlign: TextAlign.center,
                    softWrap: true,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.pink,
                ),
                child: Text(
                  'RE-CALCULATE',
                  style: TextStyle(
                      fontSize: 35,
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String bmiValue() {
  return Get.find<BmiController>().bmiC.value.bmi.toStringAsFixed(1);
}

String getResult() {
  if (Get.find<BmiController>().bmiC.value.bmi >= 25) {
    return 'OVERWEIGHT';
  } else if (Get.find<BmiController>().bmiC.value.bmi > 18.5) {
    return 'NORMAL';
  } else {
    return 'UNDERWEIGHT';
  }
}

String getInterpretation() {
  if (Get.find<BmiController>().bmiC.value.bmi >= 25) {
    return 'You have a higher than normal body weight. Try to exercise more.';
  } else if (Get.find<BmiController>().bmiC.value.bmi >= 18.5) {
    return 'You have a normal body weight. Good job!';
  } else {
    return 'You have a lower than normal body weight. You can eat a bit more.';
  }
}
