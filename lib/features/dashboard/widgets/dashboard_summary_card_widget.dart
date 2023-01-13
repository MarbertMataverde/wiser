import 'package:flutter/material.dart';
import 'package:wiser/core/constant/core_constant.dart';
import 'package:wiser/core/widgets/core_new_record_button_widget.dart';
import 'package:wiser/features/dashboard/widgets/dashboard_income_expenses_card_widget.dart';

SizedBox dashboardSummaryCardWidget(BuildContext context) {
  return SizedBox(
    height: 230,
    width: double.infinity,
    child: Card(
      elevation: 0,
      color: CoreConstant.fillColor,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              'Total Balance',
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              '₱ 8,910.00',
              textScaleFactor: 2.5,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                dashboardIncomeExpensesCardWidget(),
                dashboardIncomeExpensesCardWidget(isIncome: false)
              ],
            ),
            coreNewRecordButtonWidget(context)
          ],
        ),
      ),
    ),
  );
}
