import 'package:auvnet_store/features/home/data/models/products_response.dart';
import 'package:equatable/equatable.dart';

// Define the state classes
abstract class GetProductsState extends Equatable {
  @override
  List<Object> get props => [];
}

class ProductsLoadingState extends GetProductsState {}

class ProductsSuccessState extends GetProductsState {
  final List<ProductResponse> productsList;

  ProductsSuccessState({required this.productsList});

  @override
  List<Object> get props => [productsList];

  ProductsSuccessState copyWith({List<ProductResponse>? productsList}) {
    return ProductsSuccessState(
      productsList: productsList ?? this.productsList,
    );
  }
}

class ProductsEmptyState extends GetProductsState {}

class ProductsErrorState extends GetProductsState {
  final String error;

  ProductsErrorState({required this.error});

  @override
  List<Object> get props => [error];

  ProductsErrorState copyWith({String? error}) {
    return ProductsErrorState(
      error: error ?? this.error,
    );
  }
}
