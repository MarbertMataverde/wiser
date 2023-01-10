import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

Future<void> newAccount({
  required BuildContext context,
  required String currentUserUid,
  required String accountBackgroundColor,
  required int accountIconCodePoint,
  required String accountName,
  required int accountInitalAmount,
}) async {
  await FirebaseFirestore.instance
      .collection('users')
      .doc(currentUserUid)
      .collection('accounts')
      .doc()
      .set({
    'account-name': accountName,
    'account-initial-amount': accountInitalAmount,
    'account-icon-code-point': accountIconCodePoint,
    'account-background-color': accountBackgroundColor,
    'account-create-date': Timestamp.now(),
  }).whenComplete(() => Navigator.pop(context));
}
