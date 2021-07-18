import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final batteryDataSourceProvider = Provider(
  (ref) => BatteryDataSource(ref.read),
);

class BatteryDataSource {
  BatteryDataSource(this._reader);
  // ignore: unused_field
  final Reader _reader;

  late final platform = const MethodChannel('elecon.flutter.dev/battery');

  Future<int?> getBatteryLevel() async {
    final battery = await platform.invokeMethod('getBatteryLevel') as int?;
    return battery;
  }
}
