import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class BaseWidget extends StatelessWidget {
  const BaseWidget({
    super.key,
    required this.appBarTitle,
    required this.child,
    this.showLeading = false,
  });

  final String appBarTitle;
  final Widget child;
  final bool showLeading;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(6),
            child: Image.asset(
              'assets/images/pelato_logo.png',
              fit: BoxFit.fitHeight,
            ),
          )
        ],
        leading: showLeading
            ? IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Iconsax.arrow_right_3),
                color: Colors.white,
              )
            : null,
        title: Text(
          appBarTitle,
          style: TextStyle(
            color: Theme.of(context).colorScheme.surface,
          ),
        ),
      ),
      body: child,
    );
  }
}
