import 'dart:math';

import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wiser/core/constant/core_constant.dart';
import 'package:wiser/core/validator/validator.dart';
import 'package:wiser/core/widgets/core_button_widget.dart';
import 'package:wiser/core/widgets/core_loading_animation_widget.dart';
import 'package:wiser/core/widgets/core_textfield_widget.dart';
import 'package:wiser/features/accounts/icons/accounts_pick_icon.dart';
import 'package:wiser/features/accounts/services/new_account_services.dart';

final accountBackgroundColorStateProvider = StateProvider.autoDispose<Color?>(
    (ref) => CoreConstant.categoryColorList[
        Random().nextInt(CoreConstant.categoryColorList.length)]);

final isAddingNewAccountStateProvider = StateProvider<bool>((ref) => false);

class NewAccountDialogContent extends ConsumerStatefulWidget {
  const NewAccountDialogContent({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _NewAccountDialogContentState();
}

class _NewAccountDialogContentState
    extends ConsumerState<NewAccountDialogContent> {
  late TextEditingController accountName;
  late TextEditingController accountInitalAmount;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    accountName = TextEditingController();
    accountInitalAmount = TextEditingController();
  }

  @override
  void dispose() {
    accountName.dispose();
    accountInitalAmount.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Acount Details',
              textScaleFactor: 1.1,
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            Form(
              key: formKey,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text('Select Account Icon'),
                      Card(
                        color: ref.watch(accountBackgroundColorStateProvider),
                        child: IconButton(
                          onPressed: () =>
                              pickAccountIcon(ref: ref, context: context),
                          icon: Icon(
                            ref.watch(accountIconDataStateProvider),
                            color: CoreConstant.colorWhite,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor:
                            ref.watch(accountBackgroundColorStateProvider),
                      ),
                      child: const Text(
                        'Select Background Color',
                        style: TextStyle(color: CoreConstant.colorWhite),
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => Dialog(
                            backgroundColor:
                                CoreConstant.scaffoldBackgroundColor,
                            child: ListView.builder(
                              itemCount: CoreConstant.categoryColorList.length,
                              itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.all(5),
                                child: InkWell(
                                  onTap: () {
                                    ref
                                        .read(
                                            accountBackgroundColorStateProvider
                                                .notifier)
                                        .update(
                                          (state) => CoreConstant
                                              .categoryColorList[index],
                                        );
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color:
                                          CoreConstant.categoryColorList[index],
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  coreTextFormFieldWidget(
                    context: context,
                    hintText: 'Account Name',
                    controller: accountName,
                    customCursorColor: CoreConstant.bodyColor,
                    customHintColor: CoreConstant.greyColor,
                    customTextStyle: const TextStyle(
                      color: CoreConstant.bodyColor,
                    ),
                    validator: (value) => newAccountNameValidator(value),
                  ),
                  const SizedBox(height: 10),
                  coreTextFormFieldWidget(
                    context: context,
                    hintText: 'Inital Amount',
                    controller: accountInitalAmount,
                    customCursorColor: CoreConstant.bodyColor,
                    customHintColor: CoreConstant.greyColor,
                    keyboardType: TextInputType.number,
                    customTextStyle: const TextStyle(
                      color: CoreConstant.bodyColor,
                    ),
                    validator: (value) => newAccountInitalValueValidator(value),
                    inputFormater: [
                      FilteringTextInputFormatter.digitsOnly,
                      CurrencyTextInputFormatter(
                        locale: 'en_ph',
                        decimalDigits: 0,
                        symbol: '₱',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Visibility(
              visible: !ref.watch(isAddingNewAccountStateProvider),
              replacement: coreLoadingAnimationWidget(),
              child: coreButtonWidget(
                  context: context,
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      ref
                          .read(isAddingNewAccountStateProvider.notifier)
                          .update((state) => true);
                      await newAccount(
                        context: context,
                        currentUserUid: FirebaseAuth.instance.currentUser!.uid,
                        accountBackgroundColor: ref
                            .read(accountBackgroundColorStateProvider)
                            .toString(),
                        accountIconCodePoint:
                            ref.read(accountIconDataStateProvider)!.codePoint,
                        accountName: accountName.text,
                        accountInitalAmount: int.parse(
                          // this removes the peso sign and commas
                          accountInitalAmount.text
                              .split('₱')[1]
                              .replaceAll(',', ''),
                        ),
                      );
                    }
                    ref
                        .read(isAddingNewAccountStateProvider.notifier)
                        .update((state) => false);
                  },
                  label: 'Add'),
            )
          ],
        ),
      ),
    );
  }
}
