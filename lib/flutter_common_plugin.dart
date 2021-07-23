import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_common_plugin/app_info.dart';
import 'package:flutter_common_plugin/config.dart';

///
/// 根据需求可以拓展基础功能
///
class FlutterCommonPlugin {
  static const MethodChannel _channel =
      const MethodChannel(FCPConfig.commonChannel);

  ///
  /// 获取iOS app 信息
  ///
  static Future<IosAppInfo?> get iOSAppInfo async {
    Map<dynamic, dynamic>? resultData =
        await _channel.invokeMapMethod(FCPConfig.getAppInfo);
    if (resultData == null) {
      return null;
    }
    return IosAppInfo.fromMap(resultData);
  }

  ///
  /// 获取andriod app信息
  ///
  static Future<AndriodAppInfo?> get andriodAppInfo async {
    Map<dynamic, dynamic>? resultData =
        await _channel.invokeMapMethod(FCPConfig.getAppInfo);
    if (resultData == null) {
      return null;
    }
    return AndriodAppInfo.fromMap(resultData);
  }

  ///
  /// 跳转外部浏览器
  ///
  static Future<void> launch(String url) async {
    if (url.isNotEmpty) {
      await _channel.invokeMethod(FCPConfig.launchUrl, {'url': url});
    }
  }
}
