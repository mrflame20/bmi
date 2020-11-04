import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
          elevation: 10,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                padding: EdgeInsets.all(5),
                child: Image(
                  image: AssetImage('assets/bmi.png'),
                ),
              ),
              ListTile(
                  leading: Icon(Icons.info),
                  title: Text(
                    'BMI',
                    style: TextStyle(fontSize: 20),
                  ),
                  subtitle: Text('What is BMI?'),
                  onTap: () {
                    AwesomeDialog(
                      customHeader: Text(
                        'BMI',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.yellow),
                      ),
                      padding: EdgeInsets.all(5),
                      context: context,
                      animType: AnimType.LEFTSLIDE,
                      dialogType: DialogType.NO_HEADER,
                      body: Container(
                        child: Text(
                          '''- The body mass index (BMI) is a measure that uses your height and weight to work out if your weight is healthy.

- The BMI calculation divides an adult's weight in kilograms by their height in metres squared. For example, A BMI of 25 means 25kg/m2.''',
                          style: TextStyle(
                              fontStyle: FontStyle.italic, fontSize: 20),
                        ),
                      ),
                      btnOkOnPress: () {},
                    )..show();
                  }),
              ListTile(
                leading: Icon(Icons.insert_chart),
                title: Text(
                  'Chart',
                  style: TextStyle(fontSize: 20),
                ),
                subtitle: Text('Height -> Weight'),
                onTap: () {
                  AwesomeDialog(
                    context: context,
                    customHeader: Icon(
                      Icons.insert_chart,
                      size: 50,
                      color: Colors.pinkAccent,
                    ),
                    animType: AnimType.LEFTSLIDE,
                    dialogType: DialogType.NO_HEADER,
                    body: Image(
                      image: AssetImage('assets/bmi_chart.png'),
                    ),
                    btnOkOnPress: () {},
                  )..show();
                },
              ),
              ListTile(
                leading: Icon(Icons.perm_identity),
                title: Text(
                  'About Developer',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  AwesomeDialog(
                    context: context,
                    customHeader: CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/junoon Award(face).jpg'),
                      radius: 50,
                    ),
                    animType: AnimType.LEFTSLIDE,
                    dialogType: DialogType.NO_HEADER,
                    body: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Ojas Wani',
                                  style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontFamily: 'Pacifico',
                                    letterSpacing: 1,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'waniojas@gmail.com',
                                  style: TextStyle(
                                      fontSize: 15,
                                      letterSpacing: 2,
                                      fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Ink(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: Colors.white54,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                              child: RaisedButton(
                                  elevation: 20,
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  color: Colors.white,
                                  child: Icon(
                                    FontAwesomeIcons.github,
                                    color: Colors.black,
                                    size: 28,
                                  ),
                                  onPressed: () {
                                    launch('https://github.com/mrflame20');
                                  }),
                            ),
                            Ink(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: Colors.white54,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                              child: RaisedButton(
                                  elevation: 20,
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  color: Colors.white,
                                  child: Icon(
                                    FontAwesomeIcons.linkedinIn,
                                    color: Colors.blue,
                                    size: 28,
                                  ),
                                  onPressed: () {
                                    launch('https://www.linkedin.com/in/ojas-wani-83108a153/');
                                  }),
                            ),
                          ],
                        ),
                      ],
                    ),
                    btnOkOnPress: () {},
                  )..show();
                },
              ),
              ListTile(
                leading: Icon(Icons.brush),
                title: Text(
                  'Change Theme',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Get.isDarkMode ? Get.changeTheme(ThemeData.light()) : Get.changeTheme(ThemeData.dark()); 
                },
                ),
            ],
          ),
        );
  }
}