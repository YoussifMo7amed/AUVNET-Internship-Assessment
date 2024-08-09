import 'package:auvnet_store/core/common/widgets/text_app.dart';
import 'package:auvnet_store/core/extensions/context_extension.dart';
import 'package:auvnet_store/core/styles/fonts/font_wieght_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:auvnet_store/features/cart/data/models/order_model.dart';

class HistoryOrderBody extends StatelessWidget {
  const HistoryOrderBody({super.key});

  @override
  Widget build(BuildContext context) {
    final orderBox = Hive.box<OrderModel>('order_box'); // Fetch the order box
    final orders = orderBox.values.toList(); // Convert the box to a list

    return ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          // Provide default values for potential null fields
          final orderId = order.key.toString(); // Convert Hive key to String
          final orderAddress =
              order.address ; // Fallback date
         
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: context.color.mainColor,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.45),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image of the order - using the first item as a representative image
                                   // Order details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextApp(
                            text:
                                'Order#: $orderId', // Using Hive key as order ID
                            theme: context.textStyle.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeightHelper.bold,
                            )),
                        const SizedBox(height: 8),
                        TextApp(
                          text: orderAddress, // Display the order date
                          theme: context.textStyle.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeightHelper.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextApp(
                          text:
                              'Total: ${order.total.toStringAsFixed(2)}', // Display the order total
                          theme: context.textStyle.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeightHelper.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextApp(
                          text:
                              'Payment Method: ${order.paymentMethod}', // Display the order status
                          theme: context.textStyle.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeightHelper.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
