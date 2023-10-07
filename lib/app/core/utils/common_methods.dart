import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:toastification/toastification.dart';

class CommonMethods {
  CommonMethods._();

  static List<int> setDatesList(List<DateTime> dates) {
    List<int> dateIndices = [];
    for (int i = 0; i < dates.length; i++) {
      if (intl.DateFormat.yMd().format(dates[0]) !=
          intl.DateFormat.yMd().format(dates[i])) {
        if (dateIndices.isEmpty) {
          dateIndices.add(i);
        } //
        else if (dateIndices.isNotEmpty &&
            intl.DateFormat.yMd().format(dates[i]) !=
                intl.DateFormat.yMd().format(dates[i - 1])) {
          dateIndices.add(i);
        } //
      }
    }
    dateIndices.insert(0, 0);
    return dateIndices;
  }

  static showToast(BuildContext context, String text,
      {ToastificationType type = ToastificationType.error}) {
    toastification.show(
      context: context,
      type: type,
      style: ToastificationStyle.flat,
      title: 'خطا',
      description: text,
      alignment: Alignment.topCenter,
      autoCloseDuration: const Duration(seconds: 5),
      borderRadius: BorderRadius.circular(12.0),
      boxShadow: highModeShadow,
      direction: TextDirection.rtl,
      closeOnClick: false,
      dragToClose: true,
      pauseOnHover: false,
    );
  }
}
