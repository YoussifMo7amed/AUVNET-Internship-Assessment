import 'package:auvnet_store/features/product_details/data/models/product_response.dart';
import 'package:equatable/equatable.dart';

abstract class ProductDetailsState extends Equatable {
  const ProductDetailsState();

  @override
  List<Object?> get props => [];
}

class ProductDetailsLoadingState extends ProductDetailsState {}

class ProductDetailsSuccessState extends ProductDetailsState {
  final ProductDetailsResponse productDetailsResponse;

  const ProductDetailsSuccessState({required this.productDetailsResponse});

  ProductDetailsSuccessState copyWith({ProductDetailsResponse? productDetailsResponse}) {
    return ProductDetailsSuccessState(
      productDetailsResponse: productDetailsResponse ?? this.productDetailsResponse,
    );
  }

  @override
  List<Object?> get props => [productDetailsResponse];
}

class ProductDetailsErrorState extends ProductDetailsState {
  final String error;

  const ProductDetailsErrorState({required this.error});

  ProductDetailsErrorState copyWith({String? error}) {
    return ProductDetailsErrorState(
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [error];
}