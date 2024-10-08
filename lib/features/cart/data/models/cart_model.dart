// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive_flutter/hive_flutter.dart';
part 'cart_model.g.dart';

@HiveType(typeId: 0)
class CartModel {
  CartModel(
      {required this.id,
      required this.title,
      required this.image,
      required this.price,
      required this.categoryName});

  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String image;

  @HiveField(3)
  final String price;

  @HiveField(4)
  final String categoryName;
}
