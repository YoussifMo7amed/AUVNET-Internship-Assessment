part of 'app_cubit.dart';

// Define the different states of the app's theme mode
@freezed
class AppState with _$AppState {
  // Initial state of the app
  const factory AppState.initial() = _Initial;

  // State when the theme mode changes
  const factory AppState.themeChangeMode({required bool isDark}) =
      ThemeChangeModeState;
}
