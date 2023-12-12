import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pelato_markazi/app/config/routes/app_pages.dart';
import 'package:pelato_markazi/app/core/utils/common_methods.dart';
import 'package:pelato_markazi/app/services/services.dart';
import 'package:pelato_markazi/domain/entities/coupon_entity.dart';
import 'package:pelato_markazi/domain/entities/order_entity.dart';
import 'package:pelato_markazi/domain/entities/salon_entity.dart';
import 'package:pelato_markazi/domain/use_cases/order/create_order_use_case.dart';
import 'package:pelato_markazi/domain/use_cases/order/get_single_order_use_case.dart';
import 'package:pelato_markazi/domain/use_cases/order/update_order_days_use_case.dart';
import 'package:pelato_markazi/domain/use_cases/salon/get_coupon_use_case.dart';
import 'package:pelato_markazi/domain/use_cases/salon/get_salon_use_case.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toastification/toastification.dart';

class SalonController extends GetxController {
  final GetSalonUseCase _getSalonUseCase;
  final GetCouponUseCase _getCouponUseCase;
  final CreateOrderUseCase _createOrderUseCase;
  final GetSingleOrderUseCase _getSingleOrderUseCase;
  final UpdateOrderDaysUseCase _updateOrderDaysUseCase;

  SalonController(
    this._getSalonUseCase,
    this._getCouponUseCase,
    this._createOrderUseCase,
    this._getSingleOrderUseCase,
    this._updateOrderDaysUseCase,
  );

  List<String> timeSlots = List.generate(15, (index) {
    final startHour = 8 + index;
    final endHour = startHour + 1;
    return '$startHour-$endHour';
  });
  DateTime now = DateTime.now();
  Timer? timer;
  SharedPreferences pref = Get.find<Services>().pref;
  int startTime = 3599;

  List<List<Map<String, dynamic>>> days = [];
  List<Map<String, dynamic>> selectedDays = [];
  late DateTime weekStart;

  SalonEntity? salon;
  String salonId = Get.arguments;
  String? isUpdate = Get.parameters['isUpdate'];
  String? orderId = Get.parameters['orderId'];
  TextEditingController couponCodeController = TextEditingController();
  String token = '-1';
  bool isCouponFree = false;

  int weekIndex = 0;
  List<int> daysCount = [];
  int sum = 0;

  @override
  void onReady() {
    super.onReady();
    token = pref.getString('token') ?? '-1';
    weekStart = mostRecentWeekday(now);
    getSalon(Get.context!).then((value) {
      if (now.weekday == 5) {
        goToNextWeek();
      }
      setTimesOfDays();
    });
  }

  Future<OrderEntity?> getOrder(String orderId) async {
    var response =
        await _getSingleOrderUseCase.execute(id: orderId, token: token);
    return response.data;
  }

  Future getSalon(context) async {
    if (token != '-1') {
      var response = await _getSalonUseCase.execute(token: token, id: salonId);
      if (response.data == null) {
        CommonMethods.showToast(context, response.error!);
        return;
      } //
      else {
        salon = response.data!;
        if (isUpdate == 'true') {
          OrderEntity? order = await getOrder(orderId!);
          if (order != null) {
            for (var item in order.salon!.reservedTimes!) {
              item.status = 'selected';
              salon!.reservedTimes!.add(item);
            }
            salon!.reservedTimes!.sort((a, b) => a.day!.compareTo(b.day!));
          }
        }
        update();
      }
    }
  }

  @override
  void onClose() {
    super.onClose();
    timer?.cancel();
    couponCodeController.dispose();
  }

  void setTimesOfDays() {
    days.clear();
    for (int i = 0; i < 7; i++) {
      List<Map<String, dynamic>> list = [];
      for (int j = 0; j < 15; j++) {
        list.add({'status': 'free', 'index': j});
      }
      days.add(list);
    }
    int difference = -1;
    if (weekIndex == 0) {
      difference = now.difference(weekStart).inDays;
      for (int i = 0; i <= difference; i++) {
        days[i].fillRange(0, 15, {'status': 'outdated', 'index': 0});
      }
    }
    if (isUpdate != null) {
      selectedDays.clear();
      for (var item in salon!.reservedTimes!) {
        if (item.status == 'selected') {
          selectedDays.add({
            'day': item.day,
            'hour': item.hours,
          });
          calculateCountOfDays(selectedDays);
        }
      }
    }
    for (int i = difference + 1; i < days.length; i++) {
      for (var item in salon!.reservedTimes!) {
        setItemOfDate(item.day!, i, item.hours!,
            item.status == 'canceled' ? 'free' : item.status!);
      }
      if (isUpdate == null) {
        for (var item in selectedDays) {
          setItemOfDate(item['day'], i, item['hour'], 'selected');
        }
      }
    }
    sum = selectedDays.length * salon!.rentCost!;
    update();
  }

