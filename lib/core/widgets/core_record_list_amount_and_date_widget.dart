import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wiser/core/constant/core_constant.dart';

Column coreRecordListAmountAndDateWidget(
    {required List<QueryDocumentSnapshot<Object?>> recordData,
    required int index}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        '${recordData[index]['record-type'] == 'Income' ? '+' : '-'}${NumberFormat.currency(
          locale: 'en_ph',
          symbol: '₱',
          decimalDigits: 0,
        ).format(
          recordData[index]['record-amount'],
        )}',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.end,
        softWrap: false,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: recordData[index]['record-type'] == 'Income'
              ? CoreConstant.greenColor
              : CoreConstant.redColor,
        ),
      ),
      Text(
        DateFormat.MMMMd().format(
                  (recordData[index]['record-date'] as Timestamp).toDate(),
                ) ==
                DateFormat.MMMMd().format(DateTime.now())
            ? 'Today'
            : DateFormat.MMMMd().format(
                (recordData[index]['record-date'] as Timestamp).toDate(),
              ),
        textScaleFactor: 0.7,
        style: const TextStyle(
          color: CoreConstant.greyColor,
        ),
      ),
    ],
  );
}
