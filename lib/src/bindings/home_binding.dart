import 'package:get/get.dart';
import 'package:movies/src/controllers/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put((HomeController()));
  }
}
