import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<void> newRecord({
  required BuildContext context,
  required String recordType,
  required int recordAmount,
  required String recordCategoryName,
  required int recordIconCodePoint,
  required String recordIconBackgroundColor,
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
    'record-icon-code-point': recordIconCodePoint,
    'record-icon-background-color': recordIconBackgroundColor,
    'record-date': recordDate,
    'record-time': recordTime,
    'record-notes': notes,
  }).then((value) => Navigator.pop(context));
}
