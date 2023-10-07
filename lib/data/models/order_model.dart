import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
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