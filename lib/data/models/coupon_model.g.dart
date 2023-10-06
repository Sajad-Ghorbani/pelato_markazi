// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coupon_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Coupon _$CouponFromJson(Map<String, dynamic> json) => Coupon(
      id: json['_id'] as String?,
      code: json['code'] as String?,
      discount: json['discount'] as int?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$CouponToJson(Coupon instance) => <String, dynamic>{
      '_id': instance.id,
      'code': instance.code,
      'discount': instance.discount,
      'status': instance.status,
    };
