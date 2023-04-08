import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fajax/fajax_method_channel.dart';

void main() {
  MethodChannelFajax platform = MethodChannelFajax();
  const MethodChannel channel = MethodChannel('fajax');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });
  //
  // test('getPlatformVersion', () async {
  //   expect(await platform.getPlatformVersion(), '42');
  // });
}
