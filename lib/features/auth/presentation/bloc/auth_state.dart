import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class Initial extends AuthState {
  const Initial();
}

class AuthLoadingState extends AuthState {
  const AuthLoadingState();
}

class AuthSuccessState extends AuthState {
  const AuthSuccessState();
}

class AuthErrorState extends AuthState {
  final String error;

  const AuthErrorState({required this.error});

  @override
  List<Object?> get props => [error];

  AuthErrorState copyWith({String? error}) {
    return AuthErrorState(
      error: error ?? this.error,
    );
  }
}
