import 'package:auvnet_store/core/extensions/context_extension.dart';
import 'package:auvnet_store/features/main/refactors/bottom_nav_bar.dart';
import 'package:auvnet_store/features/main/refactors/main_app_bar.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
            Expanded(child: Text('MainScree')),
           const MainBottomNavBar(),
          ],
        ),
      ),
    );
  
  }
}