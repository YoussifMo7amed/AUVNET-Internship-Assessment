import 'package:auvnet_store/core/common/widgets/text_app.dart';
import 'package:auvnet_store/core/extensions/context_extension.dart';
import 'package:auvnet_store/core/styles/fonts/font_wieght_helper.dart';
import 'package:auvnet_store/core/styles/images/app_images.dart';
import 'package:auvnet_store/core/utils/app_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class OrderHistory extends StatelessWidget {
  const OrderHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          AppImages.orderHistory,
          color: context.color.textColor,
          height: 25.h,
        ),
        SizedBox(width: 10.w),
        TextApp(
          text: 'Order History',
          theme: context.textStyle.copyWith(
            fontSize: 18.sp,
            fontWeight: FontWeightHelper.regular,
          ),
        ),
        const Spacer(),
        //Build Version
        IconButton(
          onPressed: () {
            
          },
          icon: Icon(
            Icons.arrow_forward_ios,
            color: context.color.textColor,
            size: 30.h,
          ),
        )
      ],
    );
  }
}
