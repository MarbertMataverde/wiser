import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wiser/core/constant/core_constant.dart';
import 'package:wiser/core/validator/validator.dart';
import 'package:wiser/core/widgets/core_button_widget.dart';
import 'package:wiser/core/widgets/core_textfield_widget.dart';
import 'package:wiser/features/accounts/icons/accounts_pick_icon.dart';

class NewAccountDialogContent extends ConsumerStatefulWidget {
  const NewAccountDialogContent({
    Key? key,
    required GlobalKey<FormState> formKey,
    required this.accountName,
    required this.accountInitalAmount,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final TextEditingController accountName;
  final TextEditingController accountInitalAmount;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _NewAccountDialogContentState();
}

class _NewAccountDialogContentState
    extends ConsumerState<NewAccountDialogContent> {
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
              key: widget._formKey,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text('Select Account Icon'),
                      Card(
                        color: CoreConstant.primaryColor,
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
                  const SizedBox(height: 10),
                  coreTextFormFieldWidget(
                    context: context,
                    hintText: 'Account Name',
                    controller: widget.accountName,
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
                    controller: widget.accountInitalAmount,
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
            coreButtonWidget(
                context: context,
                onPressed: () {
                  if (widget._formKey.currentState!.validate()) {
                    // function
                  }
                },
                label: 'Add')
          ],
        ),
      ),
    );
  }
}
