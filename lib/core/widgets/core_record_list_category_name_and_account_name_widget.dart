import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wiser/core/constant/core_constant.dart';

Expanded coreRecordListCategoryNameAndAccountNameWidget(
    {required List<QueryDocumentSnapshot<Object?>> recordData,
    required int index}) {
  return Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          recordData[index]['record-category-name'],
          textAlign: TextAlign.start,
          maxLines: 1,
          softWrap: false,
          overflow: TextOverflow.clip,
        ),
        Text(
          recordData[index]['record-account-name'],
          textScaleFactor: 0.7,
          textAlign: TextAlign.start,
          maxLines: 1,
          softWrap: false,
          overflow: TextOverflow.clip,
          style: const TextStyle(
            color: CoreConstant.secondaryTextColor,
          ),
        ),
      ],
    ),
  );
}
