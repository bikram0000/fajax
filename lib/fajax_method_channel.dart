import 'package:fajax/model/fajax_result.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'fajax_platform_interface.dart';
import 'model/fajax_model.dart';

/// An implementation of [FajaxPlatform] that uses method channels.
class MethodChannelFajax extends FajaxPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('fajax');

  @override
  Future<void> makeRequest(
      FajaxModel fajaxModel,
      Function(FajaxResult)? onSuccess,
      Function(Map<dynamic, dynamic>)? onError) async {


  }
}
