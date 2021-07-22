import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_common_plugin/app_info.dart';
import 'package:flutter_common_plugin/config.dart';

class FlutterCommonPlugin {
  static const MethodChannel _channel =
      const MethodChannel(FCPConfig.commonChannel);

  ///
  /// 获取iOS app 信息
  ///
  static Future<IosAppInfo?> get iOSAppInfo async {
    final String? repData = await _channel.invokeMethod(FCPConfig.getAppInfo);
    if (repData == null) {
      return null;
    }
    if (json.decode(repData) == null) {
      return null;
    }
    return IosAppInfo.fromMap(json.decode(repData));
  }

  ///
  /// 获取andriod app信息
  ///
  static Future<AndriodAppInfo?> get andriodAppInfo async {
    final String? repData = await _channel.invokeMethod(FCPConfig.getAppInfo);
    if (repData == null) {
      return null;
    }
    if (json.decode(repData) == null) {
      return null;
    }
    return AndriodAppInfo.fromMap(json.decode(repData));
  }
}
