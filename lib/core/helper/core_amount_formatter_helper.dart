import 'package:flutter/material.dart';

int coreAmountFormatterHelper({
  required TextEditingController textEditingController,
}) {
  return int.parse(
    // this removes the peso sign and commas
    textEditingController.text.split('₱')[1].replaceAll(',', ''),
  );
}
