import 'package:get/get.dart';
import 'package:movies/src/controllers/home_controller.dart';
import 'package:movies/src/data/provider/home_provider.dart';
import 'package:movies/src/data/repository/home_repository.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeProvider>(() => HomeProvider());
    Get.lazyPut<HomeRepository>(() => HomeRepository());
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
