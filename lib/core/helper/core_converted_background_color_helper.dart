import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Color coreConvertedBackgroundColorHelper({
  required List<QueryDocumentSnapshot<Object?>> snapshotData,
  required String snapshotFieldName,
  required int index,
}) {
  return Color(
    int.parse(
      snapshotData[index][snapshotFieldName]
          .toString()
          .split('Color(')[1]
          .split(')')[0],
    ),
  );
}
