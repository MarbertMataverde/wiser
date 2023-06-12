import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:wiser/core/constant/core_constant.dart';
import 'package:wiser/core/helper/core_amount_formatter_helper.dart';
import 'package:wiser/core/validator/validator.dart';
import 'package:wiser/core/widgets/core_appbar_widget.dart';
import 'package:wiser/core/widgets/core_arrow_left_button_widget.dart';
import 'package:wiser/core/widgets/core_button_widget.dart';
import 'package:wiser/core/widgets/core_textfield_widget.dart';
import 'package:wiser/features/record/services/add_new_record_services.dart';
import 'package:wiser/features/record/view/category_view.dart';
import 'package:wiser/features/record/widgets/record_card_button_widget.dart';
import 'package:wiser/features/record/widgets/record_date_picker_theme_widget.dart';
import 'package:wiser/features/record/widgets/record_show_select_account_dialog_widget.dart';
import 'package:wiser/features/record/widgets/record_transaction_type_bar_widget.dart';

final isIncomeStateProvider = StateProvider.autoDispose<bool>((ref) => true);

// category
final selectedCategoryTitleStateProvider =
    StateProvider.autoDispose<String>((ref) => 'Category');

final selectedCategoryIconDataStateProvider =
    StateProvider.autoDispose<IconData>((ref) => Iconsax.category_2);

final selectedCategoryColorStateProvider =
    StateProvider.autoDispose<Color>((ref) => CoreConstant.secondaryTextColor);

// account
final selectedAccountNameStateProvider =
    StateProvider.autoDispose<String>((ref) => 'Cash');

final selectedAccountIconDataStateProvider =
    StateProvider.autoDispose<int>((ref) => 60473); // icon data CodePoint

final selectedAccountColorStateProvider =
    StateProvider.autoDispose<Color>((ref) => CoreConstant.accountCashColor);

// date and time
final selectedDateStateProvider =
    StateProvider.autoDispose<DateTime?>((ref) => DateTime.now());

class NewRecordView extends ConsumerStatefulWidget {
  const NewRecordView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NewRecordState();
}

