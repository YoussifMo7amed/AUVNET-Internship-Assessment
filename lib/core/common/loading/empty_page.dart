import 'package:auvnet_store/core/common/widgets/text_app.dart';
import 'package:auvnet_store/core/extensions/context_extension.dart';
import 'package:auvnet_store/core/styles/fonts/font_wieght_helper.dart';
import 'package:auvnet_store/core/styles/images/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class EmptyPage extends StatelessWidget {
  const EmptyPage({super.key, this.text});
  final String? text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Opacity(
        opacity: 0.6,
        child: Column(
          children: [
            Image.asset(AppImages.emptyScreen),
            TextApp(
              text: text ?? 'There is no Items in this category yet',
              theme: context.textStyle.copyWith(
                color: Colors.black,
                fontWeight: FontWeightHelper.bold,
                fontSize: 20.sp,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
