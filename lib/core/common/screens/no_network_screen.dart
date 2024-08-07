import 'package:auvnet_store/core/styles/images/app_images.dart';
import 'package:flutter/material.dart';

/// Displays a no network connection screen with a background image
class NoNetworkScreen extends StatelessWidget {
  const NoNetworkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.noNetwork), // Background image for no network
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
