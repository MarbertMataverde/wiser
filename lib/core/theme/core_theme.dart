import 'package:flutter/material.dart';
import 'package:wiser/core/constant/core_constant.dart';

final ThemeData wiserThemeData = ThemeData.light().copyWith(
  scaffoldBackgroundColor: CoreConstant.scaffoldBackgroundColor,
  colorScheme: ThemeData().colorScheme.copyWith(
        primary: CoreConstant.primaryColor,
        error: CoreConstant.errorColor,
      ),
  primaryColor: CoreConstant.primaryColor,
  textTheme: ThemeData.light().textTheme.apply(
        fontFamily: 'Poppins',
        bodyColor: CoreConstant.bodyColor,
      ),
  primaryTextTheme: ThemeData.light().textTheme.apply(
        fontFamily: 'Poppins',
      ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      overlayColor:
          MaterialStateColor.resolveWith((states) => CoreConstant.overlayColor),
      textStyle: MaterialStateProperty.resolveWith<TextStyle?>(
        ((states) => const TextStyle(color: CoreConstant.colorWhite)),
      ),
    ),
  ),
  iconTheme: const IconThemeData(
    color: CoreConstant.bodyColor,
  ),
);
