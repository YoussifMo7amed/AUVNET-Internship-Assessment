// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banners_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannersResponse _$BannersResponseFromJson(Map<String, dynamic> json) =>
    BannersResponse(
      title: json['title'] as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$BannersResponseToJson(BannersResponse instance) =>
    <String, dynamic>{
      'title': instance.title,
      'images': instance.images,
    };
