import 'package:flutter/material.dart';
import 'package:wiser/core/constant.dart';

Align continueWith() {
  return const Align(
    alignment: Alignment.center,
    child: Text(
      'Continue with',
      textScaleFactor: 0.8,
      style: TextStyle(
        color: Constant.bodyColor,
      ),
    ),
  );
}
