import 'dart:async';
import 'package:auvnet_store/core/service/shared_pref/pref_keys.dart';
import 'package:auvnet_store/core/service/shared_pref/shared_pref.dart';
import 'package:auvnet_store/features/auth/data/models/login_request_body.dart';
import 'package:auvnet_store/features/auth/data/models/sign_up_request_body.dart';
import 'package:auvnet_store/features/auth/data/repos/auth_repo.dart';
import 'package:auvnet_store/features/auth/presentation/bloc/auth_event.dart';
import 'package:auvnet_store/features/auth/presentation/bloc/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this._repo) : super(const Initial()) {
    on<LoginEvent>(_login);
    on<SignUpEvent>(_signUp);
  }

  final AuthRepos _repo;

  // Text controllers for form fields
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  // Key for form validation
  final formKey = GlobalKey<FormState>();

  // Handle login event
  FutureOr<void> _login(LoginEvent event, Emitter<AuthState> emit) async {
    emit(const AuthLoadingState()); // Emit loading state

    final result = await _repo.login(
      LoginRequestBody(
        email: emailController.text.trim(),
        password: passwordController.text,
      ),
    );

    await result.when(
      success: (loginData) async {
        final token = loginData.accessToken; // Save user token
        await SharedPref().setString(
            PrefKeys.accessToken, token); // Save token to Shared Preferences
        emit(const AuthSuccessState()); // Emit success state
      },
      failure: (error) {
        emit(AuthErrorState(error: error)); // Emit error state with message
      },
    );
  }

  // Handle sign-up event
  FutureOr<void> _signUp(SignUpEvent event, Emitter<AuthState> emit) async {
    emit(const AuthLoadingState()); // Emit loading state
    final result = await _repo.signUp(
      SignupRequestBody(
        email: emailController.text.trim(),
        password: passwordController.text,
        avatar:
            'https://api.lorem.space/image/face?w=150&h=220', // Default avatar
        name: nameController.text.trim(),
      ),
    );

    result.when(
      success: (signupData) {
        add(const LoginEvent()); // Trigger login after successful sign-up
      },
      failure: (error) {
        emit(AuthErrorState(error: error)); // Emit error state with message
      },
    );
  }
}
