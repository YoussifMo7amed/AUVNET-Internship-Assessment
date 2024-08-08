import 'package:equatable/equatable.dart';

abstract class GetCategoriesEvent extends Equatable {
  const GetCategoriesEvent();

  @override
  List<Object?> get props => [];
}

class Started extends GetCategoriesEvent {}

class FetchCategoriesEvent extends GetCategoriesEvent {}
