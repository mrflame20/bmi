import 'dart:async';
import 'package:BMI/Controller/bmi_controller.dart';
import 'package:BMI/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:BMI/result.dart';

import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  Color card_color = Colors.blueGrey[800];
  Timer timer;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey[800],
          centerTitle: true,
          title: Text(
            'BMI CALCULATOR',
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          ),
        ),
        drawer: MyDrawer(),
        body: GetX<BmiController>(
          init: BmiController(),
          builder: (controller) => Column(
            children: <Widget>[
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Expanded(
                      child: Card_bmi(
                        onPressed: () {
                          controller.bmiC.value.gender = Gender.Male;
                        },
                        card_color: controller.bmiC.value.gender == Gender.Male
                            ? Colors.blueGrey[600]
                            : card_color,
                        card_child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.mars,
                              size: 120,
                              color: Colors.blue,
                            ),
                            Text(
                              'MALE',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue[100],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Card_bmi(
                        onPressed: () {
                          controller.bmiC.value.gender = Gender.Female;
                        },
                        card_color:
                            controller.bmiC.value.gender == Gender.Female
                                ? Colors.blueGrey[600]
                                : card_color,
                        card_child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.venus,
                              size: 120,
                              color: Colors.pinkAccent,
                            ),
                            Text(
                              'FEMALE',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.pink[300],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Card_bmi(
                  card_color: card_color,
                  card_child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        'HEIGHT',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(
                            controller.bmiC.value.height.toString(),
                            style: TextStyle(
                                fontSize: 55, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'cm',
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            feetInch(controller.bmiC.value.height),
                            style: TextStyle(
                                fontSize: 55, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Slider(
                          min: 123,
                          max: 220,
                          value: controller.bmiC.value.height.toDouble(),
                          activeColor:
                              controller.bmiC.value.gender == Gender.Male
                                  ? Colors.blue
                                  : Colors.pink,
                          inactiveColor: Colors.white,
                          onChanged: (double value) {
                            controller.bmiC.value.height = value.round();
                          }),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Expanded(
                      child: Card_bmi(
                        card_color: card_color,
                        card_child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(
                              'WEIGHT(kg)',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.yellow,
                              ),
                            ),
                            Text(
                              controller.getWeight.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 60),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                RawMaterialButton(
                                  child: GestureDetector(
                                      child: Icon(FontAwesomeIcons.minus),
                                      onTapDown: (TapDownDetails details) {
                                        timer = Timer.periodic(
                                            Duration(milliseconds: 200), (t) {
                                          controller.decrementWeight();
                                        });
                                      },
                                      onTapCancel: () {
                                        timer.cancel();
                                      },
                                      onTapUp: (TapUpDetails details) {
                                        timer.cancel();
                                      }),
                                  onPressed: () {
                                    controller.decrementWeight();
                                  },
                                  shape: CircleBorder(),
                                  fillColor: Colors.grey[600],
                                  elevation: 6,
                                  constraints: BoxConstraints.tightFor(
                                      height: 50, width: 50),
                                ),
                                RawMaterialButton(
                                  child: GestureDetector(
                                      child: Icon(FontAwesomeIcons.plus),
                                      onTapDown: (TapDownDetails details) {
                                        timer = Timer.periodic(
                                            Duration(milliseconds: 200), (t) {
                                          controller.incrementWeight();
                                        });
                                      },
                                      onTapCancel: () {
                                        timer.cancel();
                                      },
                                      onTapUp: (TapUpDetails details) {
                                        timer.cancel();
                                      }),
                                  onPressed: () {
                                    controller.decrementWeight();
                                  },
                                  shape: CircleBorder(),
                                  fillColor: Colors.grey[600],
                                  elevation: 6,
                                  constraints: BoxConstraints.tightFor(
                                      height: 50, width: 50),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Card_bmi(
                        card_color: card_color,
                        card_child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(
                              'AGE',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.yellow,
                              ),
                            ),
                            Text(
                              controller.getAge.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 60),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                RawMaterialButton(
                                  child: GestureDetector(
                                      child: Icon(FontAwesomeIcons.minus),
                                      onTapDown: (TapDownDetails details) {
                                        timer = Timer.periodic(
                                            Duration(milliseconds: 200), (t) {
                                          controller.decrementAge();
                                        });
                                      },
                                      onTapCancel: () {
                                        timer.cancel();
                                      },
                                      onTapUp: (TapUpDetails details) {
                                        timer.cancel();
                                      }),
                                  onPressed: () {
                                    controller.decrementAge();
                                  },
                                  shape: CircleBorder(),
                                  fillColor: Colors.grey[600],
                                  elevation: 6,
                                  constraints: BoxConstraints.tightFor(
                                      height: 50, width: 50),
                                ),
                                RawMaterialButton(
                                  child: GestureDetector(
                                      child: Icon(FontAwesomeIcons.plus),
                                      onTapDown: (TapDownDetails details) {
                                        timer = Timer.periodic(
                                            Duration(milliseconds: 200), (t) {
                                          controller.bmiC.value.age++;
                                        });
                                      },
                                      onTap: () {
                                        controller.bmiC.value.age++;
                                      },
                                      onTapCancel: () {
                                        timer.cancel();
                                      },
                                      onTapUp: (TapUpDetails details) {
                                        timer.cancel();
                                      }),
                                  onPressed: () {
                                    controller.bmiC.value.age++;
                                  },
                                  shape: CircleBorder(),
                                  fillColor: Colors.grey[600],
                                  elevation: 6,
                                  constraints: BoxConstraints.tightFor(
                                      height: 50, width: 50),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => result()));
                  controller.bmiC.value.bmi = controller.calculateBmi(
                      controller.bmiC.value.weight,
                      controller.bmiC.value.height);
                },
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: controller.bmiC.value.gender == Gender.Male
                        ? Colors.blue
                        : Colors.pink,
                  ),
                  child: Text(
                    'CALCULATE',
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
      ),
    );
  }
}

// ignore: camel_case_types
class Card_bmi extends StatelessWidget {
  final Color card_color;
  final Widget card_child;
  final Function onPressed;

  Card_bmi(
      {@required this.card_child, @required this.card_color, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: card_child,
        margin: EdgeInsets.all(13),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: card_color,
        ),
      ),
    );
  }
}

String feetInch(int h) {
  double feet;
  double inch;
  String f, i;
  inch = h * 0.3937;
  feet = (inch * 0.083).floorToDouble();
  inch = (inch - (12 * feet.floorToDouble()));
  f = feet.toStringAsFixed(0);
  i = inch.toStringAsFixed(0);

  return ('''/$f'$i" ''');
}
