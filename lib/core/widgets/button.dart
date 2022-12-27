import 'package:flutter/material.dart';
import 'package:wiser/core/constant.dart';

Align button({
  required BuildContext context,
  required Function()? onPressed,
  required String label,
}) {
  return Align(
    alignment: Alignment.center,
    child: SizedBox(
      width: double.infinity,
      height: 50,
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          overlayColor: MaterialStateColor.resolveWith(
              (states) => Constant.fillColor.withOpacity(0.10)),
          backgroundColor: MaterialStateColor.resolveWith(
              (states) => Theme.of(context).primaryColor),
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: Constant.colorWhite,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}
