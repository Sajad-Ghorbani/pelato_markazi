import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pelato_markazi/app/config/routes/app_pages.dart';
import 'package:pelato_markazi/app/core/widgets/custom_text_field.dart';
import 'package:pelato_markazi/presentation/controller/user/user_controller.dart';

class SignUpScreen extends GetView<UserController> {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'ورود اطلاعات',
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Kalameh',
                    ),
              ),
              const SizedBox(height: 30),
              CustomTextField(
                controller: controller.nameController,
                labelIcon: const Text(
                  '*',
                  style: TextStyle(fontSize: 18, color: Colors.red),
                ),
                labelText: 'اسمتو اینجا وارد کن',
              ),
              const SizedBox(height: 30),
              CustomTextField(
                controller: controller.familyNameController,
                labelIcon: const Text(
                  '*',
                  style: TextStyle(fontSize: 18, color: Colors.red),
                ),
                labelText: 'فامیلتم اینجا وارد کن',
              ),
              const SizedBox(height: 30),
              CustomTextField(
                controller: controller.groupNameController,
                labelText: 'اگه گروه داری اسمشو بنویس',
              ),
              const SizedBox(height: 30),
              CustomTextField(
                controller: controller.emailController,
                labelText: 'ایمیلتو اینجا وارد کن',
              ),
              const SizedBox(height: 30),
              CustomTextField(
                controller: controller.instagramController,
                labelText: 'آدرس پیج اینستاگرامتم اینجا وارد کن',
              ),
              const SizedBox(height: 30),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '*',
                    style: TextStyle(fontSize: 18, color: Colors.red),
                  ),
                  SizedBox(width: 5),
                  Text('وارد کردن ستاره دارها اجباریه'),
                ],
              ),
              const Text('اگه دوست داری از پیشنهادهای ویژه بهره مند بشی، همه'
                  ' فیلدها رو تکمیل کن.'),
              const SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    controller.signup(context);
                  },
                  child: const Text('تکمیل اطلاعات'),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontFamily: 'Sans',
                      // fontSize: 12,
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                    children: [
                      const TextSpan(text: 'شرایط استفاده از خدمات و '),
                      TextSpan(
                        text: 'حریم خصوصی',
                        style: const TextStyle(color: Colors.blueAccent),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.toNamed(Routes.privacyAndPolicyScreen);
                          },
                      ),
                      const TextSpan(text: ' را میپذیرم.'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
