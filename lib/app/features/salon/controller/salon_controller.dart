import 'dart:async';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pelato_markazi/app/core/utils/common_methods.dart';
import 'package:pelato_markazi/app/models/salon_model.dart';

class SalonController extends GetxController {
  List<String> timeSlots = List.generate(14, (index) {
    final startHour = 8 + index;
    final endHour = startHour + 1;
    return '$startHour-$endHour';
  });
  DateTime now = DateTime.now();
  Timer? timer;
  int startTime = 3599;

  List<List<Map<String, dynamic>>> days = [];
  List<Map<String, dynamic>> selectedDays = [];
  late DateTime weekStart;

  SalonModel salon = Get.arguments;

  int weekIndex = 0;
  List<int> daysCount = [];
  int sum = 0;

  @override
  void onInit() {
    super.onInit();
    weekStart = mostRecentWeekday(now, 6);
    setTimesOfDays();
  }

  void setTimesOfDays() {
    days.clear();
    for (int i = 0; i < 7; i++) {
      List<Map<String, dynamic>> list = [];
      for (int j = 0; j < 14; j++) {
        list.add({'status': 'free', 'index': j});
      }
      days.add(list);
    }
    int difference = -1;
    if (weekIndex == 0) {
      difference = now.difference(weekStart).inDays;
      for (int i = 0; i <= difference; i++) {
        days[i].fillRange(0, 14, {'status': 'outdated', 'index': 0});
      }
    }
    for (int i = difference + 1; i < days.length; i++) {
      for (var item in salon.reservesTime!) {
        setItemOfDate(item.day!, i, item.times!, item.status!);
      }
      for (var item in selectedDays) {
        setItemOfDate(item['day'], i, item['hour'], 'selected');
      }
    }
    sum = selectedDays.length * salon.cost!;
    update();
  }

  setItemOfDate(DateTime date, int daysIndex, String hour, String status) {
    if (DateFormat.yMd().format(weekStart.add(Duration(days: daysIndex))) ==
        DateFormat.yMd().format(date)) {
      int index = timeSlots.indexOf(hour);
      days[daysIndex].removeAt(index);
      days[daysIndex].insert(index, {'status': status, 'index': index});
    }
  }

  DateTime mostRecentWeekday(DateTime date, int weekday) {
    var dateTime = DateTime(
        date.year, date.month, date.day - (date.weekday - weekday) % 7);
    return dateTime;
  }

  onTimeTap(Map<String, dynamic> item, int dayIndex) {
    if (item['status'] == 'free') {
      item['status'] = 'selected';
      selectedDays.add({
        'day': weekStart.add(Duration(days: dayIndex)),
        'hour': timeSlots[item['index']]
      });
    } //
    else {
      item['status'] = 'free';
      selectedDays.removeWhere(
        (element) =>
            element['day'] == weekStart.add(Duration(days: dayIndex)) &&
            element['hour'] == timeSlots[item['index']],
      );
    }
    update();
    selectedDays
        .sort((a, b) => (a['day'] as DateTime).compareTo(b['day'] as DateTime));
    calculateCountOfDays(selectedDays);
    sum = selectedDays.length * salon.cost!;
    update();
  }

  calculateCountOfDays(List<Map<String, dynamic>> days) {
    List<DateTime> list = [];
    for (var value in days) {
      list.add(value['day']);
    }
    daysCount = CommonMethods.setDatesList(list);
    update();
  }

  void goToPreWeek() {
    if (weekStart.isAfter(DateTime.now())) {
      weekIndex--;
      weekStart = weekStart.subtract(const Duration(days: 7));
      setTimesOfDays();
      update();
    }
  }

  void goToNextWeek() {
    if (weekIndex <= 13) {
      weekIndex++;
      weekStart = weekStart.add(const Duration(days: 7));
      setTimesOfDays();
      update();
    }
  }

  startTimer() {
    if (timer?.isActive ?? false) {
    } //
    else {
      timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (startTime > 0) {
          startTime--;
          update();
        } //
        else {
          timer.cancel();
        }
      });
    }
  }
}
