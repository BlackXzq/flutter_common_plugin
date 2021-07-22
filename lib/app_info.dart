/*
 * @Author: zhanqiang.xu 
 * @Date: 2021-07-22 09:19:40 
 * @Last Modified by: zhanqiang.xu
 * @Last Modified time: 2021-07-22 11:26:58
 */

///
/// iOS app 相关信息
///
class IosAppInfo {
  /// app 版本号：1.0.0
  /// 为空不可用
  final String appVersion;

  /// app 打包号
  /// 为空不可用
  final String buildNum;

  /// 手机品牌 iPhone 6s Plus
  /// 为空不可用
  final String brandInfo;

  /// 获取系统版本 iOS 14.2
  /// 为空不可用
  final String platformVersion;

  /// app 名字
  /// 为空不可用
  final String appName;

  /// 包ID
  /// 为空不可用
  final String bundleIdentifier;

  IosAppInfo({
    required this.appVersion,
    required this.buildNum,
    required this.brandInfo,
    required this.platformVersion,
    required this.appName,
    required this.bundleIdentifier,
  });

  static IosAppInfo fromMap(Map<String, dynamic> map) {
    return IosAppInfo(
      appVersion: map['appVersion'] ?? '',
      buildNum: map['buildNum'] ?? '',
      brandInfo: map['brandInfo'] ?? '',
      platformVersion: map['platformVersion'] ?? '',
      appName: map['appName'] ?? '',
      bundleIdentifier: map['bundleIdentifier'] ?? '',
    );
  }

  descrption() {
    return "appName: ${this.appName}  bundleIdentifier: ${this.bundleIdentifier}  appVersion: ${this.appVersion}  buildNum: ${this.buildNum}  brandInfo: ${this.brandInfo}  platformVersion: ${this.platformVersion}";
  }
}

///
/// 安卓App信息
///
class AndriodAppInfo {
  /// app 版本号：1.0.0
  final String appVersion;

  /// app 打包号
  final String buildNum;

  /// 手机品牌 HUAWEI
  final String brandInfo;

  /// 获取系统版本 HarmonyOS
  final String platformVersion;

  /// app 名字
  /// 为空不可用
  final String appName;

  /// 包ID
  /// 为空不可用
  final String bundleIdentifier;

  AndriodAppInfo({
    required this.appVersion,
    required this.buildNum,
    required this.brandInfo,
    required this.platformVersion,
    required this.appName,
    required this.bundleIdentifier,
  });

  static AndriodAppInfo fromMap(Map<String, dynamic> map) {
    return AndriodAppInfo(
      appVersion: map['appVersion'] ?? '',
      buildNum: map['buildNum'] ?? '',
      brandInfo: map['brandInfo'] ?? '',
      platformVersion: map['platformVersion'] ?? '',
      appName: map['appName'] ?? '',
      bundleIdentifier: map['bundleIdentifier'] ?? '',
    );
  }
}
