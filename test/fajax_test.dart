import 'package:fajax/fajax.dart';
import 'package:fajax/fajax_method_channel.dart';
import 'package:fajax/model/fajax_model.dart';
import 'package:fajax/fajax_platform_interface.dart';
import 'package:fajax/model/fajax_result.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFajaxPlatform
    with MockPlatformInterfaceMixin
    implements FajaxPlatform {
  @override
  Future<void> makeRequest(FajaxModel fajaxModel,
      Function(FajaxResult p1)? onSuccess, Function(Map p1)? onError) {
    // TODO: implement makeRequest
    throw UnimplementedError();
  }
}

void main() {
  final FajaxPlatform initialPlatform = FajaxPlatform.instance;

  test('$MethodChannelFajax is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFajax>());
  });

  test('getPlatformVersion', () async {
    Fajax fajaxPlugin = Fajax();
    MockFajaxPlatform fakePlatform = MockFajaxPlatform();
    FajaxPlatform.instance = fakePlatform;

    // expect(await fajaxPlugin(), '42');
  });
}
