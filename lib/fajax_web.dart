@JS()
library usb_device_web;

import 'dart:convert';
import 'dart:js_util';

// In order to *not* need this ignore, consider extracting the "web" version
// of your plugin as a separate package, instead of inlining it in the same
// package as the core of your plugin.
// ignore: avoid_web_libraries_in_flutter

import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:js/js.dart';

import 'fajax_platform_interface.dart';
import 'import_js/import_js_library.dart';
import 'model/fajax_model.dart';
import 'model/fajax_result.dart';

/// A web implementation of the FajaxPlatform of the Fajax plugin.
class FajaxWeb extends FajaxPlatform {
  late final FajaxJs _fajaxJs;

  /// Constructs a FajaxWeb
  FajaxWeb() : _fajaxJs = FajaxJs();

  static void registerWith(Registrar registrar) async {
    await importJsLibrary(url: "https://code.jquery.com/jquery-3.6.0.min.js");
    await importJsLibrary(url: "./assets/fajax.js", flutterPluginName: "fajax");
    FajaxPlatform.instance = FajaxWeb();
  }

  @override
  Future<void> makeRequest(
      FajaxModel fajaxModel,
      Function(FajaxResult)? onSuccess,
      Function(Map<dynamic, dynamic>)? onError) async {
    var body = (fajaxModel.body is Map || fajaxModel.body is List)
        ? jsify(fajaxModel.body)
        : fajaxModel.body;
    var res = await promiseToFuture(_fajaxJs.sendRequest(
      fajaxModel.baseUrl,
      jsify(fajaxModel.params),
      body,
      jsify(fajaxModel.headers),
      fajaxModel.method,
    ));
    try {
      Map<String, dynamic> data = jsonDecode(res);
      if (onSuccess != null) {
        onSuccess(FajaxResult(
          response: data["response"],
          info: data["info"],
        ));
      }
    } catch (e) {
      print("error on fajax :: $e");
      if (onError != null) {
        onError(res);
      }
    }
    // onSuccess(FajaxResult(response: getProperty(res, "response"), info: getProperty(res, "info")));
  }
}

@JS("FajaxJs")
class FajaxJs {
  external factory FajaxJs();

  external Promise sendRequest(baseUrl, params, body, headers, method);
}

@JS()
@anonymous
class Promise {
  external void then(Function onFulfilled, Function onRejected);
}
