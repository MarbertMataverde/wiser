import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wiser/features/record/view/new_record_view.dart';

TextButton coreNewRecordButtonWidget(BuildContext context) {
  return TextButton.icon(
    style: TextButton.styleFrom(
        backgroundColor: Theme.of(context).primaryColor.withAlpha(20)),
    onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const NewRecordView(),
        )),
    icon: const Icon(
      Iconsax.receipt_add,
      size: 20,
    ),
    label: const Text(
      'New Record',
      textScaleFactor: 0.9,
    ),
  );
}
