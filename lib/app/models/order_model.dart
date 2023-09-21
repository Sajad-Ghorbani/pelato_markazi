import 'package:pelato_markazi/app/models/reserve_model.dart';
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
  DateTime? date;

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
    this.date,
  });
  //TODO: calculate hour and date
  getHour() {
    // for (var item in salon!.reservesTime!) {
    //   if(){}
    // }
  }
}

List<OrderModel> orderList = [
  OrderModel(
    salon: SalonModel(
      name: 'سالن شماره 1',
      area: 80,
      cost: 320000,
      images: ['assets/images/salon_1.jpg'],
      features: [
        'آکوستیک',
        'سیستم صوتی',
        'سیستم تهویه',
        'اسپلیت',
        'آینه',
        'کف پارکت',
        'محل تعویض لباس',
        'جا کفشی',
      ],
      reservesTime: [
        ReserveModel(
          day: DateTime.now().add(const Duration(days: 2)),
          times: '8-9',
          status: 'full',
        ),
        ReserveModel(
          day: DateTime.now().add(const Duration(days: 2)),
          times: '9-10',
          status: 'full',
        ),
        ReserveModel(
          day: DateTime.now().add(const Duration(days: 2)),
          times: '13-14',
          status: 'full',
        ),
        ReserveModel(
          day: DateTime.now().add(const Duration(days: 2)),
          times: '14-15',
          status: 'full',
        ),
        ReserveModel(
          day: DateTime.now().add(const Duration(days: 2)),
          times: '15-16',
          status: 'full',
        ),
        ReserveModel(
          day: DateTime.now().add(const Duration(days: 4)),
          times: '10-11',
          status: 'reserved',
        ),
        ReserveModel(
          day: DateTime.now().add(const Duration(days: 4)),
          times: '11-12',
          status: 'reserved',
        ),
        ReserveModel(
          day: DateTime.now().add(const Duration(days: 4)),
          times: '17-18',
          status: 'full',
        ),
        ReserveModel(
          day: DateTime.now().add(const Duration(days: 4)),
          times: '18-19',
          status: 'full',
        ),
        ReserveModel(
          day: DateTime.now().add(const Duration(days: 4)),
          times: '19-20',
          status: 'full',
        ),
      ],
    ),
    totalCount: 6250000,
    status: 'pending',
    remainedTime: 3245,
    days: 10,
    hours: 25,
    date: DateTime.now().subtract(const Duration(days: 1)),
  ),
  OrderModel(
    salon: salons[1],
    totalCount: 1250000,
    status: 'completed',
    days: 4,
    hours: 6,
    payAmount: 1000000,
    date: DateTime.now().subtract(const Duration(days: 10)),
  ),
  OrderModel(
    salon: salons[2],
    totalCount: 1250000,
    status: 'canceled',
    remainedTime: 0,
    days: 4,
    hours: 6,
    date: DateTime.now().subtract(const Duration(days: 10)),
  ),
  OrderModel(
    salon: salons[0],
    totalCount: 2500000,
    status: 'completed',
    days: 8,
    hours: 10,
    date: DateTime.now().subtract(const Duration(days: 23)),
  ),
];
