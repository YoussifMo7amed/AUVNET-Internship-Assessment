import 'package:auvnet_store/core/common/widgets/custom_app_bar.dart';
import 'package:auvnet_store/core/common/widgets/text_app.dart';
import 'package:auvnet_store/core/enums/payment_enum.dart';
import 'package:auvnet_store/core/extensions/context_extension.dart';
import 'package:auvnet_store/core/styles/fonts/font_wieght_helper.dart';
import 'package:auvnet_store/features/cart/presentation/cubit/add_to_cart/cart_cubit.dart';
import 'package:auvnet_store/features/cart/presentation/widgets/add_to_cart/order_summary.dart';
import 'package:auvnet_store/features/cart/presentation/widgets/check_out/check_out_bottom.dart';
import 'package:auvnet_store/features/cart/presentation/widgets/check_out/check_out_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckoutBody extends StatefulWidget {
  const CheckoutBody({super.key});

  @override
  CheckoutBodyState createState() => CheckoutBodyState();
}

class CheckoutBodyState extends State<CheckoutBody> {
  final addressController = TextEditingController();
  PaymentMethod selectedPaymentMethod = PaymentMethod.creditCard;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Checkout'),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          final cubit = context.read<CartCubit>();
          return state.maybeWhen(
            initial: () => const Center(child: CircularProgressIndicator()),
            totalsUpdated: (numberOfItems, subtotal, deliveryCharges, total) {
              return SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextApp(
                      text: 'Order Summary',
                      theme: context.textStyle.copyWith(
                        fontSize: 20.sp,
                        fontWeight: FontWeightHelper.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: cubit.cartList.length,
                      itemBuilder: (context, index) {
                        final item = cubit.cartList[index];
                        return CheckOutItem(item: item);
                      },
                    ),
                    OrderSummary(
                      numberOfItems: cubit.cartList.length,
                      subtotal: cubit.subtotal,
                      deliveryCharges: cubit.deliveryCharges,
                      total: cubit.total,
                    ),
                    TextFormField(
                      controller: addressController,
                      style: TextStyle(
                        color: context.color.textColor,
                      ),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter your address',
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextApp(
                        text: 'Payment Method',
                        theme: context.textStyle.copyWith(
                          fontSize: 20.sp,
                          fontWeight: FontWeightHelper.bold,
                        )),
                    DropdownButton<PaymentMethod>(
                      dropdownColor: context.color.mainColor,
                      value: selectedPaymentMethod,
                      items: PaymentMethod.values.map((PaymentMethod method) {
                        return DropdownMenuItem<PaymentMethod>(
                          value: method,
                          child: TextApp(
                            text: method.toString().split('.').last,
                            theme: context.textStyle.copyWith(
                              fontSize: 16.sp,
                              fontWeight: FontWeightHelper.bold,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (PaymentMethod? newMethod) {
                        setState(() {
                          selectedPaymentMethod = newMethod!;
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    CheckOutBottom(
                      addressController: addressController,
                      selectedPaymentMethod: selectedPaymentMethod,
                    ),
                  ],
                ),
              );
            },
            orElse: () => const Center(child: Text('Something went wrong.')),
          );
        },
      ),
    );
  }
}
