import 'package:flutter/material.dart';

FittedBox coreSingleLineTitleTextWidget({
  required BuildContext context,
  required String title,
}) {
  return FittedBox(
    child: Text(
      title,
      style: TextStyle(
        height: 1,
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).primaryColor,
      ),
    ),
  );
}
