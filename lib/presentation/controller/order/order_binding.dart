import 'package:get/get.dart';
import 'package:pelato_markazi/presentation/controller/order/order_controller.dart';

class OrderBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderController>(
        () => OrderController(Get.find(), Get.find(), Get.find()));
  }
}
