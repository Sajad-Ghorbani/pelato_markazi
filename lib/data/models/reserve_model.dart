import 'package:json_annotation/json_annotation.dart';
import 'package:pelato_markazi/domain/entities/reserve_entity.dart';

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

  factory ReserveModel.fromJson(Map<String, dynamic> json) =>
      _$ReserveModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReserveModelToJson(this);

  ReserveEntity toEntity() =>
      ReserveEntity(id: id, hours: hours, status: status, day: day);
}
