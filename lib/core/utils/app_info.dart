import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppInfo {
  const AppInfo._();

  static Future<String> getAppVersion(BuildContext context) async {
    var buildNumberText = '';

    final packgeInfo = await PackageInfo.fromPlatform();
    buildNumberText = '${packgeInfo.version} (${packgeInfo.buildNumber})';

    return buildNumberText;
  }
}
