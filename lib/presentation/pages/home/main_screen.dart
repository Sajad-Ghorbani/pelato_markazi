import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pelato_markazi/presentation/controller/home/home_controller.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Iconsax.home), label: 'صفحه اصلی'),
              BottomNavigationBarItem(
                  icon: Icon(Iconsax.note), label: 'سفارشات'),
              BottomNavigationBarItem(
                  icon: Icon(Iconsax.user), label: 'درباره ما'),
            ],
            iconSize: 30,
            showUnselectedLabels: false,
            currentIndex: controller.currentIndex,
            onTap: (value) {
              controller.changePage(value);
            },
          ),
          body: controller.widgets[controller.currentIndex],
        );
      },
    );
  }
}
