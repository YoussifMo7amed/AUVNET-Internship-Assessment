import 'dart:async';
import 'package:auvnet_store/features/product_details/data/repo/product_details_repo.dart';
import 'package:auvnet_store/features/product_details/presentation/bloc/product_details/product_details_event.dart';
import 'package:auvnet_store/features/product_details/presentation/bloc/product_details/product_details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsBloc
    extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  ProductDetailsBloc(this._repo) : super(ProductDetailsLoadingState()) {
    on<GetProductDetailsEvent>(_productDetails);
  }
  final ProductDetailsRepo _repo;

  FutureOr<void> _productDetails(
    GetProductDetailsEvent event,
    Emitter<ProductDetailsState> emit,
  ) async {
    emit(ProductDetailsLoadingState());

    final result = await _repo.productDetails(id: event.productId);

    result.when(
      success: (data) {
        emit(
          ProductDetailsSuccessState(productDetailsResponse: data),
        );
      },
      failure: (error) {
        emit(ProductDetailsErrorState(error: error));
      },
    );
  }
}
