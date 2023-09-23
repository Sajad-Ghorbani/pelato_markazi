import 'dart:async';

import 'package:get/get.dart';
import 'package:pelato_markazi/app/models/order_model.dart';
import 'package:pelato_markazi/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderController extends GetxController {
  List<OrderModel> orders = [];
  Timer? timer;
  SharedPreferences pref = Get.find<Services>().pref;

  @override
  void onInit() {
    super.onInit();
    orders = orderList;
    for (var item in orders) {
      List<String> time =
          pref.getStringList('time2') ?? []; // time1 ==> item.id!
      if (time.isNotEmpty) {
        int difference =
            DateTime.now().difference(DateTime.parse(time[1])).inSeconds;
        item.remainedTime = int.parse(time[0]) - difference;
      }
    }
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

  @override
  void onClose() {
    timer?.cancel();

    super.onClose();
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
