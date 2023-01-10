import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wiser/core/constant/core_constant.dart';
import 'package:wiser/features/accounts/icons/accounts_pick_icon.dart';
import 'package:wiser/features/accounts/widgets/accounts_new_account_dialog_widget.dart';

class AccountsView extends ConsumerStatefulWidget {
  const AccountsView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AccountsViewState();
}

class _AccountsViewState extends ConsumerState<AccountsView> {
  late TextEditingController accountName;
  late TextEditingController accountInitalAmount;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    accountName = TextEditingController();
    accountInitalAmount = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Padding(
        padding: CoreConstant.pageHorizontalPadding,
        child: SafeArea(
          child: ListView.builder(
              itemCount: 10,
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
                        color: ref.watch(accountBackgroundColorStateProvider),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  ref.watch(accountIconDataStateProvider),
                                  size: 30,
                                  color: CoreConstant.colorWhite,
                                ),
                                const Text(
                                  'Investment',
                                  style: TextStyle(
                                    color: CoreConstant.colorWhite,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  'Account balance',
                                  textScaleFactor: 0.7,
                                  style: TextStyle(
                                    color: CoreConstant.colorWhite,
                                  ),
                                ),
                                Text(
                                  '₱ 2,499',
                                  textScaleFactor: 1.3,
                                  style: TextStyle(
                                    color: CoreConstant.colorWhite,
                                    fontWeight: FontWeight.w600,
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
              }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        child: const Icon(Iconsax.card_add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => NewAccountDialogContent(
              formKey: _formKey,
              accountName: accountName,
              accountInitalAmount: accountInitalAmount,
            ),
          );
        },
      ),
    );
  }
}
