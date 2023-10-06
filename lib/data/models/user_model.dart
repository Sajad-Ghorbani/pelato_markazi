import 'package:json_annotation/json_annotation.dart';
import 'package:pelato_markazi/domain/entities/user_entity.dart';

part 'user_model.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: "_id")
  String? id;
  @JsonKey(name: "phone_number")
  String? phoneNumber;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "family_name")
  String? familyName;
  @JsonKey(name: "group_name")
  String? groupName;
  @JsonKey(name: "instagram_page_address")
  String? instagramPageAddress;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "otp_code")
  String? otpCode;
  @JsonKey(name: "role")
  String? role;

  User({
    this.id,
    this.phoneNumber,
    this.name,
    this.familyName,
    this.groupName,
    this.instagramPageAddress,
    this.email,
    this.otpCode,
    this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  factory User.fromEntity(UserEntity entity) => User(
        name: entity.name,
        familyName: entity.familyName,
        phoneNumber: entity.phoneNumber,
        groupName: entity.groupName,
        email: entity.email,
        instagramPageAddress: entity.instagramPageAddress,
      );

  UserEntity toEntity() => UserEntity(
        id: id,
        phoneNumber: phoneNumber,
        name: name,
        familyName: familyName,
        groupName: groupName,
        instagramPageAddress: instagramPageAddress,
        email: email,
        otpCode: otpCode,
        role: role,
      );
}
