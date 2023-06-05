import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:wiser/core/constant/core_constant.dart';

Column dashboardRecordListReplacement() {
  return const Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Expanded(
        flex: 2,
        child: RiveAnimation.asset(
          CoreConstant.emptyRecordAssetPath,
        ),
      ),
      Expanded(
        child: Text('No Record Yet'),
      ),
    ],
  );
}
