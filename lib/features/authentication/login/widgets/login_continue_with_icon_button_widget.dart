import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wiser/core/constant/core_constant.dart';

Container continueWithIconButtonWidget({
  required String assetPath,
  required Function()? onPressed,
}) {
  return Container(
    decoration: BoxDecoration(
      color: CoreConstant.fillColor,
      borderRadius: BorderRadius.circular(5),
    ),
    child: IconButton(
      onPressed: onPressed,
      icon: SvgPicture.asset(
        assetPath,
        width: 25,
      ),
    ),
  );
}
