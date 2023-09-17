import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pelato_markazi/app/models/salon_model.dart';

class SalonController extends GetxController {
  List<String> timeSlots = List.generate(14, (index) {
    final startHour = 8 + index;
    final endHour = startHour + 1;
    return '$startHour-$endHour';
  });
  DateTime now = DateTime.now();

  List<List<Map<String, dynamic>>> days = [];
  late DateTime weekStart;

  SalonModel salon = Get.arguments;

  @override
  void onInit() {
    super.onInit();
    weekStart = mostRecentWeekday(now, 6);
    for (int i = 0; i < 7; i++) {
      List<Map<String, dynamic>> list = [];
      for (int j = 0; j < 14; j++) {
        list.add({'status': 'free', 'index': j});
      }
      days.add(list);
    }
    setTimesOfDays();
  }

  void setTimesOfDays() {
    int difference = now.difference(weekStart).inDays;
    for (int i = 0; i <= difference; i++) {
      days[i].fillRange(0, 14, {'status': 'outdated', 'index': 0});
    }
    for (int i = difference+1; i < days.length; i++) {
      for (var item in salon.reservesTime!) {
        if (DateFormat.yMd().format(weekStart.add(Duration(days: i))) ==
            DateFormat.yMd().format(item.day!)) {
          int index = timeSlots.indexOf(item.times!);
          days[i].removeAt(index);
          days[i].insert(index, {'status': item.status, 'index': index});
        } //
      }
    }
  }

  DateTime mostRecentWeekday(DateTime date, int weekday) {
    var dateTime = DateTime(
        date.year, date.month, date.day - (date.weekday - weekday) % 7);
    // for go to next week need to add 7 days to dateTime
    // dateTime = dateTime.add(const Duration(days: 14));
    // print(dateTime);
    return dateTime;
  }
}
