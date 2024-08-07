import 'package:flutter/material.dart';

/// Custom ThemeExtension to handle app-specific assets for theming
class MyAssets extends ThemeExtension<MyAssets> {
  const MyAssets({
    required this.bigNavBar,
    required this.homeBg,
  });

  /// Path to the image for the big navigation bar
  final String? bigNavBar;

  /// Path to the image for the home background
  final String? homeBg;

  @override
  ThemeExtension<MyAssets> copyWith({
    String? bigNavBar,
    String? homeBg,
  }) {
    return MyAssets(
      bigNavBar: bigNavBar,
      homeBg: homeBg,
    );
  }

  @override
  ThemeExtension<MyAssets> lerp(
    covariant ThemeExtension<MyAssets>? other,
    double t,
  ) {
    if (other is! MyAssets) {
      return this;
    }
    return MyAssets(
      bigNavBar: bigNavBar,
      homeBg: homeBg,
    );
  }

  // Predefined assets for dark theme
  static const MyAssets dark = MyAssets(
    bigNavBar: "AppImages.bigIconNavBarDark",
    homeBg: "AppImages.homeBgDark",
  );

  // Predefined assets for light theme
  static const MyAssets light = MyAssets(
    bigNavBar: "AppImages.bigIconNavBarLight",
    homeBg: "AppImages.homeBgLight",
  );
}
