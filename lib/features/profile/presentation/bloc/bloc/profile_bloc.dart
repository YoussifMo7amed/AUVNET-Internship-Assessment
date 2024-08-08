import 'dart:async';
import 'package:auvnet_store/core/service/shared_pref/pref_keys.dart';
import 'package:auvnet_store/core/service/shared_pref/shared_pref.dart';
import 'package:auvnet_store/features/profile/data/repo/profile_repo.dart';
import 'package:auvnet_store/features/profile/presentation/bloc/bloc/profile_event.dart';
import 'package:auvnet_store/features/profile/presentation/bloc/bloc/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc(this._repo) : super(const LoadingState()) {
    on<GetUserInfoEvent>(_getUserInfo);
  }
  final ProfileRepo _repo;

  FutureOr<void> _getUserInfo(
    GetUserInfoEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(const LoadingState());
    final token =  SharedPref().getString(PrefKeys.accessToken);
    final result = await _repo.getUserProfile(token!);

    result.when(
      success: (response) {
        emit(SuccessState(response: response));
      },
      failure: (error) {
        emit(ErrorState(error: error));
      },
    );
  }
}
