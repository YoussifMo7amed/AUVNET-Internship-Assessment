// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_responce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileResponse _$ProfileResponseFromJson(Map<String, dynamic> json) =>
    ProfileResponse(
      (json['id'] as num?)?.toInt(),
      json['email'] as String?,
      json['name'] as String?,
    );

Map<String, dynamic> _$ProfileResponseToJson(ProfileResponse instance) =>
    <String, dynamic>{
      'id': instance.userId,
      'name': instance.userName,
      'email': instance.userEmail,
    };