class _NewRecordState extends ConsumerState<NewRecordView> {
  // Used EneftyIcons as icon for category
  final kFontFam = 'EneftyIcons';
  final String kFontPkg = 'enefty_icons';
  late final TextEditingController amount;
  late final TextEditingController notes;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    amount = TextEditingController();
    notes = TextEditingController();
  }

  @override
  void dispose() {
    amount.dispose();
    notes.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: coreAppBarWidget(
        ref: ref,
        context: context,
        isWrapperAppbar: false,
        nonPageWrapperAppbarTitle: 'New Record',
        leadingWidget: coreArrowLeftButtonWidget(context),
        actionsOnPressed: () => Navigator.pop(context),
      ),
      body: SafeArea(
        child: Padding(
          padding: CoreConstant.pageWithoutBottomPadding,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                recordTransactionTypeBarWidget(ref: ref),
                const SizedBox(
                  height: 20,
                ),
                Form(
                  key: _formKey,
                  child: coreTextFormFieldWidget(
                    context: context,
                    hintText: 'Amount',
                    validator: (value) => newTransactionAmountValidator(value),
                    controller: amount,
                    isHintCentered: true,
                    keyboardType: TextInputType.number,
                    customCursorColor: ref.watch(isIncomeStateProvider)
                        ? CoreConstant.greenColor
                        : CoreConstant.redColor,
                    customHintColor: ref.watch(isIncomeStateProvider)
                        ? CoreConstant.greenColor
                        : CoreConstant.redColor,
                    customTextStyle: TextStyle(
                      color: ref.watch(isIncomeStateProvider)
                          ? CoreConstant.greenColor
                          : CoreConstant.redColor,
                      fontWeight: FontWeight.w500,
                    ),
                    inputFormater: [
                      FilteringTextInputFormatter.digitsOnly,
                      CurrencyTextInputFormatter(
                        locale: 'en_ph',
                        decimalDigits: 0,
                        symbol: '₱',
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                recordCardButtonWidget(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CategoryListView(),
                    ),
                  ),
                  iconBackgroundColor:
                      ref.watch(selectedCategoryColorStateProvider),
                  title: ref.watch(selectedCategoryTitleStateProvider),
                  iconData: ref.watch(selectedCategoryIconDataStateProvider),
                ),
                const SizedBox(
                  height: 10,
                ),
                recordCardButtonWidget(
                  onTap: () => showDialog(
                      context: context,
                      builder: (context) =>
                          const RecordShowSelectAccountDialogWidget()),
                  title: ref.watch(selectedAccountNameStateProvider),
                  iconData: IconData(
                    ref.watch(selectedAccountIconDataStateProvider),
                    fontFamily: kFontFam,
                    fontPackage: kFontPkg,
                  ),
                  iconBackgroundColor:
                      ref.watch(selectedAccountColorStateProvider),
                ),
                const SizedBox(
                  height: 10,
                ),
                recordCardButtonWidget(
                  onTap: () async {
                    DateTime? selectedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2050),
                      confirmText: 'DONE',
                      builder: (context, child) => datePickerTheme(
                        context: context,
                        ref: ref,
                        child: child!,
                      ),
                    );
                    if (selectedDate != null) {
                      ref
                          .read(selectedDateStateProvider.notifier)
                          .update((state) => selectedDate);
                    }
                  },
                  title: DateFormat.yMMMMd().format(ref
                              .watch(selectedDateStateProvider) as DateTime) ==
                          DateFormat.yMMMMd().format(DateTime.now())
                      ? 'Today'
                      : DateFormat.MMMMd().format(
                          ref.watch(selectedDateStateProvider) as DateTime),
                  iconData: Iconsax.calendar_1,
                  iconBackgroundColor: ref.watch(isIncomeStateProvider)
                      ? CoreConstant.greenColor
                      : CoreConstant.redColor,
                ),
                const SizedBox(
                  height: 10,
                ),
                coreTextFormFieldWidget(
                  context: context,
                  hintText: 'Notes',
                  controller: notes,
                  customMaxLine: 4,
                  keyboardType: TextInputType.text,
                  customCursorColor: CoreConstant.primaryTextColor,
                  customHintColor: CoreConstant.secondaryTextColor,
                  customTextStyle: const TextStyle(
                    color: CoreConstant.primaryTextColor,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                coreButtonWidget(
                  context: context,
                  label: ref.watch(isIncomeStateProvider)
                      ? 'Record Income'
                      : 'Record Expense',
                  customBackgroundColor: ref.watch(isIncomeStateProvider)
                      ? CoreConstant.greenColor
                      : CoreConstant.redColor,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (ref.watch(selectedCategoryTitleStateProvider) ==
                          'Category') {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Theme.of(context).primaryColor,
                            behavior: SnackBarBehavior.floating,
                            content: const Text('Please select category'),
                          ),
                        );
                      } else {
                        newRecord(
                          context: context,
                          recordType: ref.read(isIncomeStateProvider)
                              ? 'Income'
                              : 'Expense',
                          recordAmount: coreAmountFormatterHelper(
                              textEditingController: amount),
                          recordCategoryName:
                              ref.read(selectedCategoryTitleStateProvider),
                          recordAccountName:
                              ref.read(selectedAccountNameStateProvider),
                          recordCategoryIconCodePoint: ref
                              .read(selectedCategoryIconDataStateProvider)
                              .codePoint,
                          recordCategoryIconBackgroundColor: ref
                              .read(selectedCategoryColorStateProvider)
                              .toString(),
                          recordDate: Timestamp.fromDate(
                              ref.read(selectedDateStateProvider) as DateTime),
                          recordTime: Timestamp.now(),
                          notes: notes.text,
                        );
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
