import 'package:auvnet_store/core/app/connectivity_controller.dart';
import 'package:auvnet_store/core/common/screens/no_network_screen.dart';
import 'package:flutter/material.dart';

class AuvnetStoreApp extends StatelessWidget {
  const AuvnetStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: ConnectivityController.instance.isConnected,
        builder: (_, value, __) {
          if (value) {
            return MaterialApp(
              title: 'Auvnet Store',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
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
