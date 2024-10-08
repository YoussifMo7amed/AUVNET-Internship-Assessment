import 'package:auvnet_store/core/common/animations/animate_do.dart';
import 'package:auvnet_store/core/common/widgets/text_app.dart';
import 'package:auvnet_store/core/extensions/context_extension.dart';
import 'package:auvnet_store/core/routes/routers.dart';
import 'package:auvnet_store/core/styles/fonts/font_wieght_helper.dart';
import 'package:auvnet_store/features/auth/presentation/widgets/auth_title_info.dart';
import 'package:auvnet_store/features/auth/presentation/widgets/dark_mode_button.dart';
import 'package:auvnet_store/features/auth/presentation/widgets/sign_up/sign_up_button.dart';
import 'package:auvnet_store/features/auth/presentation/widgets/sign_up/sign_up_text_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: SingleChildScrollView(
        child: Column(
          children: [
            //Dark mode and language
            const DarkModeButton(),

            SizedBox(height: 20.h),

            // Welcome Info
            const AuthTitleInfo(
              title: 'Sign Up',
              description: 'Welcome, Please add your information',
            ),
            SizedBox(height: 30.h),

            // signup TextForm
            const SignUpTextForm(),

            SizedBox(height: 20.h),
            //signUpButton
            const SignUpButton(),

            SizedBox(height: 20.h),

            // Go To Login Screen
            CustomFadeInDown(
              duration: 400,
              child: TextButton(
                onPressed: () {
                  context.pushReplacementNamed(Routes.login);
                },
                child: TextApp(
                  text: 'You have an account?',
                  theme: context.textStyle.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeightHelper.bold,
                    color: context.color.bluePinkLight,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
