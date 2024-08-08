import 'dart:async';
import 'package:auvnet_store/features/home/data/repo/home_repo.dart';
import 'package:auvnet_store/features/home/presentation/bloc/get_categories/get_categories_event.dart';
import 'package:auvnet_store/features/home/presentation/bloc/get_categories/get_categories_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetCategoriesBloc extends Bloc<GetCategoriesEvent, GetCategoriesState> {
  GetCategoriesBloc(this._repo) : super(CategoriesLoadingState()) {
    on<FetchCategoriesEvent>(_getAllCategories);
  }
  final HomeRepo _repo;
  FutureOr<void> _getAllCategories(
    FetchCategoriesEvent event,
    Emitter<GetCategoriesState> emit,
  ) async {
    emit(CategoriesLoadingState());

    final result = await _repo.getAllCategories();

    result.when(
      success: (response) {
        
        if (response.isEmpty) {
          emit(CategoriesEmptyState());
        } else {
          emit(
            CategoriesSuccessState(
                response: response ),
          );
        }
      },
      failure: (error) {
        emit(CategoriesErrorState(error: error));
      },
    );
  }
}
