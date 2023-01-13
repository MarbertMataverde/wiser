import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:wiser/core/constant/core_constant.dart';

Column dashboardRecordListReplacement() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: const [
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
