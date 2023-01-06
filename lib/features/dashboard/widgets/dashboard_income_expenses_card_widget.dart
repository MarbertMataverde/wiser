import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wiser/core/constant/core_constant.dart';

Row dashboardIncomeExpensesCardWidget({
  bool isIncome = true,
  required String value,
}) {
  return Row(
    children: [
      Visibility(
        visible: isIncome ? true : false,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              isIncome ? Iconsax.arrow_down_2 : Iconsax.arrow_up_1,
              color: isIncome ? CoreConstant.greenColor : CoreConstant.redColor,
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            isIncome ? 'Income' : 'Expenses',
            textScaleFactor: 0.9,
          ),
          FittedBox(
            child: Text(
              '₱ $value',
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
      Visibility(
        visible: isIncome ? false : true,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              width: 10,
            ),
            Icon(
              isIncome ? Iconsax.arrow_down_2 : Iconsax.arrow_up_1,
              color: isIncome ? CoreConstant.greenColor : CoreConstant.redColor,
            ),
          ],
        ),
      ),
    ],
  );
}
