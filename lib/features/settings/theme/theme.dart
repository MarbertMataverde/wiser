import 'package:flutter/material.dart';
import 'package:wiser/core/constant.dart';

final ThemeData wiserThemeData = ThemeData.light().copyWith(
  scaffoldBackgroundColor: Constant.scaffoldBackgroundColor,
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
      textStyle: MaterialStateProperty.resolveWith<TextStyle?>(
        ((states) => const TextStyle(
              color: Constant.colorWhite,
            )),
      ),
    ),
  ),
);