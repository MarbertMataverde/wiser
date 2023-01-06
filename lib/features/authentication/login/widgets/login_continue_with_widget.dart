import 'package:flutter/material.dart';
import 'package:wiser/core/constant/core_constant.dart';

Align continueWithWidget() {
  return const Align(
    alignment: Alignment.center,
    child: Text(
      'Continue with',
      textScaleFactor: 0.8,
      style: TextStyle(
        color: CoreConstant.bodyColor,
      ),
    ),
  );
}
