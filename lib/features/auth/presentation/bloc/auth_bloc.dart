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
        final token = loginData.accessToken ;
        // save token in shared preferences
        await SharedPref().setString(PrefKeys.accessToken, token);
        // get user role
      
        emit( const SuccessState( ));
      },
      failure: (error) {
        emit(ErrorState(error: error));
      },
    );
  }

  // signup and login to take user token
  FutureOr<void> _signUp(
    SignUpEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const LoadingState());
    final result = await _repo.signUp(
      SignupRequestBody(
        email: emailController.text.trim(),
        password: passwordController.text,
        avatar: 'https://api.lorem.space/image/face?w=150&h=220',
        name: nameController.text.trim(),
      ),
    );

    result.when(
      success: (signupData) {
        add(const LoginEvent());
      },
      failure: (error) {
        emit(ErrorState(error: error));
      },
    );
  }
}