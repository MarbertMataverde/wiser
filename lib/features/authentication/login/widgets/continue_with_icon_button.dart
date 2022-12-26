import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wiser/core/constant.dart';

Container continueWithIconButton({
  required GlobalKey<FormState> formKey,
  required String assetPath,
}) {
  return Container(
    decoration: BoxDecoration(
      color: Constant.fillColor,
      borderRadius: BorderRadius.circular(5),
    ),
    child: IconButton(
      onPressed: () {
        if (formKey.currentState!.validate()) {
          // form is valid, proceed with submission
        } else {
          // form is invalid, show an error message
        }
      },
      icon: SvgPicture.asset(
        assetPath,
        width: 25,
      ),
    ),
  );
}
