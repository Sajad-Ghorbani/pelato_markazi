import 'package:json_annotation/json_annotation.dart';

part 'reserve_model.g.dart';

@JsonSerializable()
class ReserveModel {
  @JsonKey(name: "_id")
  String? id;
  @JsonKey(name: "day")
  DateTime? day;
  @JsonKey(name: "hours")
  String? hours;
  @JsonKey(name: "status")
  String? status;

  ReserveModel({
    this.id,
    this.day,
    this.hours,
    this.status,
  });

  factory ReserveModel.fromJson(Map<String, dynamic> json) => _$ReserveModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReserveModelToJson(this);
}