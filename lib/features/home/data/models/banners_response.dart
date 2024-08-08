import 'package:auvnet_store/core/utils/app_strings.dart';
import 'package:json_annotation/json_annotation.dart';

part 'banners_response.g.dart';

@JsonSerializable(explicitToJson: true)
class BannersResponse {
  final String title;
  final List<String> images;

  BannersResponse({
    required this.title,
    required this.images,
  });

  factory BannersResponse.fromJson(Map<String, dynamic> json) =>
      _$BannersResponseFromJson(json);
// to get banners list;
  List<String> get bannerImageList {
    if (title == searchBannersKeyWord) {
      return images;
    }
    List<String> list = images;

    if (list.isEmpty) {
      return [];
    }
    return list;
  }
}
