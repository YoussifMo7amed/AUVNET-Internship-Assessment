import 'package:auvnet_store/core/common/animations/animate_do.dart';
import 'package:auvnet_store/core/common/widgets/custom_text_field.dart';
import 'package:auvnet_store/core/extensions/context_extension.dart';
import 'package:auvnet_store/core/utils/app_regex.dart';
import 'package:auvnet_store/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// A form widget that contains the email and password fields for the login process.
// A form widget that contains the email and password fields for the login process.
class LoginTextForm extends StatefulWidget {
  const LoginTextForm({super.key});

  @override
  State<LoginTextForm> createState() => _LoginTextFormState();
}

class _LoginTextFormState extends State<LoginTextForm> {
  // A flag to toggle the visibility of the password field
  bool isShowPassword = true;
  
  // Reference to the AuthBloc instance
  late AuthBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = context.read<AuthBloc>();
  }

  @override
  void dispose() {
    // Dispose controllers to free up resources
    _bloc.emailController.dispose();
    _bloc.passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      // Assign the form key for validation
      key: _bloc.formKey,
      child: Column(
        children: [
          // Email input field with validation
          CustomFadeInRight(
            duration: 200,
            child: CustomTextField(
              controller: _bloc.emailController,
              hintText: 'Your Email',
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                 if (!AppRegex.isEmailValid(_bloc.emailController.text)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
            ),
          ),
          SizedBox(height: 25.h),

          // Password input field with validation and toggle for visibility
          CustomFadeInRight(
            duration: 200,
            child: CustomTextField(
              controller: _bloc.passwordController,
              hintText: 'password',
              keyboardType: TextInputType.visiblePassword,
              obscureText: isShowPassword,
              validator: (value) {
                if (value == null || value.isEmpty || value.length < 6) {
                  return 'Please enter a valid password, not less than 6 characters';
                }
                return null;
              },
              suffixIcon: IconButton(
                onPressed: () {
                  // Toggle password visibility
                  setState(() {
                    isShowPassword = !isShowPassword;
                  });
                },
                icon: Icon(
                  isShowPassword ? Icons.visibility_off : Icons.visibility,
                  color: context.color.textColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
