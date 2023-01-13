import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wiser/core/constant/core_constant.dart';
import 'package:wiser/core/helper/core_converted_background_color_helper.dart';
import 'package:wiser/core/helper/core_converted_icon_data_helper.dart';

ClipRRect coreRecordListCategoryIconBoxWidget(
    {required List<QueryDocumentSnapshot<Object?>> recordData,
    required int index}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(5),
    child: Container(
      width: 50,
      height: 50,
      color: coreConvertedBackgroundColorHelper(
        snapshotData: recordData,
        snapshotFieldName: 'record-category-icon-background-color',
        index: index,
      ),
      child: Icon(
        coreConvertedIconDataHelper(
          snapshotData: recordData,
          snapshotFieldName: 'record-category-icon-code-point',
          fontFamily: 'FontAwesomeSolid',
          fontpackage: 'font_awesome_flutter',
          index: index,
        ),
        color: CoreConstant.colorWhite,
      ),
    ),
  );
}
