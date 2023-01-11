import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wiser/features/record/widgets/record_card_button_widget.dart';

Column recordCategoryCardWidget({
  required String title,
  required IconData iconData,
  required AutoDisposeStateProvider<bool> stateProvider,
  required WidgetRef ref,
  required List<Widget> subCategoryList,
  required Color iconBackgroundColor,
  required Function()? onTap,
}) {
  return Column(
    children: [
      recordCardButtonWidget(
        onTap: onTap,
        iconData: iconData,
        title: title,
        isHasPrefixIcon: true,
        iconBackgroundColor: iconBackgroundColor,
        isExpanded: ref.watch(stateProvider),
        expandIconOnPressed: () {
          ref.read(stateProvider.notifier).update(
                (state) => !ref.read(stateProvider),
              );
        },
      ),
      const SizedBox(
        height: 5,
      ),
      Visibility(
        visible: ref.watch(stateProvider),
        child: Column(
          children: subCategoryList,
        ),
      ),
    ],
  );
}
