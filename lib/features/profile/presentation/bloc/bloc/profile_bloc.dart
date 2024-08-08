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

  Future<void> _getUserInfo(
    GetUserInfoEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(const LoadingState());
    final token = SharedPref().getString(PrefKeys.accessToken);
    if (token == null) {
      emit(const ErrorState(error: 'Token is null'));
      return;
    }
    final result = await _repo.getUserProfile(token);

    await result.when(
      success: (response) async {
        await SharedPref().setInt(PrefKeys.userId, response.userId ?? 0);
        if (emit.isDone) return;
        emit(SuccessState(response: response));
      },
      failure: (error) {
        if (emit.isDone) return;
        emit(ErrorState(error: error));
      },
    );
  }
}
