import 'package:auvnet_store/core/common/widgets/custom_linear_button.dart';
import 'package:auvnet_store/core/common/widgets/text_app.dart';
import 'package:auvnet_store/core/extensions/context_extension.dart';
import 'package:auvnet_store/core/styles/fonts/font_wieght_helper.dart';
import 'package:auvnet_store/core/styles/images/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

// Custom AppBar widget
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    required this.title,
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: context.color.mainColor,
      elevation: 0,
      centerTitle: true,
      surfaceTintColor: Colors.transparent,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomLinearButton(
            onPressed: () {
              context.pop(); // Navigate back on press
            },
            child: Center(
              child: SvgPicture.asset(AppImages.backButton), // Back button icon
            ),
          ),
          Flexible(
            child: TextApp(
              text: title,
              theme: context.textStyle.copyWith(
                fontSize: 20.sp,
                fontWeight: FontWeightHelper.bold,
                color: context.color.textColor,
              ),
            ),
          ),
          const Text(''), // Placeholder to maintain alignment
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 70.h); // AppBar height
}
