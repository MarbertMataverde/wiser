import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wiser/core/constant/core_constant.dart';
import 'package:wiser/core/widgets/core_loading_animation_widget.dart';
import 'package:wiser/core/widgets/core_record_list_amount_and_date_widget.dart';
import 'package:wiser/core/widgets/core_record_list_category_icon_box_widget.dart';
import 'package:wiser/core/widgets/core_record_list_category_name_and_account_name_widget.dart';
import 'package:wiser/features/dashboard/widgets/dashboard_record_list_replacement_widget.dart';

Expanded dashboardRecordListWidget() {
  final Stream<QuerySnapshot> recordStream = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('records')
      .orderBy('record-time', descending: true)
      .snapshots();
  return Expanded(
    child: StreamBuilder<QuerySnapshot>(
      stream: recordStream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return coreLoadingAnimationWidget();
        }

        final recordData = snapshot.data!.docs;
        return Visibility(
          visible: recordData.isNotEmpty,
          replacement: dashboardRecordListReplacement(),
          child: ListView.builder(
            itemCount: recordData.length,
            itemBuilder: (context, index) => Card(
              elevation: 0,
              color: CoreConstant.fillColor,
              child: SizedBox(
                width: double.infinity,
                height: 80,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      coreRecordListCategoryIconBoxWidget(
                          recordData: recordData, index: index),
                      const SizedBox(width: 10),
                      coreRecordListCategoryNameAndAccountNameWidget(
                          recordData: recordData, index: index),
                      const SizedBox(width: 10),
                      coreRecordListAmountAndDateWidget(
                          recordData: recordData, index: index),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    ),
  );
}
