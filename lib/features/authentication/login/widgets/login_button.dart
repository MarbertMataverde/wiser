import 'package:flutter/material.dart';
import 'package:wiser/core/constant.dart';

Align loginButton({
  required BuildContext context,
  required GlobalKey<FormState> formKey,
}) {
  return Align(
    alignment: Alignment.center,
    child: SizedBox(
      width: double.infinity,
      height: 50,
      child: TextButton(
        onPressed: () {
          if (formKey.currentState!.validate()) {
            // form is valid, proceed with submission
          } else {
            // form is invalid, show an error message
          }
        },
        style: TextButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor,
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
