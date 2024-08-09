import 'package:hive/hive.dart';

part 'order_model.g.dart'; // This file will be generated

@HiveType(typeId: 1)
class OrderModel extends HiveObject {
  @HiveField(0)
  final String address;

  @HiveField(1)
  final List<OrderItem> items;

  @HiveField(2)
  final double subtotal;

  @HiveField(3)
  final double deliveryCharges;

  @HiveField(4)
  final double total;

  @HiveField(5)
  final String paymentMethod;

  OrderModel({
    required this.address,
    required this.items,
    required this.subtotal,
    required this.deliveryCharges,
    required this.total,
    required this.paymentMethod,
  });
}

@HiveType(typeId: 2)
class OrderItem extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final double price;



  OrderItem({
    required this.id,
    required this.price,

  });
}
