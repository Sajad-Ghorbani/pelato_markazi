import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pelato_markazi/app/core/utils/common_methods.dart';
import 'package:pelato_markazi/app/services/services.dart';
import 'package:pelato_markazi/domain/entities/salon_entity.dart';
import 'package:pelato_markazi/domain/use_cases/salon/get_all_salon_use_case.dart';
import 'package:pelato_markazi/presentation/pages/home/about_us_screen.dart';
import 'package:pelato_markazi/presentation/pages/home/home_screen.dart';
import 'package:pelato_markazi/presentation/pages/order/orders_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  final GetAllSalonsUseCase _allSalonsUseCase;

  HomeController(this._allSalonsUseCase);

  int currentIndex = 0;
  List<Widget> widgets = const [
    HomeScreen(),
    OrdersScreen(),
    AboutUsScreen(),
  ];

  List<SalonEntity> salonList = [];
  List<String> salonImages = [];

  @override
  void onReady() {
    super.onReady();
    getSalons(Get.context!);
  }

  void changePage(int index) {
    currentIndex = index;
    update();
  }

  void getSalons(context) async {
    SharedPreferences pref = Get.find<Services>().pref;
    String token = pref.getString('token') ?? '-1';
    if (token != '-1') {
      var response = await _allSalonsUseCase.execute(token: token);
      if (response.data != null) {
        salonList = response.data!;
        for (var value in salonList) {
          salonImages.addAll(value.images!);
        }
        update();
      } //
      else {
        CommonMethods.showToast(
          context,
          'خطایی در دریافت اطلاعات به وجود آمده است. دوباره تلاش کن',
        );
      }
    }
  }
}
