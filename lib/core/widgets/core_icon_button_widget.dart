import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wiser/core/constant/core_constant.dart';

IconButton coreIconButtonWidget({
  required Function()? actionsOnPressed,
  IconData? iconData,
  Color? iconColor,
}) {
  return IconButton(
    splashRadius: 23,
    onPressed: actionsOnPressed,
    icon: Icon(
      iconData ?? Iconsax.setting,
      color: iconColor ?? CoreConstant.primaryTextColor,
    ),
  );
}
