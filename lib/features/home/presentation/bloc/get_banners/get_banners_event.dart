
import 'package:equatable/equatable.dart';

abstract class GetBannersEvent extends Equatable {
  const GetBannersEvent();

  @override
  List<Object?> get props => [];
}

class Started extends GetBannersEvent {}

class FetchBannersEvent extends GetBannersEvent {}