import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pelato_markazi/app/features/home/screen/about_us_screen.dart';
import 'package:pelato_markazi/app/features/home/screen/home_screen.dart';
import 'package:pelato_markazi/app/features/order/screen/orders_screen.dart';
import 'package:pelato_markazi/app/models/salon_model.dart';

class HomeController extends GetxController{
  int currentIndex = 0;
  List<Widget> widgets = const [
    HomeScreen(),
    OrdersScreen(),
    AboutUsScreen(),
  ];

  List<SalonModel> salonList = salons;

  void changePage(int index) {
    currentIndex = index;
    update();
  }


}