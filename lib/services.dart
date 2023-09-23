import 'dart:async';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Services extends GetxService {
  late SharedPreferences pref;

  Future<Services> init() async {
    pref = await SharedPreferences.getInstance();
    return this;
  }
}
