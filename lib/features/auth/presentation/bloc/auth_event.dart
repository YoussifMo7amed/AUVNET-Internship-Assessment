import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class Started extends AuthEvent {
  const Started();
}

class LoginEvent extends AuthEvent {
  const LoginEvent();
}

class SignUpEvent extends AuthEvent {
  const SignUpEvent();
}

