import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

IconData coreConvertedIconDataHelper({
  required List<QueryDocumentSnapshot<Object?>> snapshotData,
  required String snapshotFieldName,
  required int index,
  String fontFamily = 'EneftyIcons',
  String fontpackage = 'enefty_icons',
}) {
  return IconData(
    snapshotData[index][snapshotFieldName],
    fontFamily: fontFamily,
    fontPackage: fontpackage,
  );
}