  setItemOfDate(DateTime date, int daysIndex, String hour, String status) {
    if (DateFormat.yMd().format(weekStart.add(Duration(days: daysIndex))) ==
        DateFormat.yMd().format(date)) {
      int index = timeSlots.indexOf(hour);
      days[daysIndex].removeAt(index);
      days[daysIndex].insert(index, {'status': status, 'index': index});
    }
  }

  DateTime mostRecentWeekday(DateTime date) {
    var dateTime = DateTime.utc(
        date.year, date.month, date.day - (date.weekday - 6) % 7, 8, 30);
    return dateTime;
  }

  onTimeTap(Map<String, dynamic> item, int dayIndex) {
    if (item['status'] == 'free') {
      item['status'] = 'selected';
      selectedDays.add({
        'day': weekStart.add(Duration(days: dayIndex)),
        'hour': timeSlots[item['index']]
      });
    } //
    else {
      item['status'] = 'free';
      selectedDays.removeWhere(
        (element) =>
            element['day'] == weekStart.add(Duration(days: dayIndex)) &&
            element['hour'] == timeSlots[item['index']],
      );
    }
    update();
    selectedDays
        .sort((a, b) => (a['day'] as DateTime).compareTo(b['day'] as DateTime));
    calculateCountOfDays(selectedDays);
    sum = selectedDays.length * salon!.rentCost!;
    update();
  }

  calculateCountOfDays(List<Map<String, dynamic>> days) {
    List<DateTime> list = [];
    for (var value in days) {
      list.add(value['day']);
    }
    daysCount = CommonMethods.setDatesList(list);
    update();
  }

  void goToPreWeek() {
    if (now.weekday == 5 && weekIndex == 1) {
      return;
    } //
    else if (weekStart.isAfter(now)) {
      weekIndex--;
      weekStart = weekStart.subtract(const Duration(days: 7));
      setTimesOfDays();
      update();
    }
  }

  void goToNextWeek() {
    if (weekIndex <= 13) {
      weekIndex++;
      weekStart = weekStart.add(const Duration(days: 7));
      setTimesOfDays();
      update();
    }
  }

  startTimer() {
    if (timer?.isActive ?? false) {
    } //
    else {
      timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
        if (startTime > 0) {
          startTime--;
          update();
        } //
        else {
          timer.cancel();
        }
      });
    }
  }

  void completeReserve(context) async {
    List<Map<String, String>> reserveDay = [];
    for (var item in selectedDays) {
      reserveDay.add({
        'day': item['day'].toString(),
        'hours': item['hour'],
      });
    }
    var response = await _createOrderUseCase.execute(
      salonId: salonId,
      token: token,
      reserveDay: reserveDay,
      couponCode: isCouponFree ? couponCodeController.text : null,
    );
    if (response.data == null) {
      CommonMethods.showToast(context, response.error!);
    } //
    else {
      String orderId = response.data!;
      await pref.setStringList(orderId, ['$startTime', '${DateTime.now()}']);
      Get.offAllNamed(Routes.homeScreen);
    }
  }

  updateReserve(context) async {
    List<Map<String, String>> reserveDay = [];
    for (var item in selectedDays) {
      reserveDay.add({
        'day': item['day'].toString(),
        'hours': item['hour'],
      });
    }
    var response = await _updateOrderDaysUseCase.execute(
      orderId: orderId!,
      token: token,
      reserveDay: reserveDay,
    );
    if (response.data == null) {
      CommonMethods.showToast(context, response.error!);
    } //
    else {
      await pref.setStringList(orderId!, ['$startTime', '${DateTime.now()}']);
      Get.offAllNamed(Routes.homeScreen);
    }
  }

  void checkCoupon(context) async {
    var response = await _getCouponUseCase.execute(
      couponCode: couponCodeController.text,
      token: token,
    );
    if (response.data == null) {
      CommonMethods.showToast(context, response.error!);
    } //
    else {
      CouponEntity coupon = response.data!;
      if (coupon.status == 'fill') {
        CommonMethods.showToast(context, 'این کد تخفیف قبلا استفاده شده است.');
      } //
      else {
        CommonMethods.showToast(context, 'تخفیف با موفقیت اعمال شد.',
            type: ToastificationType.success);
        sum = selectedDays.length * (salon!.rentCost! - coupon.discount!);
        isCouponFree = true;
        update();
      }
    }
  }
}
