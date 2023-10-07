import 'package:get/get.dart';
import 'package:pelato_markazi/presentation/controller/salon/salon_controller.dart';

class SalonBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SalonController>(() => SalonController(
          Get.find(),
          Get.find(),
          Get.find(),
          Get.find(),
          Get.find(),
        ));
  }
}
