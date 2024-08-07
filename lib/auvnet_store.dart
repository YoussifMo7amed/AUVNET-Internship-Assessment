import 'package:auvnet_store/core/app/connectivity_controller.dart';
import 'package:auvnet_store/core/common/screens/no_network_screen.dart';
import 'package:auvnet_store/core/routes/app_router.dart';
import 'package:auvnet_store/core/routes/routers.dart';
import 'package:auvnet_store/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuvnetStoreApp extends StatelessWidget {
  const AuvnetStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: ConnectivityController.instance.isConnected,
        builder: (_, value, __) {
          if (value) {
            return ScreenUtilInit(
              designSize: const Size(375, 812),
              minTextAdapt: true,
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Auvnet Store',
                theme: themeDark(),
                builder: (context, widget) {
                  return Scaffold(
                    body: Builder(
                      builder: (context) {
                        ConnectivityController.instance.init();
                        return widget!;
                      },
                    ),
                  );
                },
                home: Scaffold(
                  appBar: AppBar(
                    title: const Text('Asroo Store'),
                  ),
                ),
                onGenerateRoute: AppRouter.generateroutes,
                    initialRoute: Routes.login,
              ),
            );
          } else {
            return const MaterialApp(
              title: 'No Network',
              debugShowCheckedModeBanner: false,
              home: NoNetworkScreen(),
            );
          }
        });
  }
}
