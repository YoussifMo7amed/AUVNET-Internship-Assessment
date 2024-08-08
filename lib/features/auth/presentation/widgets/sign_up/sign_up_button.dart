import 'package:auvnet_store/core/common/animations/animate_do.dart';
import 'package:auvnet_store/core/common/widgets/custom_linear_button.dart';
import 'package:auvnet_store/core/common/widgets/text_app.dart';
import 'package:auvnet_store/core/extensions/context_extension.dart';
import 'package:auvnet_store/core/routes/routers.dart';
import 'package:auvnet_store/core/styles/fonts/font_wieght_helper.dart';
import 'package:auvnet_store/core/toast/show_toast.dart';
import 'package:auvnet_store/core/utils/app_strings.dart';
import 'package:auvnet_store/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:auvnet_store/features/auth/presentation/bloc/auth_event.dart';
import 'package:auvnet_store/features/auth/presentation/bloc/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is SuccessState) {
          ShowToast.showToastSuccessTop(
            message: 'Sign Up Success',
          );

          context.pushNamedAndRemoveUntil(Routes.mainScreen);
        } else if (state is ErrorState) {
          ShowToast.showToastErrorTop(
            message: errorMessage,
          );
        }
      },
      builder: (context, state) {
        if (state is LoadingState) {
          return CustomLinearButton(
            onPressed: () {},
            height: 50.h,
            width: MediaQuery.of(context).size.width,
            child: const CircularProgressIndicator(
              color: Colors.white,
            ),
          );
        } else {
          return CustomFadeInRight(
            duration: 600,
            child: CustomLinearButton(
              onPressed: () {
                _validateThenDoSignUp(context);
              },
              height: 50.h,
              width: MediaQuery.of(context).size.width,
              child: TextApp(
                text: 'Sign Up',
                theme: context.textStyle.copyWith(
                  fontSize: 18.sp,
                  fontWeight: FontWeightHelper.bold,
                ),
              ),
            ),
          );
        }
      },
    );
  }

  void _validateThenDoSignUp(BuildContext context) {
    final authBloc = context.read<AuthBloc>();

    if (authBloc.formKey.currentState!.validate()) {
      context.read<AuthBloc>().add(
            const SignUpEvent(),
          );
    }
  }
}
