import 'package:equatable/equatable.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object?> get props => [];
}

class Started extends ProfileEvent {
  const Started();

  @override
  List<Object?> get props => [];
}

class GetUserInfoEvent extends ProfileEvent {
  const GetUserInfoEvent();

  @override
  List<Object?> get props => [];
}