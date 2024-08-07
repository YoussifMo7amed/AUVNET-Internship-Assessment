import 'package:auvnet_store/core/common/screens/under_build_screen.dart';
import 'package:auvnet_store/core/di/injection_container.dart';
import 'package:auvnet_store/core/routes/base_routes.dart';
import 'package:auvnet_store/core/routes/routers.dart';
import 'package:auvnet_store/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:auvnet_store/features/auth/presentation/screens/login_screen.dart';
import 'package:auvnet_store/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:auvnet_store/features/main/screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Handles route generation for the app
class AppRouter {
  static Route<void> generateroutes(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.login:
        // Route for the login screen
        return BaseRoute(
          page: BlocProvider(
            create: (context) => sl<AuthBloc>(),
            child: const LoginScreen(),
          ),
        );
      case Routes.signUp:
        // Route for the login screen
        return BaseRoute(
          page: BlocProvider(
            create: (context) => sl<AuthBloc>(),
            child: const SignUpScreen(),
          ),
        );

      case Routes.home:
        // Route for the Home screen
        return BaseRoute(
          page: const MainScreen(),
        );

      default:
        // Default route for unhandled routes, shows an under construction screen
        return BaseRoute(page: const UnderBuildScreen());
    }
  }
}
