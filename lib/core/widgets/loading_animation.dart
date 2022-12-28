import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:wiser/core/constant.dart';

Align loadingAnimation() {
  return const Align(
    alignment: Alignment.center,
    child: SizedBox(
      width: 40,
      height: 40,
      child: RiveAnimation.asset(Constant.loadingAssetPath),
    ),
  );
}
