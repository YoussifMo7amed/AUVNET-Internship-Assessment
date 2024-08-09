import 'package:auvnet_store/core/service/hive/hive_database.dart';
import 'package:auvnet_store/features/cart/data/models/cart_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_state.dart';
part 'cart_cubit.freezed.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(const CartState.initial());
   Future<void> manageFavourites({
    required String productId,
    required String title,
    required String image,
    required String price,
    required String categoryName,
  }) async {
    emit(const CartState.initial());
    final existingIndex = HiveDatabase()
        .cartBox!
        .values
        .toList()
        .indexWhere((e) => e.id == productId);

    if (existingIndex >= 0) {
      await HiveDatabase().cartBox!.delete(existingIndex);
    } else {
      await HiveDatabase().cartBox!.add(
            CartModel(
              id: productId,
              title: title,
              image: image,
              price: price,
              categoryName: categoryName,
            ),
          );
    }
    emit(const CartState.addAndRemoveFromCart());
  }

  

  List<CartModel> get cartList {
    return HiveDatabase().cartBox!.values.toList();
  }
}
