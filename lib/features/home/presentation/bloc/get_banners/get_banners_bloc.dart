import 'dart:async';
import 'package:auvnet_store/core/utils/app_strings.dart';
import 'package:auvnet_store/features/home/data/repo/home_repo.dart';
import 'package:auvnet_store/features/home/presentation/bloc/get_banners/get_banners_event.dart';
import 'package:auvnet_store/features/home/presentation/bloc/get_banners/get_banners_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetBannersBloc extends Bloc<GetBannersEvent, GetBannersState> {
  GetBannersBloc(this._repo) : super(LoadingState()) {
    on<FetchBannersEvent>(_getBanners);
  }

  final HomeRepo _repo;
  // Get Banners
  FutureOr<void> _getBanners(
    FetchBannersEvent event,
    Emitter<GetBannersState> emit,
  ) async {
    emit(LoadingState());

    final result = await _repo.getProducts();

    result.when(
      success: (data) {
        final filteredBanners = data
            .where((banner) => banner.title == searchBannersKeyWord)
            .toList();

        if (filteredBanners.isEmpty) {
          emit(EmptyState());
        } else {
          // Assuming you want images from the first banner matching the title
          final images = filteredBanners.first.images;
          emit(SuccessState(imageBannerList: images));
        }
      },
      failure: (error) {
        emit(ErrorState(error: error));
      },
    );
  }
}
