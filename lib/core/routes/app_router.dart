import 'package:auvnet_store/core/common/screens/under_build_screen.dart';
import 'package:auvnet_store/core/routes/base_routes.dart';
import 'package:auvnet_store/core/routes/routers.dart';
import 'package:auvnet_store/features/auth/screens/login_screen.dart';
import 'package:flutter/material.dart';

/// Handles route generation for the app
class AppRouter {
  static Route<void> generateroutes(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.login:
        // Route for the login screen
        return BaseRoute(
          page: const LoginScreen(),
        );

      default:
        // Default route for unhandled routes, shows an under construction screen
        return BaseRoute(page: const UnderBuildScreen());
    }
  }
}
