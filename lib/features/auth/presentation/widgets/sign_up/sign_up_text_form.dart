import 'package:auvnet_store/core/common/animations/animate_do.dart';
import 'package:auvnet_store/core/common/widgets/custom_text_field.dart';
import 'package:auvnet_store/core/extensions/context_extension.dart';
import 'package:auvnet_store/core/utils/app_regex.dart';
import 'package:auvnet_store/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpTextForm extends StatefulWidget {
  const SignUpTextForm({super.key});

  @override
  State<SignUpTextForm> createState() => _SignUpTextFormState();
}

class _SignUpTextFormState extends State<SignUpTextForm> {
  bool isShowPassword = true;
  late AuthBloc _bloc;
  @override
  void initState() {
    super.initState();

    _bloc = context.read<AuthBloc>();
  }

  @override
  void dispose() {
    _bloc.nameController.dispose();
    _bloc.emailController.dispose();
    _bloc.passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _bloc.formKey,
      child: Column(
        children: [
          //Name
          CustomFadeInRight(
            duration: 200,
            child: CustomTextField(
                  controller: _bloc.nameController,
              hintText: 'Full Name',
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty || value.length < 4) {
                  return 'Please enter your full name';
                }
                return null;
              },
            ),
          ),
          SizedBox(height: 25.h),
          //Email
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
          //Password
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
