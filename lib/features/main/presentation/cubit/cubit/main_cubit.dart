import 'package:auvnet_store/core/enums/nav_bar_enum.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_state.dart';
part 'main_cubit.freezed.dart';

// Cubit to manage the state of the main screen, including the selected navigation bar icon.
class MainCubit extends Cubit<MainState> {
  MainCubit() : super(const MainState.initial());

  // Current selected navigation bar icon.
  NavBarEnum navBarEnum = NavBarEnum.home;

  // Method to handle the selection of navigation bar icons.
  void selectedNavBarIcons(NavBarEnum viewEnum) {
    // Update the current selected icon based on the viewEnum.
    if (viewEnum == NavBarEnum.home) {
      navBarEnum = NavBarEnum.home;
    } else if (viewEnum == NavBarEnum.cart) {
      navBarEnum = NavBarEnum.cart;
    } else if (viewEnum == NavBarEnum.profile) {
      navBarEnum = NavBarEnum.profile;
    }
    // Emit a new state with the updated selected icon.
    emit(MainState.barSeletedIcons(navBarEnum: navBarEnum));
  }
}
