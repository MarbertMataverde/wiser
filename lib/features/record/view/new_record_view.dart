import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wiser/core/constant/core_constant.dart';
import 'package:wiser/core/validator/validator.dart';
import 'package:wiser/core/widgets/core_appbar_widget.dart';
import 'package:wiser/core/widgets/core_arrow_left_button_widget.dart';
import 'package:wiser/core/widgets/core_button_widget.dart';
import 'package:wiser/core/widgets/core_textfield_widget.dart';
import 'package:wiser/features/record/view/category_view.dart';
import 'package:wiser/features/record/widgets/record_card_button_widget.dart';
import 'package:wiser/features/record/widgets/record_show_select_account_dialog_widget.dart';
import 'package:wiser/features/record/widgets/record_transaction_type_bar_widget.dart';

final isIncomeStateProvider = StateProvider.autoDispose<bool>((ref) => true);

// category
final selectedCategoryTitleStateProvider =
    StateProvider.autoDispose<String>((ref) => 'Category');

final selectedCategoryIconDataStateProvider =
    StateProvider.autoDispose<IconData>((ref) => Iconsax.category_2);

final selectedCategoryColorStateProvider =
    StateProvider.autoDispose<Color>((ref) => CoreConstant.greyColor);

// account
final selectedAccountNameStateProvider =
    StateProvider.autoDispose<String>((ref) => 'Cash');

final selectedAccountIconDataStateProvider =
    StateProvider.autoDispose<int>((ref) => 60473); // icon data CodePoint

final selectedAccountColorStateProvider =
    StateProvider.autoDispose<Color>((ref) => CoreConstant.greyColor);

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
                  onTap: () {},
                  title: 'Today',
                  iconData: Iconsax.calendar_1,
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
                  customCursorColor: CoreConstant.bodyColor,
                  customHintColor: CoreConstant.greyColor,
                  customTextStyle: const TextStyle(
                    color: CoreConstant.bodyColor,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                coreButtonWidget(
                    context: context, onPressed: () {}, label: 'Add'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Color(
//     int.parse(
//       accountData[index]['account-background-color']
//           .toString()
//           .split('Color(')[1]
//           .split(')')[0],
//     ),
//   );