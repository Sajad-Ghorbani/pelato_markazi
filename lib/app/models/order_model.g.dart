// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => OrderModel(
      id: json['_id'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      salon: json['salon'] == null
          ? null
          : SalonModel.fromJson(json['salon'] as Map<String, dynamic>),
      totalCount: json['total_count'] as int?,
      status: json['status'] as String?,
      appliedCouponDiscount: json['applied_coupon_discount'] as int?,
      paymentMethod: json['payment_method'] as String?,
      remainedAmount: json['remained_amount'] as int?,
      paymentAmount: json['payment_amount'] as int?,
      orderDate: json['order_date'] == null
          ? null
          : DateTime.parse(json['order_date'] as String),
      remainedTime: json['remained_time'] as int?,
    );

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'user': instance.user,
      'salon': instance.salon,
      'total_count': instance.totalCount,
      'status': instance.status,
      'applied_coupon_discount': instance.appliedCouponDiscount,
      'payment_method': instance.paymentMethod,
      'remained_amount': instance.remainedAmount,
      'payment_amount': instance.paymentAmount,
      'order_date': instance.orderDate?.toIso8601String(),
      'remained_time': instance.remainedTime,
    };
