import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wiser/core/constant/core_constant.dart';
import 'package:wiser/core/widgets/core_loading_animation_widget.dart';
import 'package:wiser/core/widgets/core_new_record_button_widget.dart';
import 'package:wiser/features/dashboard/widgets/dashboard_income_expenses_card_widget.dart';

dashboardSummaryCardWidget(BuildContext context) {
  final Stream<QuerySnapshot> accountStream = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('accounts')
      .snapshots();
  return StreamBuilder<QuerySnapshot>(
    stream: accountStream,
    builder: (context, snapshot) {
      if (snapshot.hasError) {
        return const Text('Something went wrong');
      }

      if (snapshot.connectionState == ConnectionState.waiting) {
        return coreLoadingAnimationWidget();
      }
      final accountData = snapshot.data!.docs;
      double accountSum = 0.0;
      for (var i = 0; i < accountData.length; i++) {
        accountSum += (accountData[i]['account-initial-amount']);
      }
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
                  NumberFormat.currency(
                    locale: 'en_ph',
                    symbol: '₱',
                    decimalDigits: 0,
                  ).format(
                    accountSum,
                  ),
                  textScaleFactor: 2.5,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
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
    },
  );
}
