import 'package:get/get.dart';
import 'package:pelato_markazi/app/features/order/controller/order_controller.dart';

class OrderBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<OrderController>(() => OrderController());
  }
}