import 'package:equatable/equatable.dart';

abstract class GetBannersState extends Equatable {
  const GetBannersState();

  @override
  List<Object?> get props => [];
}

class LoadingState extends GetBannersState {}

class SuccessState extends GetBannersState {
  final List<String> imageBannerList;
  

  const SuccessState({required this.imageBannerList});

  @override
  List<Object?> get props => [imageBannerList];

  SuccessState copyWith({
    List<String>? imageBannerList,
  }) {
    return SuccessState(
      imageBannerList: imageBannerList ?? this.imageBannerList,
    );
  }
}

class EmptyState extends GetBannersState {}

class ErrorState extends GetBannersState {
  final String error;

  const ErrorState({required this.error});

  @override
  List<Object?> get props => [error];

  ErrorState copyWith({
    String? error,
  }) {
    return ErrorState(
      error: error ?? this.error,
    );
  }
}
