import 'package:BMI/Controller/bmi_controller.dart';
import 'package:get/get.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BmiController());
  }
}
