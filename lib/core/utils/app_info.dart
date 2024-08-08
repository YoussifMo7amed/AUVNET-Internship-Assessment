import 'package:flutter/material.dart';

class AppInfo {
  const AppInfo._();
  
  static get PackageInfo => null;

  static Future<String> getAppVersion(BuildContext context) async {
    var buildNumberText = '';

    final packgeInfo = await PackageInfo.fromPlatform();
    buildNumberText = '${packgeInfo.version} (${packgeInfo.buildNumber})';

    return buildNumberText;
  }
}
