// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['_id'] as String?,
      phoneNumber: json['phone_number'] as String?,
      name: json['name'] as String?,
      familyName: json['family_name'] as String?,
      groupName: json['group_name'] as String?,
      instagramPageAddress: json['instagram_page_address'] as String?,
      email: json['email'] as String?,
      otpCode: json['otp_code'] as String?,
      role: json['role'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      '_id': instance.id,
      'phone_number': instance.phoneNumber,
      'name': instance.name,
      'family_name': instance.familyName,
      'group_name': instance.groupName,
      'instagram_page_address': instance.instagramPageAddress,
      'email': instance.email,
      'otp_code': instance.otpCode,
      'role': instance.role,
    };
