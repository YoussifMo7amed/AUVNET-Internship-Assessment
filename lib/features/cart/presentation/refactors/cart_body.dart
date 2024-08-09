import 'package:auvnet_store/core/common/widgets/custom_card_item.dart';
import 'package:auvnet_store/core/common/widgets/text_app.dart';
import 'package:auvnet_store/core/extensions/context_extension.dart';
import 'package:auvnet_store/core/extensions/string_exetension.dart';
import 'package:auvnet_store/core/routes/routers.dart';
import 'package:auvnet_store/features/cart/presentation/cubit/add_to_cart/cart_cubit.dart';
import 'package:auvnet_store/features/cart/presentation/widgets/add_to_cart/order_summary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// Update the path as needed

class CartBody extends StatelessWidget {
  const CartBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.w),
      child: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          final cubit = context.read<CartCubit>();
          if (context.read<CartCubit>().cartList.isEmpty) {
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.shopping_cart_outlined,
                  size: 80,
                  color: context.color.textColor,
                ),
                TextApp(
                    text: 'Your cart is empty',
                    theme: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: context.color.textColor,
                    )),
              ],
            ));
          }
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: context.read<CartCubit>().cartList.length,
                  itemBuilder: (context, index) {
                    final item = context.read<CartCubit>().cartList[index];
                    return CustomCartItem(
                      imageUrl: item.image.imageProductFormate(),
                      title: item.title,
                      price: double.parse(item.price),
                      onRemove: () {
                        context.read<CartCubit>().manageCart(
                              productId: item.id,
                              title: item.title,
                              image: item.image.imageProductFormate(),
                              price: item.price,
                              categoryName: item.categoryName,
                            );
                      },
                      quantity: 1,
                    );
                  },
                ),
              ),

              // Order Summary
              OrderSummary(
                numberOfItems: cubit.cartList.length,
                subtotal: cubit.subtotal,
                deliveryCharges: cubit.deliveryCharges,
                total: cubit.total,
              ),
              // Checkout Button
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Handle checkout
                    context.read<CartCubit>().calculateTotals();
                    context.pushName(Routes.checkout);
                  },
                  child: const Text('Proceed to Checkout'),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
