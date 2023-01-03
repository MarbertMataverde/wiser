import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wiser/core/constant.dart';
import 'package:wiser/core/validator/validator.dart';
import 'package:wiser/core/widgets/button.dart';
import 'package:wiser/core/widgets/textfield.dart';
import 'package:wiser/features/record/view/view_category.dart';

final isIncomeStateProvider = StateProvider((ref) => true);

final selectedCategoryTitleStateProvider =
    StateProvider<String>((ref) => 'Category');

final selectedCategoryIconDataStateProvider =
    StateProvider<IconData>((ref) => Iconsax.category_2);

final selectedCategoryColorStateProvider =
    StateProvider<Color>((ref) => Constant.greyColor);

class NewRecord extends ConsumerStatefulWidget {
  const NewRecord({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NewRecordState();
}

class _NewRecordState extends ConsumerState<NewRecord> {
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () {
                      invalidateAllSelectedCategoryStateProvider(ref: ref);
                      Navigator.pop(context);
                    },
                    child: const Icon(Iconsax.close_circle),
                  ),
                ),
                const Text(
                  'New Record',
                  textScaleFactor: 1.5,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Select record type',
                  textScaleFactor: 0.9,
                ),
                transactionTypeBar(ref: ref),
                const SizedBox(
                  height: 20,
                ),
                Form(
                  key: _formKey,
                  child: textFormField(
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
                cardButton(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CategoryList(),
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
                cardButton(
                  onTap: () {},
                  title: 'Cash',
                  iconData: Iconsax.card_coin,
                ),
                const SizedBox(
                  height: 10,
                ),
                cardButton(
                  onTap: () {},
                  title: 'Today',
                  iconData: Iconsax.calendar_1,
                ),
                const SizedBox(
                  height: 10,
                ),
                textFormField(
                  context: context,
                  hintText: 'Notes',
                  controller: notes,
                  customMaxLine: 4,
                  keyboardType: TextInputType.text,
                  customCursorColor: Constant.bodyColor,
                  customHintColor: Constant.greyColor,
                  customTextStyle: const TextStyle(
                    color: Constant.bodyColor,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                button(context: context, onPressed: () {}, label: 'Add'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

InkWell cardButton({
  required Function()? onTap,
  required IconData iconData,
  required String title,
  Color? iconBackgroundColor,
  bool isHasPrefixIcon = false,
  bool isExpanded = false,
  Function()? expandIconOnPressed,
}) {
  return InkWell(
    onTap: onTap,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Container(
        height: 70,
        width: double.infinity,
        color: Constant.fillColor,
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
                      height: 40,
                      width: 40,
                      color: iconBackgroundColor ?? Constant.greyColor,
                      child: Icon(
                        iconData,
                        color: Constant.colorWhite,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Visibility(
                visible: isHasPrefixIcon,
                child: IconButton(
                  splashRadius: 24,
                  onPressed: expandIconOnPressed ?? () {},
                  icon: Icon(
                    isExpanded ? Iconsax.arrow_up_2 : Iconsax.arrow_down_1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Row transactionTypeBar({
  required WidgetRef ref,
}) {
  return Row(
    children: [
      Expanded(
        flex: ref.watch(isIncomeStateProvider) ? 2 : 1,
        child: GestureDetector(
          onTap: () =>
              ref.read(isIncomeStateProvider.notifier).update((state) => true),
          child: AnimatedContainer(
            duration: const Duration(seconds: 1),
            curve: Curves.decelerate,
            height: 50,
            decoration: BoxDecoration(
                color: ref.watch(isIncomeStateProvider)
                    ? Constant.greenColor
                    : Constant.greyColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(5),
                  bottomLeft: Radius.circular(5),
                )),
            child: Center(
              child: Text(
                'Income',
                style: TextStyle(
                  color: ref.watch(isIncomeStateProvider)
                      ? Constant.colorWhite
                      : Constant.bodyColor,
                ),
              ),
            ),
          ),
        ),
      ),
      Expanded(
        flex: ref.watch(isIncomeStateProvider) ? 1 : 2,
        child: GestureDetector(
          onTap: () =>
              ref.read(isIncomeStateProvider.notifier).update((state) => false),
          child: AnimatedContainer(
            duration: const Duration(seconds: 1),
            curve: Curves.decelerate,
            height: 50,
            decoration: BoxDecoration(
              color: ref.watch(isIncomeStateProvider)
                  ? Constant.greyColor
                  : Constant.redColor,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(5),
                bottomRight: Radius.circular(5),
              ),
            ),
            child: Center(
              child: Text(
                'Expense',
                style: TextStyle(
                  color: ref.watch(isIncomeStateProvider)
                      ? Constant.bodyColor
                      : Constant.colorWhite,
                ),
              ),
            ),
          ),
        ),
      )
    ],
  );
}

invalidateAllSelectedCategoryStateProvider({required WidgetRef ref}) {
  ref.invalidate(selectedCategoryColorStateProvider);
  ref.invalidate(selectedCategoryIconDataStateProvider);
  ref.invalidate(selectedCategoryTitleStateProvider);
  ref.invalidate(isIncomeStateProvider);
}
