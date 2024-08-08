import 'package:auvnet_store/core/di/injection_container.dart';
import 'package:auvnet_store/core/enums/nav_bar_enum.dart';
import 'package:auvnet_store/core/extensions/context_extension.dart';
import 'package:auvnet_store/features/categories/categories_screen.dart';
import 'package:auvnet_store/features/favorites/favorites_screen.dart';
import 'package:auvnet_store/features/home/home_screen.dart';
import 'package:auvnet_store/features/main/presentation/cubit/cubit/main_cubit.dart';
import 'package:auvnet_store/features/main/presentation/refactors/bottom_nav_bar.dart';
import 'package:auvnet_store/features/main/presentation/refactors/main_app_bar.dart';
import 'package:auvnet_store/features/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
 Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MainCubit>(),
      child: Scaffold(
        appBar: const MainAppBar(),
        body: Container(
          constraints: const BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(context.assets.homeBg!),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: BlocBuilder<MainCubit, MainState>(
                  builder: (context, state) {
                    final cubit = context.read<MainCubit>();
                    if (cubit.navBarEnum == NavBarEnum.catgeories) {
                      return const CatgeoriesScreen();
                    } else if (cubit.navBarEnum == NavBarEnum.favorites) {
                      return const FavoritesScreen();
                    } else if (cubit.navBarEnum == NavBarEnum.profile) {
                      return const ProfileScreen();
                    }
                    return const HomeScreen();
                  },
                ),
              ),
              const MainBottomNavBar(),
            ],
          ),
        ),
      ),
    );
  }
}