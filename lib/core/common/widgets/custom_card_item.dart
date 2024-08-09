import 'package:auvnet_store/core/common/widgets/text_app.dart';
import 'package:auvnet_store/core/extensions/context_extension.dart';
import 'package:auvnet_store/core/styles/fonts/font_wieght_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CustomCartItem extends StatelessWidget {
  const CustomCartItem({
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.quantity,
    required this.onRemove,
    super.key,
  });

  final String imageUrl;
  final String title;
  final double price;
  final int quantity;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        children: [
          CachedNetworkImage(
            imageUrl: imageUrl,
            height: 100.h,
            width: 100.w,
            fit: BoxFit.cover,
            errorWidget: (context, url, error) => const Icon(
              Icons.error,
              color: Colors.red,
              size: 70,
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextApp(
                  text: title,
                  theme: context.textStyle.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeightHelper.bold,
                  ),
                  maxLines: 1, // Ensures title fits within one line
                ),
                SizedBox(height: 5.h),
                TextApp(
                  text: '\$ $price',
                  theme: context.textStyle.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeightHelper.medium,
                  ),
                ),
                SizedBox(height: 5.h),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.remove_circle_outline),
            color: context.color.textColor,
            onPressed: onRemove, // Calls the provided callback when pressed
          ),
        ],
      ),
    );
  }
}
