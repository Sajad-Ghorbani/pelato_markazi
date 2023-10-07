import 'package:json_annotation/json_annotation.dart';
import 'package:pelato_markazi/data/models/feature_model.dart';
import 'package:pelato_markazi/data/models/reserve_model.dart';
import 'package:pelato_markazi/domain/entities/salon_entity.dart';

part 'salon_model.g.dart';

@JsonSerializable()
class SalonModel {
  @JsonKey(name: "_id")
  String? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "images")
  List<String>? images;
  @JsonKey(name: "features")
  List<FeatureModel>? features;
  @JsonKey(name: "rent_cost")
  int? rentCost;
  @JsonKey(name: "reserved_times")
  List<ReserveModel>? reservedTimes;
  @JsonKey(name: "area")
  int? area;

  SalonModel({
    this.id,
    this.name,
    this.images,
    this.features,
    this.rentCost,
    this.reservedTimes,
    this.area,
  });

  factory SalonModel.fromJson(Map<String, dynamic> json) =>
      _$SalonModelFromJson(json);

  Map<String, dynamic> toJson() => _$SalonModelToJson(this);

  SalonEntity toEntity() {
    return SalonEntity(
      id: id,
      name: name,
      images: images,
      features:
          features == null ? null : features!.map((e) => e.toEntity()).toList(),
      rentCost: rentCost,
      reservedTimes: reservedTimes == null
          ? null
          : reservedTimes!.map((e) => e.toEntity()).toList(),
      area: area,
    );
  }
}
