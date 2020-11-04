import 'package:BMI/Controller/bmi_controller.dart';

class Bmi {
  int height;
  int weight;
  int age;
  double bmi;
  Gender gender;

  Bmi(
      {this.height = 180,
      this.weight = 70,
      this.age = 20,
      this.bmi = 0,
      this.gender = Gender.Male});
}
