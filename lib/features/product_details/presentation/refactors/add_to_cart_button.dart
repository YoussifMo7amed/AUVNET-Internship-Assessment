import 'package:auvnet_store/core/common/animations/animate_do.dart';
import 'package:auvnet_store/core/common/widgets/custom_linear_button.dart';
import 'package:auvnet_store/core/common/widgets/text_app.dart';
import 'package:auvnet_store/core/extensions/context_extension.dart';
import 'package:auvnet_store/core/styles/fonts/font_wieght_helper.dart';
import 'package:auvnet_store/core/toast/show_toast.dart';
import 'package:auvnet_store/features/cart/presentation/cubit/add_to_cart/cart_cubit.dart';
import 'package:auvnet_store/features/product_details/data/models/product_response.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({required this.price, super.key, required this.productDetailsResponse});
  final ProductDetailsResponse productDetailsResponse;
  final double price;

  @override
  Widget build(BuildContext context) {
    return CustomFadeInUp(
      duration: 500,
      child: Container(
        height: 90.h,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: context.color.containerShadow1,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextApp(
                text: '\$ $price',
                theme: context.textStyle.copyWith(
                  fontSize: 22.sp,
                  fontWeight: FontWeightHelper.medium,
                  color: context.color.bluePinkLight,
                ),
              ),
              BlocBuilder<CartCubit, CartState>(
                builder: (context, state) {
                  return CustomLinearButton(
                    onPressed: () async{
                      await context.read<CartCubit>().manageCart(
                              productId: productDetailsResponse.id.toString(),
                              title: productDetailsResponse.title ,
                              image: productDetailsResponse.images.first ,
                              price: productDetailsResponse.price.toString(),
                              categoryName: productDetailsResponse.category.name ,
                            ) .then((value) {
                          ShowToast.showToastSuccessTop(
                              message: 'Added To Cart');
                        });
                    },
                    height: 40.h,
                    width: 140.w,
                    child: TextApp(
                      text: 'Add to cart',
                      theme: context.textStyle.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeightHelper.bold,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
