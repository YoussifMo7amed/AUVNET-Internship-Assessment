import 'package:auvnet_store/core/styles/colors/colors_dark.dart';
import 'package:auvnet_store/core/styles/colors/colors_light.dart';
import 'package:auvnet_store/core/theme/assets_extension.dart';
import 'package:auvnet_store/core/theme/color_extension.dart';
import 'package:flutter/material.dart';

/// Defines the dark theme for the application
ThemeData themeDark() {
  return ThemeData(
    scaffoldBackgroundColor: ColorsDark.mainColor,
    extensions: const <ThemeExtension<dynamic>>[
      MyColors.dark,
      MyAssets.dark,
    ],
    useMaterial3: true,
    textTheme: const TextTheme(
      displaySmall: TextStyle(
        fontSize: 14,
        color: ColorsDark.white,
      ),
    ),
  );
}

/// Defines the light theme for the application
ThemeData themeLight() {
  return ThemeData(
    scaffoldBackgroundColor: ColorsLight.mainColor,
    extensions: const <ThemeExtension<dynamic>>[
      MyColors.light,
      MyAssets.light,
    ],
    useMaterial3: true,
  );
}
