import 'package:auvnet_store/auvnet_store.dart';
import 'package:auvnet_store/core/app/bloc_observer.dart';
import 'package:auvnet_store/core/di/injection_container.dart';
import 'package:auvnet_store/core/service/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref().instantiatePreferences();

  await setupInjector();

  Bloc.observer = AppBlocObserver();

  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp],
  ).then((_) {
    runApp(const AuvnetStoreApp());
  });
}
