import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pelato_markazi/data/models/feature_model.dart';
import 'package:pelato_markazi/data/models/reserve_model.dart';
import 'package:pelato_markazi/data/models/salon_model.dart';
import 'package:pelato_markazi/domain/entities/order_entity.dart';

part 'order_model.g.dart';

@JsonSerializable()
class OrderModel {
  @JsonKey(name: "_id")
  String? id;
  @JsonKey(name: "user")
  String? userId;
  @JsonKey(name: "salon")
  SalonModel? salon;
  @JsonKey(name: "total_count")
  int? totalCount;
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "applied_coupon_discount")
  int? appliedCouponDiscount;
  @JsonKey(name: "payment_method")
  String? paymentMethod;
  @JsonKey(name: "remained_amount")
  int? remainedAmount;
  @JsonKey(name: "payment_amount")
  int? paymentAmount;
  @JsonKey(name: "order_date")
  DateTime? orderDate;
  @JsonKey(name: "remained_time")
  int? remainedTime;

  OrderModel({
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

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderModelToJson(this);

  factory OrderModel.fromEntity(Map<String, dynamic> entity) {
    return OrderModel();
  }

  OrderEntity toEntity() {
    return OrderEntity(
      id: id,
      userId: userId,
      salon: salon?.toEntity(),
      totalCount: totalCount,
      status: status,
      appliedCouponDiscount: appliedCouponDiscount,
      paymentMethod: paymentMethod,
      remainedAmount: remainedAmount,
      paymentAmount: paymentAmount,
      orderDate: orderDate,
      remainedTime: remainedTime,
    );
  }
}

List<OrderModel> orderList = [
  OrderModel(
    salon: SalonModel(
      name: 'سالن شماره 1',
      area: 80,
      rentCost: 320000,
      images: ['assets/images/salon_1.jpg'],
      features: [
        FeatureModel(
          description: 'سیستم صوتی',
        ),
        FeatureModel(
          description: 'سیستم تهویه',
        ),
        FeatureModel(
          description: 'اسپلیت',
        ),
        FeatureModel(
          description: 'آینه',
        ),
        FeatureModel(
          description: 'کف پارکت',
        ),
        FeatureModel(
          description: 'محل تعویض لباس',
        ),
        FeatureModel(
          description: 'جا کفشی',
        ),
      ],
      reservedTimes: [
        ReserveModel(
          day: DateTime.now().add(const Duration(days: 2)),
          hours: '8-9',
          status: 'reserved',
        ),
        ReserveModel(
          day: DateTime.now().add(const Duration(days: 2)),
          hours: '9-10',
          status: 'reserved',
        ),
        ReserveModel(
          day: DateTime.now().add(const Duration(days: 2)),
          hours: '13-14',
          status: 'reserved',
        ),
        ReserveModel(
          day: DateTime.now().add(const Duration(days: 2)),
          hours: '14-15',
          status: 'reserved',
        ),
        ReserveModel(
          day: DateTime.now().add(const Duration(days: 2)),
          hours: '15-16',
          status: 'reserved',
        ),
        ReserveModel(
          day: DateTime.now().add(const Duration(days: 4)),
          hours: '10-11',
          status: 'reserved',
        ),
        ReserveModel(
          day: DateTime.now().add(const Duration(days: 4)),
          hours: '11-12',
          status: 'reserved',
        ),
        ReserveModel(
          day: DateTime.now().add(const Duration(days: 4)),
          hours: '17-18',
          status: 'reserved',
        ),
        ReserveModel(
          day: DateTime.now().add(const Duration(days: 4)),
          hours: '18-19',
          status: 'reserved',
        ),
        ReserveModel(
          day: DateTime.now().add(const Duration(days: 4)),
          hours: '19-20',
          status: 'reserved',
        ),
      ],
    ),
    totalCount: 6250000,
    status: 'pending',
    remainedTime: 3245,
    // days: 10,
    // hours: 25,
    orderDate: DateTime.now().subtract(const Duration(days: 1)),
  ),
  OrderModel(
    salon: salons[1],
    totalCount: 1250000,
    status: 'completed',
    // days: 4,
    // hours: 6,
    paymentAmount: 1000000,
    orderDate: DateTime.now().subtract(const Duration(days: 10)),
  ),
  OrderModel(
    salon: salons[2],
    totalCount: 1250000,
    status: 'canceled',
    // remainedTime: 0,
    // days: 4,
    // hours: 6,
    orderDate: DateTime.now().subtract(const Duration(days: 10)),
  ),
  OrderModel(
    salon: salons[0],
    totalCount: 2500000,
    status: 'completed',
    // days: 8,
    // hours: 10,
    orderDate: DateTime.now().subtract(const Duration(days: 23)),
  ),
];
