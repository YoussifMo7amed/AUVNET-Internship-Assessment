import 'package:auvnet_store/core/di/injection_container.dart';
import 'package:auvnet_store/core/extensions/context_extension.dart';
import 'package:auvnet_store/core/routes/routers.dart';
import 'package:auvnet_store/core/service/shared_pref/pref_keys.dart';
import 'package:auvnet_store/core/service/shared_pref/shared_pref.dart';
import 'package:flutter/widgets.dart';

class AppLogout {
  factory AppLogout() => AppLogout.instance;
  AppLogout._();
  static AppLogout instance = AppLogout._();

  Future<void> logout() async {
    final context = sl<GlobalKey<NavigatorState>>().currentState!.context;

    await SharedPref().removePreference(PrefKeys.accessToken);
    await SharedPref().removePreference(PrefKeys.userId);

    await context.pushNamedAndRemoveUntil(
      Routes.login,
    );
  }
}
