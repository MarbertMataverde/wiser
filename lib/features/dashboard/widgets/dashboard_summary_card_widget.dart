import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wiser/core/constant/core_constant.dart';
import 'package:wiser/features/dashboard/widgets/dashboard_income_expenses_card_widget.dart';
import 'package:wiser/features/record/view/new_record_view.dart';

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
                dashboardIncomeExpensesCardWidget(value: '3,456.00'),
                dashboardIncomeExpensesCardWidget(
                    value: '2,345.00', isIncome: false)
              ],
            ),
            TextButton.icon(
              style: TextButton.styleFrom(
                  backgroundColor:
                      Theme.of(context).primaryColor.withAlpha(20)),
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NewRecordView(),
                  )),
              icon: const Icon(
                Iconsax.receipt_add,
                size: 20,
              ),
              label: const Text(
                'New Record',
                textScaleFactor: 0.9,
              ),
            )
          ],
        ),
      ),
    ),
  );
}
