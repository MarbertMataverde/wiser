import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wiser/core/constant/core_constant.dart';
import 'package:wiser/core/helper/core_converted_background_color_helper.dart';
import 'package:wiser/core/helper/core_converted_icon_data_helper.dart';
import 'package:wiser/core/widgets/core_loading_animation_widget.dart';

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
        return ListView.builder(
          itemCount: recordData.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {},
              child: SizedBox(
                width: double.infinity,
                height: 80,
                child: Card(
                  elevation: 0,
                  color: CoreConstant.fillColor,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Container(
                                color: coreConvertedBackgroundColorHelper(
                                  snapshotData: recordData,
                                  snapshotFieldName:
                                      'record-category-icon-background-color',
                                  index: index,
                                ),
                                height: 40,
                                width: 40,
                                child: Icon(
                                  coreConvertedIconDataHelper(
                                    snapshotData: recordData,
                                    snapshotFieldName:
                                        'record-category-icon-code-point',
                                    fontFamily: 'FontAwesomeSolid',
                                    fontpackage: 'font_awesome_flutter',
                                    index: index,
                                  ),
                                  color: CoreConstant.colorWhite,
                                ),
                              ),
                            ),

                            // title
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: Text(
                                recordData[index]['record-category-name'],
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ],
                        ),
                        // category icon

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // amount
                            Text(
                              '${recordData[index]['record-type'] == 'Income' ? '+' : '-'}${NumberFormat.currency(
                                locale: 'en_ph',
                                symbol: '₱',
                                decimalDigits: 0,
                              ).format(
                                recordData[index]['record-amount'],
                              )}',
                              textAlign: TextAlign.end,
                              maxLines: 1,
                              style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.w500,
                                color:
                                    recordData[index]['record-type'] == 'Income'
                                        ? CoreConstant.greenColor
                                        : CoreConstant.redColor,
                              ),
                            ),
                            // date
                            Text(
                              DateFormat.MMMMd().format(
                                        (recordData[index]['record-date']
                                                as Timestamp)
                                            .toDate(),
                                      ) ==
                                      DateFormat.MMMMd().format(DateTime.now())
                                  ? 'Today'
                                  : DateFormat.MMMMd().format(
                                      (recordData[index]['record-date']
                                              as Timestamp)
                                          .toDate(),
                                    ),
                              textScaleFactor: 0.6,
                              style: const TextStyle(
                                color: CoreConstant.greyColor,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    ),
  );
}
