import 'package:get/get.dart';
import 'package:pelato_markazi/app/features/home/controller/home_controller.dart';

class HomeBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}