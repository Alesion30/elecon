import 'package:flutter/material.dart';

enum AppMode {
  hall, // エレベーターホール
  scan, // スキャン
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
    return Constants.hall9F();
  }

  // エレベーター 左
  factory Constants.elevatorLeft() {
    return const Constants(
      appMode: AppMode.scan,
      dir: Dir.left,
    );
  }

  // ホール9F
  factory Constants.hall9F() {
    return const Constants(
      appMode: AppMode.hall,
      floor: 9,
    );
  }

  static late final Constants instance = Constants.of();

  final AppMode appMode;
  final Dir? dir;
  final int? floor;
}
