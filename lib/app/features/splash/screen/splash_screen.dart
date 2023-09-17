import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pelato_markazi/app/features/splash/controller/splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: const Color(0xff093a38),
      body: Column(
        children: [
          const Spacer(),
          Image.asset(
            'assets/images/pelato_logo.png',
            width: width * 0.6,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'افتخار ما همکاری با حرفه ای هاست',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      // height: 25,
                      width: width * 0.7,
                      child: Directionality(
                        textDirection: TextDirection.ltr,
                        child: GetBuilder<SplashController>(
                          builder: (controller) {
                            return LinearProgressIndicator(
                              color: const Color(0xfffdce66),
                              backgroundColor: Colors.white,
                              minHeight: 3,
                              value: controller.animation,
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
