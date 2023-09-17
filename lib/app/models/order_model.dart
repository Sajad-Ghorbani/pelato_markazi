import 'package:pelato_markazi/app/models/salon_model.dart';

class OrderModel {
  String? id;
  String? userId;
  SalonModel? salon;
  int? totalCount;
  String? status;
  int? remainedTime;
  int? days;
  int? hours;
  int? payAmount;

  OrderModel({
    this.id,
    this.userId,
    this.salon,
    this.totalCount,
    this.status,
    this.remainedTime,
    this.days,
    this.hours,
    this.payAmount,
  });
}

List<OrderModel> orderList = [
  OrderModel(
    salon: salons[0],
    totalCount: 6250000,
    status: 'pending',
    remainedTime: 3245,
    days: 10,
    hours: 25,
  ),
  OrderModel(
    salon: salons[1],
    totalCount: 1250000,
    status: 'completed',
    days: 4,
    hours: 6,
    payAmount: 1000000,
  ),
  OrderModel(
    salon: salons[2],
    totalCount: 1250000,
    status: 'canceled',
    remainedTime: 0,
    days: 4,
    hours: 6,
  ),
  OrderModel(
    salon: salons[0],
    totalCount: 2500000,
    status: 'completed',
    days: 8,
    hours: 10,
  ),
];
