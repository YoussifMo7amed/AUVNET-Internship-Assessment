import 'package:auvnet_store/core/di/injection_container.dart';
import 'package:auvnet_store/core/enums/nav_bar_enum.dart';
import 'package:auvnet_store/core/extensions/context_extension.dart';
import 'package:auvnet_store/features/cart/presentation/screens/cart_screen.dart';
import 'package:auvnet_store/features/home/presentation/screen/home_screen.dart';
import 'package:auvnet_store/features/main/presentation/cubit/cubit/main_cubit.dart';
import 'package:auvnet_store/features/main/presentation/refactors/bottom_nav_bar.dart';
import 'package:auvnet_store/features/main/presentation/refactors/main_app_bar.dart';
import 'package:auvnet_store/features/profile/presentation/screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// The main screen widget that displays the app's main content.
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // Providing the MainCubit to manage the state of the MainScreen.
      create: (context) => sl<MainCubit>(),
      child: Scaffold(
        appBar: const MainAppBar(),
        body: Container(
          constraints: const BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
              // Background image for the main screen.
              image: AssetImage(context.assets.homeBg!),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            children: [
              // The main content of the screen, which changes based on the selected navigation bar icon.
              Expanded(
                child: BlocBuilder<MainCubit, MainState>(
                  builder: (context, state) {
                    final cubit = context.read<MainCubit>();

                    // Display the CartScreen if the cart icon is selected.
                    if (cubit.navBarEnum == NavBarEnum.cart) {
                      return const CartScreen();
                    } 
                    // Display the ProfileScreen if the profile icon is selected.
                    else if (cubit.navBarEnum == NavBarEnum.profile) {
                      return const ProfileScreen();
                    }
                    // Default to displaying the HomeScreen if the home icon is selected.
                    return const HomeScreen();
                  },
                ),
              ),
              // The bottom navigation bar at the bottom of the screen.
              const MainBottomNavBar(),
            ],
          ),
        ),
      ),
    );
  }
}
