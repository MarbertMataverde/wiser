import 'package:flutter/material.dart';
import 'package:wiser/core/constant.dart';

final ThemeData wiserThemeData = ThemeData.light().copyWith(
  scaffoldBackgroundColor: Constant.scaffoldBackgroundColor,
  colorScheme: ThemeData().colorScheme.copyWith(
        primary: Constant.primaryColor,
      ),
  primaryColor: Constant.primaryColor,
  errorColor: Constant.errorColor,
  textTheme: ThemeData.light().textTheme.apply(
        fontFamily: 'Poppins',
        bodyColor: Constant.bodyColor,
      ),
  primaryTextTheme: ThemeData.light().textTheme.apply(
        fontFamily: 'Poppins',
      ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      overlayColor:
          MaterialStateColor.resolveWith((states) => Constant.overlayColor),
      textStyle: MaterialStateProperty.resolveWith<TextStyle?>(
        ((states) => const TextStyle(color: Constant.colorWhite)),
      ),
    ),
  ),
);
