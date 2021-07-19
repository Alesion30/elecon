import 'package:flutter/material.dart';

enum AppMode {
  hall, // エレベーターホール
  sensor, // センサ
}

enum Dir {
  left, // 左
  right, // 右
}

@immutable
class Constants {
  const Constants({
    required this.appMode,
    this.dir,
    this.floor,
  });

  factory Constants.of() {
    return Constants.elevatorRight();
  }

  // エレベーター 左
  factory Constants.elevatorLeft() {
    return const Constants(
      appMode: AppMode.sensor,
      dir: Dir.left,
    );
  }

  // エレベーター 右
  factory Constants.elevatorRight() {
    return const Constants(
      appMode: AppMode.sensor,
      dir: Dir.right,
    );
  }

  // ホール9F
  factory Constants.hall9F() {
    return const Constants(
      appMode: AppMode.hall,
      floor: 9,
    );
  }

  // ホール1F
  factory Constants.hall1F() {
    return const Constants(
      appMode: AppMode.hall,
      floor: 1,
    );
  }

  static late final Constants instance = Constants.of();

  final AppMode appMode;
  final Dir? dir;
  final int? floor;

  bool get isLandscape => appMode == AppMode.hall; // ホールモードの時だけ横向き
  // double? get brightness => appMode == AppMode.sensor ? 0.1 : 1.0; // センサモードの時は暗く
}
