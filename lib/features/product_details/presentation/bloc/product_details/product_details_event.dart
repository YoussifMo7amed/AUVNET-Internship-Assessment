import 'package:equatable/equatable.dart';

abstract class ProductDetailsEvent extends Equatable {
  const ProductDetailsEvent();

  @override
  List<Object?> get props => [];
}

class Started extends ProductDetailsEvent {}

class GetProductDetailsEvent extends ProductDetailsEvent {
  final int productId;

  const GetProductDetailsEvent({required this.productId});

  @override
  List<Object?> get props => [productId];
}