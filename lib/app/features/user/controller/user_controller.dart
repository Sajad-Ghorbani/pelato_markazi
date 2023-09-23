import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pelato_markazi/app/config/routes/app_pages.dart';
import 'package:toastification/toastification.dart';
import 'package:url_launcher/url_launcher_string.dart';

class UserController extends GetxController {
  TextEditingController confirmCodeController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController fNameController = TextEditingController();
  TextEditingController groupNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController instagramController = TextEditingController();

  @override
  void onClose() {
    confirmCodeController.dispose();
    nameController.dispose();
    fNameController.dispose();
    groupNameController.dispose();
    emailController.dispose();
    instagramController.dispose();
  }

  void sendMessageWhatsApp(BuildContext context) async {
    var whatsapp = "+989024349208";
    var whatsappUrlAndroid =
        "whatsapp://send?phone=$whatsapp&text=سلام. من برای رزرو سالن مزاحمتون شدم.";

    if (await canLaunchUrlString(whatsappUrlAndroid)) {
      await launchUrlString(whatsappUrlAndroid);
    } else {
      toastification.show(
        context: context,
        type: ToastificationType.error,
        style: ToastificationStyle.flat,
        title: 'خطا',
        description: 'برنامه واتساپ بر روی گوشی شما نصب نمی باشد.',
        alignment: Alignment.topCenter,
        autoCloseDuration: const Duration(seconds: 3),
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: highModeShadow,
        direction: TextDirection.rtl,
        closeOnClick: false,
        dragToClose: true,
        pauseOnHover: false,
      );
    }
  }

  void checkConfirmCode() async {
    //TODO: check code with server and if correct then navigate to signup
    Get.toNamed(Routes.signupScreen);
  }

  void signup() async {
    //TODO: send data to server and go to home screen
    Get.offAllNamed(Routes.homeScreen);
  }
}
