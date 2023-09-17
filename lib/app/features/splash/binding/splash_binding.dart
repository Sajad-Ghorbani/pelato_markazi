import 'package:get/get.dart';
import 'package:pelato_markazi/app/features/splash/controller/splash_controller.dart';

class SplashBinding implements Bindings{
  @override
  void dependencies() async{
    Get.put<SplashController>(SplashController());
  }
}