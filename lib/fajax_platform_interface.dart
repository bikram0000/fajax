import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'fajax_method_channel.dart';
import 'model/fajax_model.dart';
import 'model/fajax_result.dart';

abstract class FajaxPlatform extends PlatformInterface {
  /// Constructs a FajaxPlatform.
  FajaxPlatform() : super(token: _token);

  static final Object _token = Object();

  static FajaxPlatform _instance = MethodChannelFajax();

  /// The default instance of [FajaxPlatform] to use.
  ///
  /// Defaults to [MethodChannelFajax].
  static FajaxPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FajaxPlatform] when
  /// they register themselves.
  static set instance(FajaxPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> makeRequest(
    FajaxModel fajaxModel,
    Function(FajaxResult)? onSuccess,
    Function(Map<dynamic, dynamic>)? onError,
  ) async {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
