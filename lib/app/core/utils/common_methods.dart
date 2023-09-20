import 'package:intl/intl.dart';

class CommonMethods {
  CommonMethods._();

  static List<int> setDatesList(List<DateTime> dates) {
    List<int> dateIndices = [];
    for (int i = 0; i < dates.length; i++) {
      if (DateFormat.yMd().format(dates[0]) !=
          DateFormat.yMd().format(dates[i])) {
        if (dateIndices.isEmpty) {
          dateIndices.add(i);
        } //
        else if (dateIndices.isNotEmpty &&
            DateFormat.yMd().format(dates[i]) !=
                DateFormat.yMd().format(dates[i - 1])) {
          dateIndices.add(i);
        } //
      }
    }
    dateIndices.insert(0, 0);
    return dateIndices;
  }
}
