import 'package:get/get.dart';
import 'package:pelato_markazi/presentation/controller/home/home_controller.dart';

class HomeBinding implements Bindings{
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController(Get.find()),permanent: true);
  }
}