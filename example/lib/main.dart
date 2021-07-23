import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_common_plugin/app_info.dart';
import 'package:flutter_common_plugin/flutter_common_plugin.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    IosAppInfo? appInfo;
    try {
      if (Platform.isIOS) {
        appInfo = await FlutterCommonPlugin.iOSAppInfo ?? null;
      }
    } on PlatformException {
      appInfo = null;
    }
    if (!mounted) return;
    if (appInfo != null) {
      setState(() {
        _platformVersion = appInfo!.descrption();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Running on: $_platformVersion\n'),
            SizedBox(
              height: 50,
            ),
            TextButton(
                onPressed: () {
                  FlutterCommonPlugin.launch("https://www.baidu.com/");
                },
                child: Text("打开百度"))
          ],
        )),
      ),
    );
  }
}
