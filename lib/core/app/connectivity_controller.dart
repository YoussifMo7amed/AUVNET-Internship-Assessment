import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

/// Singleton class to manage connectivity state
class ConnectivityController {
  // Private constructor
  ConnectivityController._();

  // Singleton instance
  static final ConnectivityController instance = ConnectivityController._();

  // ValueNotifier to notify listeners about connectivity changes
  ValueNotifier<bool> isConnected = ValueNotifier(true);

  /// Initializes the connectivity monitoring
  Future<void> init() async {
    // Check the initial connectivity status
    final result = await Connectivity().checkConnectivity();
    isInternetConnected(result: result);

    // Listen for connectivity changes
    Connectivity().onConnectivityChanged.listen(
      (result) {
        isInternetConnected(result: result);
      },
    );
  }

  /// Updates the connectivity status
  ///
  /// [result] is the current connectivity status
  bool isInternetConnected({required ConnectivityResult result}) {
    if (result == ConnectivityResult.none) {
      isConnected.value = false;
      return false;
    } else if (result == ConnectivityResult.mobile ||
               result == ConnectivityResult.wifi) {
      isConnected.value = true;
      return true;
    } else {
      return false;
    }
  }
}
