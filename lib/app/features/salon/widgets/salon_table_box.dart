import 'package:flutter/material.dart';
import 'package:pelato_markazi/app/config/theme/app_colors.dart';

class SalonTableBox extends StatelessWidget {
  const SalonTableBox({
    super.key,
    this.onTap,
    this.child,
    this.status = '-1',
    this.isHeader = false,
  });

  final VoidCallback? onTap;
  final Widget? child;
  final String status;
  final bool isHeader;

  Color setColor(Color color) {
    return status == 'outdated'
        ? Colors.grey.withOpacity(0.3)
        : status == 'full'
            ? const Color(0xffFF0000)
            : status == 'reserved'
                ? const Color(0xffFAFA33)
                : status == 'selected'
                    ? const Color(0xff0FFF50)
                    : color;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double shapeWidth = (width - 68) / 8;
    return Container(
      margin: const EdgeInsets.all(3),
      child: Material(
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          side: BorderSide(
            color: setColor(Theme.of(context).colorScheme.outline),
          ),
        ),
        color: isHeader
            ? AppColors.greenColor.withOpacity(0.3)
            : setColor(Colors.white),
        child: InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          onTap: onTap,
          child: SizedBox(
            width: shapeWidth,
            height: shapeWidth,
            child: child,
          ),
        ),
      ),
    );
  }
}
