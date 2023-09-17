import 'package:get/get.dart';
import 'package:pelato_markazi/app/config/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  double animation = 0;
  late SharedPreferences pref;

  @override
  void onInit() async {
    pref = await SharedPreferences.getInstance();
    changeAnimation();
    super.onInit();
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
        Get.offNamed(Routes.homeScreen);
      }
    });
  }

  void navigateToLoginScreen() async {
    await pref.setBool('showIntro', false);
    Get.offNamed(Routes.loginScreen);
  }
}
