import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void useEffectSafety(void Function()? Function() effect,
    [List<Object?>? keys]) {
  useEffect(
    () {
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        effect();
      });
    },
    keys,
  );
}
