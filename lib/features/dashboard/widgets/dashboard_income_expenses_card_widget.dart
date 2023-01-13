import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wiser/core/constant/core_constant.dart';
import 'package:wiser/core/widgets/core_loading_animation_widget.dart';

dashboardIncomeExpensesCardWidget({
  bool isIncome = true,
}) {
  final incomeRecordStream = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('records')
      .where('record-type', isEqualTo: 'Income')
      .snapshots();

  final expenseRecordStream = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('records')
      .where('record-type', isEqualTo: 'Expense')
      .snapshots();
  return StreamBuilder(
    stream: isIncome ? incomeRecordStream : expenseRecordStream,
    builder: (context, snapshot) {
      if (snapshot.hasError) {
        return const Text('Something went wrong');
      }

      if (snapshot.connectionState == ConnectionState.waiting) {
        return coreLoadingAnimationWidget();
      }
      final recordData = snapshot.data!.docs;
      double sum = 0.0;
      for (var i = 0; i < recordData.length; i++) {
        sum += (recordData[i]['record-amount']);
      }
      return Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
              visible: isIncome ? true : false,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    isIncome
                        ? EneftyIcons.arrow_down_2_bold
                        : EneftyIcons.arrow_up_4_bold,
                    color: isIncome
                        ? CoreConstant.greenColor
                        : CoreConstant.redColor,
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
                  textScaleFactor: 0.8,
                  style: const TextStyle(
                    color: CoreConstant.greyColor,
                  ),
                ),
                FittedBox(
                  child: Text(
                    '₱ $sum',
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
                    isIncome
                        ? EneftyIcons.arrow_down_2_bold
                        : EneftyIcons.arrow_up_4_bold,
                    color: isIncome
                        ? CoreConstant.greenColor
                        : CoreConstant.redColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}
