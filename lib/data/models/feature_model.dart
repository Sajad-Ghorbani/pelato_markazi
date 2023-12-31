import 'package:json_annotation/json_annotation.dart';
import 'package:pelato_markazi/domain/entities/feature_entity.dart';

part 'feature_model.g.dart';

@JsonSerializable()
class FeatureModel {
  @JsonKey(name: "_id")
  String? id;
  @JsonKey(name: "description")
  String? description;

  FeatureModel({
    this.id,
    this.description,
  });

  factory FeatureModel.fromJson(Map<String, dynamic> json) =>
      _$FeatureModelFromJson(json);

  Map<String, dynamic> toJson() => _$FeatureModelToJson(this);

  FeatureEntity toEntity() => FeatureEntity(id: id, description: description);
}
