import 'dart:async';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pelato_markazi/app/config/routes/app_pages.dart';
import 'package:pelato_markazi/app/services/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toastification/toastification.dart';

class SplashController extends GetxController {
  final BuildContext context;

  SplashController(this.context);

  double animation = 0;
  SharedPreferences pref = Get.find<Services>().pref;
  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  bool isConnected = false;

  @override
  void onInit() {
    initConnectivity();
    super.onInit();
  }

  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      log("Couldn't check connectivity status", error: e);
      return;
    }

    return _updateConnectionStatus(result);
  }

  void _updateConnectionStatus(ConnectivityResult result) {
    _connectionStatus = result;
    if (_connectionStatus == ConnectivityResult.mobile ||
        _connectionStatus == ConnectivityResult.wifi) {
      isConnected = true;
      changeAnimation();
      update();
    } //
    else {
      isConnected = false;
      showNotification();
    }
  }

  showNotification() {
    Future.delayed(Duration.zero, () {
      toastification.show(
        context: context,
        autoCloseDuration: const Duration(seconds: 5),
        type: ToastificationType.error,
        style: ToastificationStyle.flat,
        title: 'خطا',
        description: 'برای استفاده از برنامه باید اینترنت گوشی را روشن کنید',
        alignment: Alignment.topCenter,
        borderRadius: BorderRadius.circular(12.0),
        closeButtonShowType: CloseButtonShowType.none,
        boxShadow: highModeShadow,
        direction: TextDirection.rtl,
        closeOnClick: false,
        dragToClose: true,
        pauseOnHover: false,
      );
      update();
    });
  }

  changeAnimation() async {
    List<double> value = List.generate(8200, (index) => index * 0.0001);
    await Future.forEach(value, (i) async {
      if (i == 0.3) {
        await Future.delayed(const Duration(milliseconds: 1200));
      } //
      else if (i == 0.75) {
        await Future.delayed(const Duration(seconds: 2));
      } //
      else if (i > 0.8) {
        await Future.delayed(const Duration(microseconds: 1), () {
          animation = i * 2;
          update();
        });
      } //
      else {
        await Future.delayed(const Duration(microseconds: 1), () {
          animation = i;
          update();
        });
      }
    });
    Future.delayed(const Duration(seconds: 1), () async {
      bool showIntro = pref.getBool('showIntro') ?? true;
      if (showIntro) {
        Get.offNamed(Routes.introScreen);
      } //
      else {
        bool isLogin = pref.getBool('isLogin') ?? false;
        if (isLogin) {
          Get.offNamed(Routes.homeScreen);
        } //
        else {
          Get.offNamed(Routes.loginScreen);
        }
      }
    });
  }

  void navigateToLoginScreen() async {
    await pref.setBool('showIntro', false);
    Get.offNamed(Routes.loginScreen);
  }
}
