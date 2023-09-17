import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pelato_markazi/app/features/home/screen/about_us_screen.dart';
import 'package:pelato_markazi/app/features/home/screen/home_screen.dart';
import 'package:pelato_markazi/app/features/order/screen/orders_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  List<Widget> widgets = const [
    HomeScreen(),
    OrdersScreen(),
    AboutUsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Iconsax.home), label: 'صفحه اصلی'),
          BottomNavigationBarItem(icon: Icon(Iconsax.note), label: 'سفارشات'),
          BottomNavigationBarItem(icon: Icon(Iconsax.user), label: 'درباره ما'),
        ],
        iconSize: 30,
        showUnselectedLabels: false,
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
      ),
      body: widgets[currentIndex],
    );
  }
}
