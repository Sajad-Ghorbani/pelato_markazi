import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pelato_markazi/app/config/routes/app_pages.dart';
import 'package:pelato_markazi/app/core/widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('ورود', style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              fontFamily: 'Kalameh',
              fontWeight: FontWeight.bold,
            )),
            const SizedBox(height: 30),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: Theme.of(context).textTheme.bodyMedium,
                children: [
                  const TextSpan(text: 'برای استفاده از برنامه به شماره '),
                  TextSpan(
                    text: 'واتساپ 09024349208',
                    style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        //TODO: go to whats app and send message
                      },
                  ),
                  const TextSpan(
                      text:
                          ' پیام بده و کد تایید دریافت شده رو اینجا وارد کن.'),
                ],
              ),
            ),
            const SizedBox(height: 30),
            const CustomTextField(
              labelIcon: Icon(Iconsax.edit_2),
              labelText: 'کد فعالسازی رو وارد کن',
            ),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  //TODO: check code with server and if correct then navigate to signup
                  Get.offNamed(Routes.signupScreen);
                },
                child: const Text('تایید'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
