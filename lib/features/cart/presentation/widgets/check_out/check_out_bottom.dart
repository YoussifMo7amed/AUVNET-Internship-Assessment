import 'package:auvnet_store/core/enums/payment_enum.dart';
import 'package:auvnet_store/core/extensions/context_extension.dart';
import 'package:auvnet_store/core/toast/show_toast.dart';
import 'package:auvnet_store/features/cart/data/models/order_model.dart';
import 'package:auvnet_store/features/cart/presentation/cubit/add_to_cart/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class CheckOutBottom extends StatelessWidget {
  const CheckOutBottom(
      {super.key,
      required this.addressController,
      required this.selectedPaymentMethod});
  final TextEditingController addressController;
  final PaymentMethod selectedPaymentMethod;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        final address = addressController.text;
        if (address.isNotEmpty) {
          placeOrder(context, address);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Please enter your address')),
          );
        }
      },
      child: const Text('Place Order'),
    );
  }

  void placeOrder(BuildContext context, String address) async {
    final cartCubit = context.read<CartCubit>();
    final cartItems = cartCubit.cartList;
    final order = OrderModel(
      address: address,
      items: cartItems
          .map((item) => OrderItem(
                id: item.id,
                price: double.parse(item.price),
              ))
          .toList(),
      subtotal: cartCubit.subtotal,
      deliveryCharges: cartCubit.deliveryCharges,
      total: cartCubit.total,
      paymentMethod: selectedPaymentMethod.toString().split('.').last,
    );

    try {
      final box = await Hive.openBox<OrderModel>('order_box');
      await box.add(order);
      ShowToast.showToastSuccessTop(
        message: 'Order placed successfully',
      );
      context.pop();
       // Clear the cart
    cartCubit.clearCart();
      // Optionally, clear cart or navigate to another page
    } catch (e) {
      ShowToast.showToastErrorTop(
        message: 'Failed to place order: $e',
      );
    }
  }
}
