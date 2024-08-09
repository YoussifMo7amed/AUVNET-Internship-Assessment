import 'package:auvnet_store/features/cart/presentation/widgets/build_summary_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({
    required this.numberOfItems,
    required this.subtotal,
    required this.deliveryCharges,
    required this.total,
    super.key,
  });

  final int numberOfItems;
  final double subtotal;
  final double deliveryCharges;
  final double total;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BuildSummaryRow('Number of Items:', '$numberOfItems', context),
          SizedBox(height: 10.h),
          BuildSummaryRow(
              'Subtotal:', '\$${subtotal.toStringAsFixed(2)}', context),
          SizedBox(height: 10.h),
          BuildSummaryRow('Delivery Charges:',
              '\$${deliveryCharges.toStringAsFixed(2)}', context),
          Divider(thickness: 1.h),
          SizedBox(height: 10.h),
          BuildSummaryRow(
            'Total:',
            '\$${total.toStringAsFixed(2)}',
            context,
            isTotal: true,
          ),
        ],
      ),
    );
  }
}
