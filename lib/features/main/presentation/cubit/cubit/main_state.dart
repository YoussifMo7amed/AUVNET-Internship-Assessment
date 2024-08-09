part of 'main_cubit.dart';

// Freezed state class to handle different states of the main screen.
@freezed
class MainState with _$MainState {
  // Initial state when the cubit is first created.
  const factory MainState.initial() = _Initial;

  // State when a navigation bar icon is selected.
  const factory MainState.barSeletedIcons({required NavBarEnum navBarEnum}) = NavBarSeletedIconsState;
}
