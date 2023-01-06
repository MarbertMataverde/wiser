import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wiser/core/constant/core_constant.dart';

IconButton coreArrowLeftButtonWidget(BuildContext context) {
  return IconButton(
    onPressed: () => Navigator.pop(context),
    iconSize: 30,
    splashRadius: 25,
    highlightColor: CoreConstant.overlayColor,
    icon: Icon(
      Iconsax.arrow_left,
      color: Theme.of(context).primaryColor,
    ),
  );
}
