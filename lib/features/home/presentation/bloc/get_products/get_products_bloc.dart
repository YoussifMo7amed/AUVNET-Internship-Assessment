import 'dart:async';
import 'package:auvnet_store/features/home/data/repo/home_repo.dart';
import 'package:auvnet_store/features/home/presentation/bloc/get_products/get_products_event.dart';
import 'package:auvnet_store/features/home/presentation/bloc/get_products/get_products_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetProductsBloc extends Bloc<GetProductsEvent, GetProductsState> {
  GetProductsBloc(this._repo) : super(ProductsLoadingState()) {
    on<FetchProductsEvent>(_getProducts);
  }
  final HomeRepo _repo;

  // Get Products

  FutureOr<void> _getProducts(
    FetchProductsEvent event,
    Emitter<GetProductsState> emit,
  ) async {
    emit(ProductsLoadingState());

    final result = await _repo.getProducts();

    result.when(
      success: (data) {
        if (data.isEmpty) {
          emit(ProductsEmptyState());
        } else {
          emit(
            ProductsSuccessState(productsList: data),
          );
        }
      },
      failure: (error) {
        emit(ProductsErrorState(error: error));
      },
    );
  }
}
