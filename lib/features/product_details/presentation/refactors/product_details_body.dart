import 'package:auvnet_store/core/common/widgets/custom_add_to_cart_button.dart';
import 'package:auvnet_store/core/common/widgets/text_app.dart';
import 'package:auvnet_store/core/extensions/context_extension.dart';
import 'package:auvnet_store/core/styles/fonts/font_wieght_helper.dart';
import 'package:auvnet_store/features/product_details/data/models/product_response.dart';
import 'package:auvnet_store/features/product_details/presentation/widgets/product_details_image_slider.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsBody extends StatelessWidget {
  const ProductDetailsBody({required this.productDetailsResponse, super.key});

  final ProductDetailsResponse productDetailsResponse;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // share and favorite button
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //Favorite Button
                CustomAddToCartButton(size: 35),
              ],
            ),
            SizedBox(height: 10.h),
            //Image
            ProductDetailsImageSlider(
              imageList: productDetailsResponse.images,
            ),

            SizedBox(height: 30.h),
            //Title
            TextApp(
              text: productDetailsResponse.title ?? '',
              theme: context.textStyle.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeightHelper.bold,
              ),
            ),
            SizedBox(height: 15.h),
            //description
            TextApp(
              text: productDetailsResponse.description ?? '',
              theme: context.textStyle.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeightHelper.regular,
                color: context.color.textColor,
                height: 1.5,
              ),
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}
