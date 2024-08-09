import 'package:auvnet_store/core/common/widgets/text_app.dart';
import 'package:auvnet_store/core/extensions/context_extension.dart';
import 'package:auvnet_store/core/extensions/string_exetension.dart';
import 'package:auvnet_store/core/styles/fonts/font_wieght_helper.dart';
import 'package:auvnet_store/features/cart/data/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckOutItem extends StatelessWidget {
  const CheckOutItem({
    super.key,
    required this.item,
  });

  final CartModel item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding:
          const EdgeInsets.symmetric(vertical: 8),
      leading: Image.network(
          item.image.imageProductFormate(),
          width: 50,
          height: 50,
          fit: BoxFit.cover),
      title: TextApp(
        text: item.title,
        theme: context.textStyle.copyWith(
          fontSize: 16.sp,
          fontWeight: FontWeightHelper.bold,
        ),
      ),
      subtitle: TextApp(
        text: '\$${item.price}',
        theme: context.textStyle.copyWith(
          fontSize: 14.sp,
          fontWeight: FontWeightHelper.bold,
        ),
      ),
    );
  }
}