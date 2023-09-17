import 'package:get/get.dart';
import 'package:pelato_markazi/app/features/user/controller/user_controller.dart';

class UserBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserController>(() => UserController());
  }
}
