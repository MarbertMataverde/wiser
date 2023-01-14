import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<void> newRecord({
  required BuildContext context,
  required String recordType,
  required int recordAmount,
  required String recordCategoryName,
  required String recordAccountName,
  required int recordCategoryIconCodePoint,
  required String recordCategoryIconBackgroundColor,
  required Timestamp recordDate,
  required Timestamp recordTime,
  required String notes,
}) async {
  FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('records')
      .doc()
      .set({
    'record-type': recordType,
    'record-amount': recordAmount,
    'record-category-name': recordCategoryName,
    'record-account-name': recordAccountName,
    'record-category-icon-code-point': recordCategoryIconCodePoint,
    'record-category-icon-background-color': recordCategoryIconBackgroundColor,
    'record-date': recordDate,
    'record-time': recordTime,
    'record-notes': notes,
  }).then((value) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('accounts')
        .where('account-name', isEqualTo: recordAccountName)
        .get()
        .then((accountData) async {
      if (accountData.docs.isNotEmpty) {
        var recentAccountAmount = accountData.docs[0]['account-initial-amount'];
        int incomeCalculation =
            int.parse(recentAccountAmount.toString()) + recordAmount;
        int expenseCalculation =
            int.parse(recentAccountAmount.toString()) - recordAmount;
        for (var doc in accountData.docs) {
          doc.reference.update({
            'account-initial-amount':
                recordType == 'Income' ? incomeCalculation : expenseCalculation,
          });
        }
      }
    });
  });
}
