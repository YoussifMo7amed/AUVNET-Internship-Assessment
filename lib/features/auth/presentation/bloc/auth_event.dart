import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class Started extends AuthEvent {
  const Started();

  @override
  List<Object?> get props => [];
}

class LoginEvent extends AuthEvent {
  const LoginEvent();

  @override
  List<Object?> get props => [];
}

class SignUpEvent extends AuthEvent {
  const SignUpEvent();

  @override
  List<Object?> get props => [];
}
