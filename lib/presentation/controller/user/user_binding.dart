import 'package:get/get.dart';
import 'package:pelato_markazi/presentation/controller/user/user_controller.dart';

class UserBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<UserController>(UserController(Get.find(), Get.find()));
  }
}
