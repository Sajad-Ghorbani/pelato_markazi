import 'package:flutter/material.dart';
import 'package:pelato_markazi/app/config/theme/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.controller,
    this.labelIcon,
    required this.labelText,
    this.keyboardType,
  });

  final TextEditingController? controller;
  final Widget? labelIcon;
  final String labelText;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: TextField(
        controller: controller,
        onTapOutside: (event) {
          FocusScope.of(context).unfocus();
        },
        keyboardType: keyboardType,
        decoration: InputDecoration(
          label: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              labelIcon != null
                  ? Row(
                      children: [
                        labelIcon!,
                        const SizedBox(width: 5),
                      ],
                    )
                  : const SizedBox.shrink(),
              Text(labelText),
            ],
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(
              color: AppColors.lightGreenColor,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}
