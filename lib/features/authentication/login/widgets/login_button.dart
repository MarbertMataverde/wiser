import 'package:flutter/material.dart';
import 'package:wiser/core/constant.dart';

Align loginButton(
    {required BuildContext context, required Function()? onPressed}) {
  return Align(
    alignment: Alignment.center,
    child: SizedBox(
      width: double.infinity,
      height: 50,
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          overlayColor: MaterialStateColor.resolveWith(
              (states) => Constant.fillColor.withOpacity(0.10)),
          backgroundColor: MaterialStateColor.resolveWith(
              (states) => Theme.of(context).primaryColor),
        ),
        child: const Text(
          'LOGIN',
          style: TextStyle(
            color: Constant.colorWhite,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}
