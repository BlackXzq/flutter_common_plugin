import Flutter
import UIKit


private let channelName = "flutter_common_plugin"

// Action 事件 获取app信息
private let getAppInfo = "getAppinfo"
// 打开系统浏览器，跳转外部链接
private let launchUrl = "launchUrl";


public class SwiftFlutterCommonPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: channelName, binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterCommonPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if call.method == getAppInfo {
        result(DeviceInfo.getAppInfo())
    } else if call.method == launchUrl {
        guard let params = call.arguments as? [String: String],
              let url = params["url"],
              url.count > 0 else {
            return result(false)
        }
        UIApplication.shared.openURL(URL(string: url)!)
    } else {
        result(FlutterMethodNotImplemented)
    }
    
  }
}

/**
字典转换为JSONString
- parameter dictionary: 字典参数
- returns: JSONString
*/
func dictionaryToString(dictionary: [String: Any]) -> String? {
    do {
        let newData = try JSONSerialization.data(withJSONObject: dictionary, options: .fragmentsAllowed)
        return String(data: newData, encoding: .utf8)
    } catch {
        return nil
    }
}
