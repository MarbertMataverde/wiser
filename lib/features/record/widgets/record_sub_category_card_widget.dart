import 'package:flutter/material.dart';
import 'package:wiser/features/record/widgets/record_card_button_widget.dart';

Padding recordSubCategoryCardWidget({
  required Function()? onTap,
  required String title,
  required iconBackgroundColor,
  required IconData iconData,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
    child: recordCardButtonWidget(
      onTap: onTap,
      iconData: iconData,
      title: title,
      iconBackgroundColor: iconBackgroundColor,
    ),
  );
}
