import 'package:auvnet_store/core/common/animations/animate_do.dart';
import 'package:auvnet_store/core/common/widgets/text_app.dart';
import 'package:auvnet_store/core/extensions/context_extension.dart';
import 'package:auvnet_store/core/routes/routers.dart';
import 'package:auvnet_store/core/styles/fonts/font_wieght_helper.dart';
import 'package:auvnet_store/features/auth/presentation/widgets/auth_title_info.dart';
import 'package:auvnet_store/features/auth/presentation/widgets/dark_mode_button.dart';
import 'package:auvnet_store/features/auth/presentation/widgets/login/login_button.dart';
import 'package:auvnet_store/features/auth/presentation/widgets/login/login_text_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: SingleChildScrollView(
        child: Column(
          children: [
            //Dark mode
            const DarkModeButton(),

            SizedBox(height: 50.h),

            // Welcome Info
            const AuthTitleInfo(
              title: 'Login',
              description: 'Welcome, Please enter your email and get started.',
            ),

            SizedBox(height: 30.h),

            // login TextForm
            const LoginTextForm(),

            SizedBox(height: 30.h),
            //LoginButton
            const LoginButton(),

            SizedBox(height: 30.h),

            // Go To Sign Up Screen

            // Go To Sign Up Screen
            CustomFadeInDown(
              duration: 400,
              child: TextButton(
                onPressed: () {
                  context.pushReplacementNamed(Routes.signUp);
                },
                child: TextApp(
                  text: 'create account',
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
