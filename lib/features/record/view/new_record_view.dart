import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wiser/core/constant/core_constant.dart';
import 'package:wiser/core/validator/validator.dart';
import 'package:wiser/core/widgets/core_appbar_widget.dart';
import 'package:wiser/core/widgets/core_button_widget.dart';
import 'package:wiser/core/widgets/core_icon_button_widget.dart';
import 'package:wiser/core/widgets/core_textfield_widget.dart';
import 'package:wiser/features/record/view/category_view.dart';

final isIncomeStateProvider = StateProvider.autoDispose<bool>((ref) => true);

final selectedCategoryTitleStateProvider =
    StateProvider.autoDispose<String>((ref) => 'Category');

final selectedCategoryIconDataStateProvider =
    StateProvider.autoDispose<IconData>((ref) => Iconsax.category_2);

final selectedCategoryColorStateProvider =
    StateProvider.autoDispose<Color>((ref) => CoreConstant.greyColor);

class NewRecordView extends ConsumerStatefulWidget {
  const NewRecordView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NewRecordState();
}

class _NewRecordState extends ConsumerState<NewRecordView> {
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
        leadingWidget: coreIconButtonWidget(
          actionsOnPressed: () => Navigator.pop(context),
          iconData: Iconsax.arrow_left,
        ),
        actionsOnPressed: () {},
      ),
      body: SafeArea(
        child: Padding(
          padding: CoreConstant.pageHorizontalPadding,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                transactionTypeBar(ref: ref),
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
                cardButton(
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
        color: CoreConstant.fillColor,
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
                      color: iconBackgroundColor ?? CoreConstant.greyColor,
                      child: Icon(
                        iconData,
                        color: CoreConstant.colorWhite,
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
                    ? CoreConstant.greenColor
                    : CoreConstant.greyColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(5),
                  bottomLeft: Radius.circular(5),
                )),
            child: Center(
              child: Text(
                'Income',
                style: TextStyle(
                  color: ref.watch(isIncomeStateProvider)
                      ? CoreConstant.colorWhite
                      : CoreConstant.bodyColor,
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
                  ? CoreConstant.greyColor
                  : CoreConstant.redColor,
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
                      ? CoreConstant.bodyColor
                      : CoreConstant.colorWhite,
                ),
              ),
            ),
          ),
        ),
      )
    ],
  );
}
