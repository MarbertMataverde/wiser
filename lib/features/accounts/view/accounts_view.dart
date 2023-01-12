import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:wiser/core/constant/core_constant.dart';
import 'package:wiser/core/helper/core_converted_background_color_helper.dart';
import 'package:wiser/core/helper/core_converted_icon_data_helper.dart';
import 'package:wiser/core/widgets/core_loading_animation_widget.dart';
import 'package:wiser/features/accounts/widgets/accounts_new_account_dialog_widget.dart';

class AccountsView extends ConsumerStatefulWidget {
  const AccountsView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AccountsViewState();
}

class _AccountsViewState extends ConsumerState<AccountsView> {
  final Stream<QuerySnapshot> accountStream = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('accounts')
      .orderBy('account-create-date', descending: false)
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Padding(
        padding: CoreConstant.pageHorizontalPadding,
        child: SafeArea(
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
              return ListView.builder(
                itemCount: accountData.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(5),
                      child: Container(
                        height: 100,
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
                                        index: index),
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
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        child: const Icon(Iconsax.card_add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => const NewAccountDialogContent(),
          );
        },
      ),
    );
  }
}
