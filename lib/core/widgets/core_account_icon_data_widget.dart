import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

IconData accountIconDataWidget({
  required List<QueryDocumentSnapshot<Object?>> accountData,
  required int index,
}) {
  // Used EneftyIcons as icon for category
  const kFontFam = 'EneftyIcons';
  const String kFontPkg = 'enefty_icons';
  return IconData(
    accountData[index]['account-icon-code-point'],
    fontFamily: kFontFam,
    fontPackage: kFontPkg,
  );
}
