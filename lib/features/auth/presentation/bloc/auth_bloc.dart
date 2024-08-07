import 'dart:async';

import 'package:auvnet_store/core/service/shared_pref/pref_keys.dart';
import 'package:auvnet_store/core/service/shared_pref/shared_pref.dart';
import 'package:auvnet_store/features/auth/data/models/login_request_body.dart';
import 'package:auvnet_store/features/auth/data/repos/auth_repo.dart';
import 'package:auvnet_store/features/auth/presentation/bloc/auth_event.dart';
import 'package:auvnet_store/features/auth/presentation/bloc/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this._repo) : super(const Initial()) {
    on<LoginEvent>(_login);
  }

  final AuthRepos _repo;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

//Login
  FutureOr<void> _login(LoginEvent event, Emitter<AuthState> emit) async {
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
        final token = loginData.data.login.accessToken ?? '';
        // save token in shared preferences
        await SharedPref().setString(PrefKeys.accessToken, token);
        emit(const SuccessState());
      },
      failure: (error) {
        emit(ErrorState(error: error));
      },
    );
  }
}