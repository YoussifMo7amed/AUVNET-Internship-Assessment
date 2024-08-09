import 'package:auvnet_store/features/profile/data/models/profile_responce.dart';
import 'package:equatable/equatable.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object?> get props => [];
}

class LoadingState extends ProfileState {
  const LoadingState();

  @override
  List<Object?> get props => [];
}

class SuccessState extends ProfileState {
  final ProfileResponse response;

  const SuccessState({required this.response});

  @override
  List<Object?> get props => [response];

  SuccessState copyWith({ProfileResponse? response}) {
    return SuccessState(
      response: response ?? this.response,
    );
  }
}

class ErrorState extends ProfileState {
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