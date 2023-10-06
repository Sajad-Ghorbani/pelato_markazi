import 'package:intl/intl.dart';
import 'package:pelato_markazi/domain/entities/salon_entity.dart';

class OrderEntity {
  String? id;
  String? userId;
  SalonEntity? salon;
  int? totalCount;
  String? status;
  int? appliedCouponDiscount;
  String? paymentMethod;
  int? remainedAmount;
  int? paymentAmount;
  DateTime? orderDate;
  int? remainedTime;

  OrderEntity({
    this.id,
    this.userId,
    this.salon,
    this.totalCount,
    this.status,
    this.appliedCouponDiscount,
    this.paymentMethod,
    this.remainedAmount,
    this.paymentAmount,
    this.orderDate,
    this.remainedTime,
  });

  List<int> get orderDays {
    List<int> dateIndices = [];
    for (int i = 0; i < salon!.reservedTimes!.length; i++) {
      if (DateFormat.yMd().format(salon!.reservedTimes![0].day!) !=
          DateFormat.yMd().format(salon!.reservedTimes![i].day!)) {
        if (dateIndices.isEmpty) {
          dateIndices.add(i);
        } //
        else if (dateIndices.isNotEmpty &&
            DateFormat.yMd().format(salon!.reservedTimes![i].day!) !=
                DateFormat.yMd().format(salon!.reservedTimes![i - 1].day!)) {
          dateIndices.add(i);
        } //
      }
    }
    dateIndices.insert(0, 0);
    return dateIndices;
  }

  int get orderHours {
    return salon!.reservedTimes!.length;
  }
}
