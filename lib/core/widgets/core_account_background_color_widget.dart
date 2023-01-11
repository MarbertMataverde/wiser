import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Color accountBackgroundColoWidget({
  required List<QueryDocumentSnapshot<Object?>> accountData,
  required int index,
}) {
  return Color(
    int.parse(
      accountData[index]['account-background-color']
          .toString()
          .split('Color(')[1]
          .split(')')[0],
    ),
  );
}
