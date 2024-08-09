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
// A button widget that handles the sign-up process using BLoC and displays the appropriate UI based on the current state.
class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        // Listen to state changes and display a success toast when the sign-up is successful
        if (state is AuthSuccessState) {
          ShowToast.showToastSuccessTop(
            message: 'Sign Up Success',
          );

          // Navigate to the main screen after successful sign-up
          context.pushNamedAndRemoveUntil(Routes.mainScreen);
        } 
        // Display an error toast if there is a sign-up error
        else if (state is AuthErrorState) {
          ShowToast.showToastErrorTop(
            message: errorMessage,
          );
        }
      },
      builder: (context, state) {
        // Display a loading indicator while the sign-up request is being processed
        if (state is AuthLoadingState) {
          return CustomLinearButton(
            onPressed: () {}, // Disable the button while loading
            height: 50.h,
            width: MediaQuery.of(context).size.width,
            child: const CircularProgressIndicator(
              color: Colors.white,
            ),
          );
        } 
        // Display the sign-up button when not loading
        else {
          return CustomFadeInRight(
            duration: 600,
            child: CustomLinearButton(
              onPressed: () {
                _validateThenDoSignUp(context); // Trigger sign-up process
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

  // Validate the form and trigger the sign-up event if valid
  void _validateThenDoSignUp(BuildContext context) {
    final authBloc = context.read<AuthBloc>();

    if (authBloc.formKey.currentState!.validate()) {
      context.read<AuthBloc>().add(
        const SignUpEvent(),
      );
    }
  }
}
