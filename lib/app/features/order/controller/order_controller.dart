import 'dart:async';

import 'package:get/get.dart';
import 'package:pelato_markazi/app/core/utils/common_methods.dart';
import 'package:pelato_markazi/app/models/order_model.dart';

class OrderController extends GetxController {
  List<OrderModel> orders = [];
  Timer? timer;
  List orderDateIndices = [];

  @override
  void onInit() {
    super.onInit();
    orders = orderList;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      for (var item in orders) {
        if (item.remainedTime != null && item.remainedTime != 0) {
          item.remainedTime = item.remainedTime! - 1;
          if (!orders.any((element) =>
              element.remainedTime != null && element.remainedTime! > 0)) {
            timer.cancel();
          }
        }
      }
      update();
    });
  }

  setOrderDatesList(OrderModel order) {
    List<DateTime> dates = [];
    for (var value in order.salon!.reservesTime!) {
      dates.add(value.day!);
    }
    orderDateIndices = CommonMethods.setDatesList(dates);
  }

  String getOrderStatus(String status) {
    switch (status) {
      case 'canceled':
        return 'لغو شده';
      case 'pending':
        return 'در حال بررسی';
      case 'completed':
        return 'رزرو شده';
      default:
        return 'در حال بررسی';
    }
  }
}
