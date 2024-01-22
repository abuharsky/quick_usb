import 'package:flutter_test/flutter_test.dart';
import 'package:quick_usb/quick_usb.dart';
import 'package:quick_usb/quick_usb_platform_interface.dart';
import 'package:quick_usb/quick_usb_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockQuickUsbPlatform
    with MockPlatformInterfaceMixin
    implements QuickUsbPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final QuickUsbPlatform initialPlatform = QuickUsbPlatform.instance;

  test('$MethodChannelQuickUsb is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelQuickUsb>());
  });

  test('getPlatformVersion', () async {
    QuickUsb quickUsbPlugin = QuickUsb();
    MockQuickUsbPlatform fakePlatform = MockQuickUsbPlatform();
    QuickUsbPlatform.instance = fakePlatform;

    expect(await quickUsbPlugin.getPlatformVersion(), '42');
  });
}
