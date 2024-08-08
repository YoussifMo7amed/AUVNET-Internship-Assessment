import 'package:auvnet_store/core/extensions/string_exetension.dart';
import 'package:auvnet_store/core/utils/app_strings.dart';
import 'package:json_annotation/json_annotation.dart';

part 'banners_response.g.dart';

@JsonSerializable()
class BannersResponse {
  final String title;
  final List<String> images;

  BannersResponse({required this.title, required this.images});

  factory BannersResponse.fromJson(Map<String, dynamic> json) =>
      _$BannersResponseFromJson(json);

 
}
