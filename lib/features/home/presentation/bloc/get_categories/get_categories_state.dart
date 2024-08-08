import 'package:auvnet_store/features/home/data/models/categories_response.dart';
import 'package:equatable/equatable.dart';

abstract class GetCategoriesState extends Equatable {
  const GetCategoriesState();

  @override
  List<Object?> get props => [];
}

class CategoriesLoadingState extends GetCategoriesState {}

class CategoriesSuccessState extends GetCategoriesState {
  final List<CategoryResponse> response; // Update to a list of category names

  const CategoriesSuccessState({required this.response});

  @override
  List<Object?> get props => [response];

  CategoriesSuccessState copyWith({
   List<CategoryResponse>? response,
  }) {
    return CategoriesSuccessState(
      response: response ?? this.response,
    );
  }
}

class CategoriesEmptyState extends GetCategoriesState {}

class CategoriesErrorState extends GetCategoriesState {
  final String error;

  const CategoriesErrorState({required this.error});

  @override
  List<Object?> get props => [error];

  CategoriesErrorState copyWith({
    String? error,
  }) {
    return CategoriesErrorState(
      error: error ?? this.error,
    );
  }
}
