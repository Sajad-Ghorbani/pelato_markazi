import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pelato_markazi/presentation/controller/splash/splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put<SplashController>(SplashController(context));
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
                    GetBuilder<SplashController>(
                      builder: (controller) {
                        if (controller.isConnected) {
                          return SizedBox(
                            width: width * 0.7,
                            child: Directionality(
                              textDirection: TextDirection.ltr,
                              child: LinearProgressIndicator(
                                color: const Color(0xfffdce66),
                                backgroundColor: Colors.white,
                                minHeight: 3,
                                value: controller.animation,
                              ),
                            ),
                          );
                        } //
                        else {
                          return InkWell(
                            onTap: () {
                              controller.initConnectivity();
                            },
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                color: Theme.of(context).colorScheme.error,
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 8),
                              child: const Text(
                                'دوباره تلاش کن',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          );
                        }
                      },
                    ),
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
