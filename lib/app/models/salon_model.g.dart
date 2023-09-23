// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'salon_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SalonModel _$SalonModelFromJson(Map<String, dynamic> json) => SalonModel(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      features: (json['features'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      rentCost: json['rent_rentCost'] as int?,
      reservedTimes: (json['reserved_times'] as List<dynamic>?)
          ?.map((e) => ReserveModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      area: json['area'] as int?,
    );

Map<String, dynamic> _$SalonModelToJson(SalonModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'images': instance.images,
      'features': instance.features,
      'rent_rentCost': instance.rentCost,
      'reserved_times': instance.reservedTimes,
      'area': instance.area,
    };
