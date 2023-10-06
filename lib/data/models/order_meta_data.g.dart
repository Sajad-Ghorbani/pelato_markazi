// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_meta_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderMetaData _$OrderMetaDataFromJson(Map<String, dynamic> json) =>
    OrderMetaData(
      totalCount: json['total_count'] as int?,
      totalPages: json['total_pages'] as int?,
      hasLastPage: json['has_last_page'] as bool?,
      hasNextPage: json['has_next_page'] as bool?,
    );

Map<String, dynamic> _$OrderMetaDataToJson(OrderMetaData instance) =>
    <String, dynamic>{
      'total_count': instance.totalCount,
      'total_pages': instance.totalPages,
      'has_last_page': instance.hasLastPage,
      'has_next_page': instance.hasNextPage,
    };
