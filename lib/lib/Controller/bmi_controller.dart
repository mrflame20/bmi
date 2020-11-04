import 'dart:math';

import 'package:BMI/models/bmi_model.dart';
import 'package:get/get.dart';

enum Gender { Male, Female }

class BmiController extends GetxController {

  final bmiC = Bmi().obs; 

  double calculateBmi(w,h){
    
    return (w / pow(h / 100, 2));
  }

 
  int get getWeight => this.bmiC.value.weight;
  int get getAge => this.bmiC.value.age;

  void incrementAge() {
    bmiC.update((val) {
      val.age + 1;
    });
  }

  void incrementWeight() {
    bmiC.update((val) {
      val.weight =  val.weight + 1;
    });
  }

  void decrementAge() {
    bmiC.update((val) {
      val.age = val.age--;
    });
  }

  void decrementWeight() {
    bmiC.update((val) {
      val.weight = val.weight--;
    });
  }

  
}
