// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reserve_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReserveModel _$ReserveModelFromJson(Map<String, dynamic> json) => ReserveModel(
      id: json['_id'] as String?,
      day: json['day'] == null ? null : DateTime.parse(json['day'] as String),
      hours: json['hours'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$ReserveModelToJson(ReserveModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'day': instance.day?.toIso8601String(),
      'hours': instance.hours,
      'status': instance.status,
    };
