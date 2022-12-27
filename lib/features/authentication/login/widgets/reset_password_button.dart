import 'package:flutter/material.dart';

GestureDetector resetPassword({
  required BuildContext context,
  required Function()? onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Align(
      alignment: Alignment.centerRight,
      child: Text(
        'Reset Password',
        textScaleFactor: 0.9,
        style: TextStyle(
          color: Theme.of(context).primaryColor,
        ),
      ),
    ),
  );
}
