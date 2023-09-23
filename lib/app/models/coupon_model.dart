import 'package:json_annotation/json_annotation.dart';

part 'coupon_model.g.dart';

@JsonSerializable()
class Coupon {
  @JsonKey(name: "_id")
  String? id;
  @JsonKey(name: "code")
  String? code;
  @JsonKey(name: "discount")
  int? discount;
  @JsonKey(name: "status")
  String? status;

  Coupon({
    this.id,
    this.code,
    this.discount,
    this.status,
  });

  factory Coupon.fromJson(Map<String, dynamic> json) => _$CouponFromJson(json);

  Map<String, dynamic> toJson() => _$CouponToJson(this);
}