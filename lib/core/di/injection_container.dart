import 'package:auvnet_store/core/app/app_cubit/app_cubit.dart';
import 'package:auvnet_store/core/service/networking/api_service.dart';
import 'package:auvnet_store/core/service/networking/dio_factory.dart';
import 'package:auvnet_store/features/auth/data/repos/auth_repo.dart';
import 'package:auvnet_store/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:auvnet_store/features/cart/presentation/cubit/add_to_cart/cart_cubit.dart';
import 'package:auvnet_store/features/home/data/repo/home_repo.dart';
import 'package:auvnet_store/features/home/presentation/bloc/get_banners/get_banners_bloc.dart';
import 'package:auvnet_store/features/home/presentation/bloc/get_categories/get_categories_bloc.dart';
import 'package:auvnet_store/features/home/presentation/bloc/get_products/get_products_bloc.dart';
import 'package:auvnet_store/features/main/presentation/cubit/cubit/main_cubit.dart';
import 'package:auvnet_store/features/product_details/data/repo/product_details_repo.dart';
import 'package:auvnet_store/features/product_details/presentation/bloc/product_details/product_details_bloc.dart';
import 'package:auvnet_store/features/profile/data/repo/profile_repo.dart';
import 'package:auvnet_store/features/profile/presentation/bloc/bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance; // Singleton instance of GetIt for service locator

Future<void> setupInjector() async {
  await _initCore();          // Initialize core services
  await _initAuth();          // Initialize authentication services
  await _initMain();          // Initialize main feature services
  await _initProfile();       // Initialize profile services
  await _initHome();          // Initialize home feature services
  await _initProductDetails(); // Initialize product details feature services
  await _initCart();          // Initialize cart feature services
}

Future<void> _initCore() async {
  final dio = DioFactory.getDio(); // Get Dio instance for network requests
  final navigatorKey = GlobalKey<NavigatorState>(); // Key for navigation

  sl
    ..registerFactory(AppCubit.new) // Register AppCubit factory
    ..registerLazySingleton<ApiService>(() => ApiService(dio)) // Register ApiService as a singleton
    ..registerSingleton<GlobalKey<NavigatorState>>(navigatorKey); // Register navigator key
}

Future<void> _initAuth() async {
  sl
    ..registerFactory(() => AuthBloc(sl())) // Register AuthBloc factory with dependencies
    ..registerLazySingleton(() => AuthRepos(sl())); // Register AuthRepos as a singleton
}

Future<void> _initMain() async {
  sl.registerFactory(MainCubit.new); // Register MainCubit factory
}

Future<void> _initProfile() async {
  sl
    ..registerFactory(() => ProfileBloc(sl())) // Register ProfileBloc factory with dependencies
    ..registerLazySingleton(() => ProfileRepo(sl())); // Register ProfileRepo as a singleton
}

Future<void> _initHome() async {
  sl
    ..registerFactory(() => GetBannersBloc(sl())) // Register GetBannersBloc factory with dependencies
    ..registerFactory(() => GetProductsBloc(sl())) // Register GetProductsBloc factory with dependencies
    ..registerFactory(() => GetCategoriesBloc(sl())) // Register GetCategoriesBloc factory with dependencies
    ..registerLazySingleton(() => HomeRepo(sl())); // Register HomeRepo as a singleton
}

Future<void> _initProductDetails() async {
  sl
    ..registerFactory(() => ProductDetailsBloc(sl())) // Register ProductDetailsBloc factory with dependencies
    ..registerLazySingleton(() => ProductDetailsRepo(sl())); // Register ProductDetailsRepo as a singleton
}

Future<void> _initCart() async {
  sl.registerFactory(CartCubit.new); // Register CartCubit factory
}
