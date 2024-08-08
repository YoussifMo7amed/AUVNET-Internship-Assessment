import 'package:auvnet_store/core/common/screens/under_build_screen.dart';
import 'package:auvnet_store/core/di/injection_container.dart';
import 'package:auvnet_store/core/routes/base_routes.dart';
import 'package:auvnet_store/core/routes/routers.dart';
import 'package:auvnet_store/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:auvnet_store/features/auth/presentation/screens/login_screen.dart';
import 'package:auvnet_store/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:auvnet_store/features/main/presentation/cubit/cubit/main_cubit.dart';
import 'package:auvnet_store/features/main/presentation/screen/main_screen.dart';
import 'package:auvnet_store/features/product_details/presentation/product_details_screen.dart';
import 'package:auvnet_store/features/profile/presentation/bloc/bloc/profile_bloc.dart';
import 'package:auvnet_store/features/profile/presentation/bloc/bloc/profile_event.dart';
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
          page: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => sl<AuthBloc>(),
              ),
              BlocProvider(
                create: (context) => sl<ProfileBloc>()..add(
                  const GetUserInfoEvent(),
                ),
              ),
            ],
            child: const SignUpScreen()),
        );

       case Routes.mainScreen:
        return BaseRoute(
          page: BlocProvider(
            create: (context) => sl<MainCubit>(),
            child: const MainScreen(),
          ),
        );
          case Routes.productDetails:
        return BaseRoute(
          page: ProductDetailsScreen(
            productId: args! as int,
          ),
        );

      default:
        // Default route for unhandled routes, shows an under construction screen
        return BaseRoute(page: const UnderBuildScreen());
    }
  }
}
