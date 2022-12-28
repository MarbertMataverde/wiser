import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wiser/core/constant.dart';

IconButton arrowLeftButton(BuildContext context) {
  return IconButton(
    onPressed: () => Navigator.pop(context),
    iconSize: 30,
    splashRadius: 25,
    highlightColor: Constant.overlayColor,
    icon: Icon(
      Iconsax.arrow_left,
      color: Theme.of(context).primaryColor,
    ),
  );
}
