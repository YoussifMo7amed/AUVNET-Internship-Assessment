import 'package:json_annotation/json_annotation.dart';

part 'categories_response.g.dart';
@JsonSerializable()
class CategoryResponse {
  final int id;
  final String name;
  final String image;


  CategoryResponse({
    required this.id,
    required this.name,
    required this.image,

  });

  factory CategoryResponse.fromJson(Map<String, dynamic> json) => _$CategoryResponseFromJson(json);
}
