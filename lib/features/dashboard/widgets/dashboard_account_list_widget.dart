import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:wiser/core/constant/core_constant.dart';
import 'package:wiser/core/helper/core_converted_background_color_helper.dart';
import 'package:wiser/core/helper/core_converted_icon_data_helper.dart';
import 'package:wiser/core/widgets/core_loading_animation_widget.dart';

dashboardAccountListWidget({
  required WidgetRef ref,
  required Stream<QuerySnapshot<Object?>>? accountStream,
}) {
  return StreamBuilder<QuerySnapshot>(
    stream: accountStream,
    builder: (context, snapshot) {
      if (snapshot.hasError) {
        return const Text('Something went wrong');
      }

      if (snapshot.connectionState == ConnectionState.waiting) {
        return coreLoadingAnimationWidget();
      }
      final accountData = snapshot.data!.docs;

      return SizedBox(
        height: 70,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: accountData.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {},
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Card(
                  color: coreConvertedBackgroundColorHelper(
                    snapshotData: accountData,
                    snapshotFieldName: 'account-background-color',
                    index: index,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        coreConvertedIconDataHelper(
                          snapshotData: accountData,
                          snapshotFieldName: 'account-icon-code-point',
                          index: index,
                        ),
                        color: CoreConstant.colorWhite,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 100,
                            child: Text(
                              accountData[index]['account-name'],
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: CoreConstant.colorWhite,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 100,
                            child: Text(
                              NumberFormat.currency(
                                locale: 'en_ph',
                                symbol: '₱',
                              ).format(
                                accountData[index]['account-initial-amount'],
                              ),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: CoreConstant.colorWhite,
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      );
    },
  );
}
