import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:wiser/core/constant/core_constant.dart';
import 'package:wiser/core/helper/core_converted_background_color_helper.dart';
import 'package:wiser/core/helper/core_converted_icon_data_helper.dart';

import 'package:wiser/core/widgets/core_loading_animation_widget.dart';
import 'package:wiser/features/record/view/new_record_view.dart';

class RecordShowSelectAccountDialogWidget extends ConsumerStatefulWidget {
  const RecordShowSelectAccountDialogWidget({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _NewAccountDialogContentState();
}

class _NewAccountDialogContentState
    extends ConsumerState<RecordShowSelectAccountDialogWidget> {
  final Stream<QuerySnapshot> accountStream = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('accounts')
      .orderBy('account-create-date', descending: false)
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: StreamBuilder<QuerySnapshot>(
        stream: accountStream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return coreLoadingAnimationWidget();
          }

          final accountData = snapshot.data!.docs;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Select Account',
                  textScaleFactor: 1.1,
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: accountData.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: InkWell(
                        onTap: () {
                          ref
                              .read(selectedAccountNameStateProvider.notifier)
                              .update((state) =>
                                  accountData[index]['account-name']);
                          ref
                              .read(
                                  selectedAccountIconDataStateProvider.notifier)
                              .update((state) => accountData[index]
                                  ['account-icon-code-point']);
                          ref
                              .read(selectedAccountColorStateProvider.notifier)
                              .update(
                                (state) => Color(
                                  int.parse(
                                    accountData[index]
                                            ['account-background-color']
                                        .toString()
                                        .split('Color(')[1]
                                        .split(')')[0],
                                  ),
                                ),
                              );
                          Navigator.pop(context);
                        },
                        borderRadius: BorderRadius.circular(5),
                        child: Container(
                          height: 80,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: coreConvertedBackgroundColorHelper(
                              snapshotData: accountData,
                              snapshotFieldName: 'account-background-color',
                              index: index,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      coreConvertedIconDataHelper(
                                        snapshotData: accountData,
                                        snapshotFieldName:
                                            'account-icon-code-point',
                                        index: index,
                                      ),
                                      size: 30,
                                      color: CoreConstant.colorWhite,
                                    ),
                                    Text(
                                      accountData[index]['account-name'],
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: CoreConstant.colorWhite,
                                        fontWeight: FontWeight.w600,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Account balance',
                                      textScaleFactor: 0.7,
                                      style: TextStyle(
                                        color: CoreConstant.colorWhite,
                                      ),
                                    ),
                                    Text(
                                      NumberFormat.currency(
                                        locale: 'en_ph',
                                        symbol: '₱',
                                      ).format(accountData[index]
                                          ['account-initial-amount']),
                                      textScaleFactor: 1.3,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: CoreConstant.colorWhite,
                                        fontWeight: FontWeight.w600,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
