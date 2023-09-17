import 'package:get/get.dart';
import 'package:pelato_markazi/app/features/salon/controller/salon_controller.dart';

class SalonBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SalonController>(() => SalonController());
  }
}
