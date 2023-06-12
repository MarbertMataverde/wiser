import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wiser/core/constant/core_constant.dart';
import 'package:wiser/features/record/view/new_record_view.dart';

Row recordTransactionTypeBarWidget({
  required WidgetRef ref,
}) {
  return Row(
    children: [
      Expanded(
        flex: ref.watch(isIncomeStateProvider) ? 2 : 1,
        child: GestureDetector(
          onTap: () =>
              ref.read(isIncomeStateProvider.notifier).update((state) => true),
          child: AnimatedContainer(
            duration: const Duration(seconds: 1),
            curve: Curves.decelerate,
            height: 50,
            decoration: BoxDecoration(
                color: ref.watch(isIncomeStateProvider)
                    ? CoreConstant.greenColor
                    : CoreConstant.secondaryTextColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(5),
                  bottomLeft: Radius.circular(5),
                )),
            child: Center(
              child: Text(
                'Income',
                style: TextStyle(
                  color: ref.watch(isIncomeStateProvider)
                      ? CoreConstant.colorWhite
                      : CoreConstant.primaryTextColor,
                ),
              ),
            ),
          ),
        ),
      ),
      Expanded(
        flex: ref.watch(isIncomeStateProvider) ? 1 : 2,
        child: GestureDetector(
          onTap: () =>
              ref.read(isIncomeStateProvider.notifier).update((state) => false),
          child: AnimatedContainer(
            duration: const Duration(seconds: 1),
            curve: Curves.decelerate,
            height: 50,
            decoration: BoxDecoration(
              color: ref.watch(isIncomeStateProvider)
                  ? CoreConstant.secondaryTextColor
                  : CoreConstant.redColor,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(5),
                bottomRight: Radius.circular(5),
              ),
            ),
            child: Center(
              child: Text(
                'Expense',
                style: TextStyle(
                  color: ref.watch(isIncomeStateProvider)
                      ? CoreConstant.primaryTextColor
                      : CoreConstant.colorWhite,
                ),
              ),
            ),
          ),
        ),
      )
    ],
  );
}
