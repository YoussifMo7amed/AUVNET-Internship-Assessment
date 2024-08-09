import 'package:auvnet_store/features/cart/data/models/cart_model.dart';
import 'package:auvnet_store/features/cart/data/models/order_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveDatabase {
  factory HiveDatabase() => _instance;

  HiveDatabase._();

  static final HiveDatabase _instance = HiveDatabase._();

  Box<CartModel>? cartBox;
  Box<OrderModel>? orderBox;

  Future<void> setup() async {
    await Hive.initFlutter();

    Hive
      ..registerAdapter(CartModelAdapter())
      ..registerAdapter(OrderModelAdapter())
      ..registerAdapter(OrderItemAdapter());

    cartBox = await Hive.openBox<CartModel>('cart_box');

    orderBox = await Hive.openBox<OrderModel>('order_box');
  }

  Future<void> clearAllBox() async {
    await cartBox!.clear();
    await orderBox!.clear();
  }
}
