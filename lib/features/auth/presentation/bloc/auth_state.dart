import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class Initial extends AuthState {
  const Initial();

  @override
  List<Object?> get props => [];
}

class LoadingState extends AuthState {
  const LoadingState();

  @override
  List<Object?> get props => [];
}

class SuccessState extends AuthState {
  const SuccessState();

  @override
  List<Object?> get props => [];
}

class ErrorState extends AuthState {
  final String error;

  const ErrorState({required this.error});

  @override
  List<Object?> get props => [error];

  ErrorState copyWith({String? error}) {
    return ErrorState(
      error: error ?? this.error,
    );
  }
}
