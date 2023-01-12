import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wiser/core/constant/core_constant.dart';
import 'package:wiser/features/record/view/new_record_view.dart';

Theme datePickerTheme(
    {required BuildContext context,
    required Widget child,
    required WidgetRef ref}) {
  return Theme(
      data: Theme.of(context).copyWith(
        colorScheme: ColorScheme.light(
          primary: ref.watch(isIncomeStateProvider)
              ? CoreConstant.greenColor
              : CoreConstant.redColor,
          onSurface: ref.watch(isIncomeStateProvider)
              ? CoreConstant.greenColor
              : CoreConstant.redColor,
        ),
      ),
      child: child);
}
