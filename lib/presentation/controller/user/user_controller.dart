import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pelato_markazi/app/config/routes/app_pages.dart';
import 'package:pelato_markazi/app/core/user_param.dart';
import 'package:pelato_markazi/app/core/utils/common_methods.dart';
import 'package:pelato_markazi/app/services/services.dart';
import 'package:pelato_markazi/domain/use_cases/user/complete_profile_use_case.dart';
import 'package:pelato_markazi/domain/use_cases/user/confirm_code_use_case.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher_string.dart';

class UserController extends GetxController {
  final CompleteProfileUseCase _completeProfileUseCase;
  final ConfirmCodeUSeCase _confirmCodeUSeCase;

  UserController(this._completeProfileUseCase, this._confirmCodeUSeCase);

  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController confirmCodeController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController familyNameController = TextEditingController();
  TextEditingController groupNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController instagramController = TextEditingController();

  @override
  void onClose() {
    confirmCodeController.dispose();
    nameController.dispose();
    familyNameController.dispose();
    groupNameController.dispose();
    emailController.dispose();
    instagramController.dispose();
  }

  void sendMessageWhatsApp(context) async {
    var whatsapp = "+989024349208";
    var whatsappUrlAndroid =
        "whatsapp://send?phone=$whatsapp&text=سلام. من برای رزرو سالن مزاحمتون شدم.";
    var whatsappUrlIOS =
        "https://wa.me/$whatsapp?text=${Uri.parse("سلام. من برای رزرو سالن مزاحمتون شدم.")}";
    if (Platform.isIOS) {
      if (await canLaunchUrlString(whatsappUrlIOS)) {
        await launchUrlString(whatsappUrlIOS);
      } else {
        CommonMethods.showToast(
            context, 'برنامه واتساپ بر روی گوشی شما نصب نمی باشد.');
      }
    } //
    else {
      if (await canLaunchUrlString(whatsappUrlAndroid)) {
        await launchUrlString(whatsappUrlAndroid);
      } else {
        CommonMethods.showToast(
            context, 'برنامه واتساپ بر روی گوشی شما نصب نمی باشد.');
      }
    }
  }

  void checkConfirmCode(context) async {
    var response = await _confirmCodeUSeCase.execute(
        confirmCode: confirmCodeController.text.trim(),
        phone: phoneNumberController.text.trim());
    if (response.data == null) {
      CommonMethods.showToast(context, response.error!);
      return;
    } //
    Get.toNamed(Routes.signupScreen);
  }

  void signup(context) async {
    UserParams user = UserParams(
      name: nameController.text,
      familyName: familyNameController.text,
      groupName:
          groupNameController.text.isEmpty ? null : groupNameController.text,
      instagramPageAddress:
          instagramController.text.isEmpty ? null : instagramController.text,
      email: emailController.text.isEmpty ? null : emailController.text,
    );
    SharedPreferences pref = Get.find<Services>().pref;
    String token = pref.getString('token') ?? '-1';
    var response =
        await _completeProfileUseCase.execute(token: token, user: user);
    if (response.data == null) {
      CommonMethods.showToast(context, response.error!);
      return;
    }
    Get.offAllNamed(Routes.homeScreen);
  }
}
