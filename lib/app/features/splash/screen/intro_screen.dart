import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pelato_markazi/app/features/splash/controller/splash_controller.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          Container(
            foregroundDecoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black,
                  Colors.transparent,
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.center,
                // stops: [0.15,1]
              ),
            ),
            child: Image.asset(
              'assets/images/pelato_salon_1.png',
              width: width,
              height: height,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: width,
            height: height,
            color: Colors.black.withOpacity(0.4),
          ),
          Positioned(
            top: 0,
            child: Container(
              height: 200,
              width: width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.8),
                    Colors.transparent,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: height * 0.25,
            child: Text(
              'اینجا میتونی ساعتهای تمرینتو رزرو کنی',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.white,
                  ),
            ),
          ),
          Positioned(
            bottom: height * 0.15,
            child: Material(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              color: const Color(0xff093a38),
              child: InkWell(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                onTap: () {
                  var controller =
                      Get.put<SplashController>(SplashController(context));
                  Future.delayed(Duration.zero, () {
                    controller.navigateToLoginScreen();
                  });
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 40),
                  child: Text(
                    'شروع کن',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
