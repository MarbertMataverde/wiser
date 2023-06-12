// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:wiser/core/constant/core_constant.dart';

import 'package:wiser/core/widgets/core_appbar_widget.dart';
import 'package:wiser/core/widgets/core_arrow_left_button_widget.dart';
import 'package:wiser/core/widgets/core_icon_button_widget.dart';
import 'package:wiser/core/widgets/core_textfield_widget.dart';

final isEditEnableStateProvider =
    StateProvider.autoDispose<bool>((ref) => false);

class AccountsEditAccountView extends ConsumerStatefulWidget {
  const AccountsEditAccountView({
    super.key,
    required this.accountName,
    required this.accountInitialAmount,
  });

  final String accountName;
  final int accountInitialAmount;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      AccountsEditAccountState();
}

class AccountsEditAccountState extends ConsumerState<AccountsEditAccountView> {
  late final TextEditingController accountUpdatedInitialAmount;
  late final TextEditingController accountUpdatedName;
  @override
  void initState() {
    super.initState();
    accountUpdatedInitialAmount = TextEditingController(
      text: NumberFormat.currency(
        locale: 'en_ph',
        symbol: '₱',
        decimalDigits: 0,
      ).format(widget.accountInitialAmount),
    );
    accountUpdatedName = TextEditingController(text: widget.accountName);
  }

  @override
  void dispose() {
    accountUpdatedInitialAmount.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: coreAppBarWidget(
        context: context,
        ref: ref,
        isWrapperAppbar: false,
        nonPageWrapperAppbarTitle: 'Account Details',
        leadingWidget: coreArrowLeftButtonWidget(context),
        customActions: [
          coreIconButtonWidget(
            iconData: ref.watch(isEditEnableStateProvider)
                ? Iconsax.edit
                : Iconsax.edit_2,
            iconColor: ref.watch(isEditEnableStateProvider)
                ? CoreConstant.greenColor
                : CoreConstant.primaryTextColor,
            actionsOnPressed: () => ref
                .read(isEditEnableStateProvider.notifier)
                .update((state) => !ref.read(isEditEnableStateProvider)),
          ),
        ],
      ),
      body: Padding(
        padding: CoreConstant.pagePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Account Name'),
            coreTextFormFieldWidget(
              context: context,
              isEnabled: ref.watch(isEditEnableStateProvider),
              controller: accountUpdatedName,
              keyboardType: TextInputType.text,
              isHintCentered: true,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text('Account Balance'),
            coreTextFormFieldWidget(
              context: context,
              isEnabled: ref.watch(isEditEnableStateProvider),
              controller: accountUpdatedInitialAmount,
              keyboardType: TextInputType.number,
              isHintCentered: true,
              inputFormater: <TextInputFormatter>[
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
    );
  }
}
