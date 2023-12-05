import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pelato_markazi/app/config/routes/app_pages.dart';
import 'package:pelato_markazi/app/core/utils/common_methods.dart';
import 'package:pelato_markazi/app/services/services.dart';
import 'package:pelato_markazi/domain/entities/order_entity.dart';
import 'package:pelato_markazi/domain/entities/order_meta_data_entity.dart';
import 'package:pelato_markazi/domain/use_cases/order/get_all_order_use_case.dart';
import 'package:pelato_markazi/domain/use_cases/order/get_single_order_use_case.dart';
import 'package:pelato_markazi/domain/use_cases/order/update_order_status_use_case.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderController extends GetxController {
  final GetAllOrderUseCase _allOrderUseCase;
  final UpdateOrderStatusUseCase _updateOrderStatusUseCase;
  final GetSingleOrderUseCase _getSingleOrderUseCase;

  OrderController(
    this._allOrderUseCase,
    this._updateOrderStatusUseCase,
    this._getSingleOrderUseCase,
  );

  List<OrderEntity> orders = [];
  OrderMetaDataEntity? metaDataEntity;
  Timer? timer;
  SharedPreferences pref = Get.find<Services>().pref;
  String token = '-1';
  ScrollController orderScreenScrollController = ScrollController();
  bool isLoadMoreRunning = false;
  bool showLoading = false;
  int page = 0;
  bool isLastPage = false;

  @override
  void onReady() {
    super.onReady();
    token = pref.getString('token') ?? '-1';
    orderScreenScrollController.addListener(loadMore);
    getAllOrder(Get.context!).then((value) async {
      setTimerForActiveOrder();
      await checkOrderStatus();
    });
  }

  @override
  void onClose() {
    timer?.cancel();
    orderScreenScrollController.removeListener(loadMore);
    super.onClose();
  }

  setTimerForActiveOrder() {
    for (var item in orders) {
      List<String> time = pref.getStringList(item.id!) ?? [];
      if (time.isNotEmpty) {
        int difference =
            DateTime.now().difference(DateTime.parse(time[1])).inSeconds;
        if (difference < 3599 && item.status == 'pending') {
          item.remainedTime = int.parse(time[0]) - difference;
        } //
        else {
          pref.remove(item.id!);
        }
      }
    }
    if (orders
        .any((item) => item.remainedTime != null && item.remainedTime != 0)) {
      timer?.cancel();
      timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        for (var item in orders) {
          if (item.remainedTime != null && item.remainedTime! > 0) {
            item.remainedTime = item.remainedTime! - 1;
            if (!orders.any((element) =>
                element.remainedTime != null && element.remainedTime! > 0)) {
              timer.cancel();
            }
          }
          if (item.remainedTime != null && item.remainedTime! <= 0) {
            updateOrderStatus(id: item.id!);
          }
        }
        update();
      });
    }
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

  goToSingleOrderScreen(context, {required OrderEntity order}) async {
    showLoading = true;
    update();
    var response =
        await _getSingleOrderUseCase.execute(id: order.id!, token: token);
    if (response.data == null) {
      CommonMethods.showToast(context, response.error!);
    } //
    else {
      order.salon!.reservedTimes = response.data!.salon!.reservedTimes;
      Get.toNamed(Routes.orderViewScreen, arguments: order);
    }
    showLoading = false;
    update();
  }

  Future checkOrderStatus() async {
    for (var item in orders) {
      if (item.status == 'pending' &&
          (item.remainedTime == null || item.remainedTime == 0)) {
        await updateOrderStatus(id: item.id!);
      }
    }
    showLoading = false;
    update();
  }

  Future updateOrderStatus({required String id}) async {
    var response = await _updateOrderStatusUseCase.execute(
        id: id, status: 'canceled', token: token);
    if (response.data == null) {
      CommonMethods.showToast(
          Get.context!, 'خطایی در دریافت اطلاعات رخ داده است.');
    } //
    else {
      orders.firstWhere((order) => order.id == id).status = 'canceled';
      update();
    }
  }

  Future getAllOrder(context) async {
    if (token != '-1') {
      showLoading = true;
      update();
      var response = await _allOrderUseCase.execute(token: token);
      if (response.data == null) {
        CommonMethods.showToast(context, response.error!);
      } //
      else {
        orders = response.data!.$2;
        metaDataEntity = response.data?.$1;
        update();
      }
    }
  }

  void loadMore() async {
    if (!metaDataEntity!.hasLastPage! &&
        !isLoadMoreRunning &&
        orderScreenScrollController.position.extentAfter < 100) {
      isLoadMoreRunning = true;
      update();
      page += 1;
      var response = await _allOrderUseCase.execute(token: token, page: page);
      if (response.data != null) {
        List<OrderEntity> list = response.data!.$2;
        orders.addAll(list);
        metaDataEntity = response.data?.$1;
        setTimerForActiveOrder();
        checkOrderStatus();
      }
      isLoadMoreRunning = false;
      update();
    }
  }
}
