import 'package:flutter/material.dart';
import 'package:wiser/core/constant.dart';

final ThemeData wiserThemeData = ThemeData.light().copyWith(
  scaffoldBackgroundColor: Constant.scaffoldBackgroundColor,
  primaryTextTheme: ThemeData.light().textTheme.apply(
        fontFamily: 'Inter',
      ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      textStyle: MaterialStateProperty.resolveWith<TextStyle?>(
        ((states) => const TextStyle(color: Colors.white)),
      ),
    ),
  ),
);
