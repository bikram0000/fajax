import 'dart:async';

import 'package:fajax/fajax.dart';
import 'package:fajax/model/fajax_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  final _fajaxPlugin = Fajax();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      Future.delayed(Duration(seconds: 5), () async {
        await _fajaxPlugin.makeRequest(
            fajaxModel: FajaxModel(
                baseUrl: "https://geolocation-db.com/json",
                body: {},
                params: {},
                headers: {},
                method: "GET"),
            onSuccess: (fajaxResult) {
              {
                String countryCode = fajaxResult.response['country_code'];
                print(
                    " on success${DateTime.now()} :: $countryCode ::  ${fajaxResult.response}");
              }
            },
            onError: (p0) => {print(" on error$p0")});
      });

      // platformVersion =
      //     await _fajaxPlugin.getPlatformVersion() ?? 'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;
    //
    // setState(() {
    //   _platformVersion = platformVersion;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Running on: $_platformVersion\n'),
        ),
      ),
    );
  }
}
