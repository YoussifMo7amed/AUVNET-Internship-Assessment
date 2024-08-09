import 'package:auvnet_store/core/service/hive/hive_database.dart';
import 'package:auvnet_store/features/cart/data/models/cart_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_state.dart';
part 'cart_cubit.freezed.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(const CartState.initial());

  final double deliveryCharges = 5.0; // Adjust this value as needed
  double subtotal = 0.0;
  double total = 0.0;

  Future<void> manageCart({
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
      await HiveDatabase().cartBox!.deleteAt(existingIndex);
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
    calculateTotals();
  }

  List<CartModel> get cartList {
    return HiveDatabase().cartBox!.values.toList();
  }

  void calculateTotals() {
    subtotal = 0.0; // Reset subtotal each time you calculate
    for (var item in cartList) {
      subtotal += double.parse(item.price);
    }
    total = subtotal + deliveryCharges;

    emit(CartState.totalsUpdated(
      numberOfItems: cartList.length,
      subtotal: subtotal,
      deliveryCharges: deliveryCharges,
      total: total,
    ));
  }

  void clearCart() {
    HiveDatabase().cartBox!.clear();
    calculateTotals();

    emit(const CartState.clearCart());
  }
}
