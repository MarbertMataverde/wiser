import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wiser/core/constant.dart';

Container continueWithIconButton({
  required String assetPath,
  required Function()? onPressed,
}) {
  return Container(
    decoration: BoxDecoration(
      color: Constant.fillColor,
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
