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

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  // Login
  Future<void> _login(LoginEvent event, Emitter<AuthState> emit) async {
    emit(const LoadingState());

    final result = await _repo.login(
      LoginRequestBody(
        email: emailController.text.trim(),
        password: passwordController.text,
      ),
    );

    await result.when(
      success: (loginData) async {
        // user token
        final token = loginData.accessToken;
        // save token in shared preferences
        await SharedPref().setString(PrefKeys.accessToken, token);
        if (emit.isDone) return;
        emit(const SuccessState());
      },
      failure: (error) {
        if (emit.isDone) return;
        emit(ErrorState(error: error));
      },
    );
  }

  // Signup and login to take user token
  Future<void> _signUp(SignUpEvent event, Emitter<AuthState> emit) async {
    emit(const LoadingState());
    final result = await _repo.signUp(
      SignupRequestBody(
        email: emailController.text.trim(),
        password: passwordController.text,
        avatar:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTcGJegujCz3neLg3btfiVRfmV4dg52BBd38g&s",
        name: nameController.text.trim(),
      ),
    );

    await result.when(
      success: (signupData) async {
        // Trigger the login event after successful signup
        add(const LoginEvent());
      },
      failure: (error) {
        if (emit.isDone) return;
        emit(ErrorState(error: error));
      },
    );
  }
}
