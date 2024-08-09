import 'package:auvnet_store/core/app/app_cubit/app_cubit.dart';
import 'package:auvnet_store/core/service/networking/api_service.dart';
import 'package:auvnet_store/core/service/networking/dio_factory.dart';
import 'package:auvnet_store/features/auth/data/repos/auth_repo.dart';
import 'package:auvnet_store/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:auvnet_store/features/cart/presentation/cubit/cart/cart_cubit.dart';
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

final sl = GetIt.instance;

Future<void> setupInjector() async {
  await _initCore();
  await _initAuth();
  await _initMain();
  await _initProfile();
  await _initHome();
  await _initProductDetails();
  await _initCart();
}

Future<void> _initCore() async {
  final dio = DioFactory.getDio();
  final navigatorKey = GlobalKey<NavigatorState>();
  sl
    ..registerFactory(AppCubit.new)
    ..registerLazySingleton<ApiService>(() => ApiService(dio))
    ..registerSingleton<GlobalKey<NavigatorState>>(navigatorKey);
}

Future<void> _initAuth() async {
  sl
    ..registerFactory(() => AuthBloc(sl()))
    ..registerLazySingleton(() => AuthRepos(sl()));
}

Future<void> _initMain() async {
  sl.registerFactory(MainCubit.new);
}

Future<void> _initProfile() async {
  sl
    ..registerFactory(() => ProfileBloc(sl()))
    ..registerLazySingleton(() => ProfileRepo(sl()));
}

Future<void> _initHome() async {
  sl
    ..registerFactory(() => GetBannersBloc(sl()))
    ..registerFactory(() => GetProductsBloc(sl()))
    ..registerFactory(() => GetCategoriesBloc(sl()))
    ..registerLazySingleton(() => HomeRepo(sl()));
}

Future<void> _initProductDetails() async {
  sl
    ..registerFactory(() => ProductDetailsBloc(sl()))
    ..registerLazySingleton(() => ProductDetailsRepo(sl()));
}
Future<void> _initCart() async {
  sl.registerFactory(CartCubit.new);
}