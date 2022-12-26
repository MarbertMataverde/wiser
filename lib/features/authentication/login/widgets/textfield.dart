import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wiser/core/constant.dart';

TextFormField loginTextFormField({
  required BuildContext context,
  required String hintText,
  required String? Function(String?)? validator,
  List<TextInputFormatter>? inputFormater,
  bool? obscureText,
}) {
  return TextFormField(
    style: TextStyle(
      color: Theme.of(context).primaryColor,
      fontWeight: FontWeight.w500,
    ),
    cursorColor: Theme.of(context).primaryColor,
    validator: validator,
    obscureText: obscureText ?? false,
    inputFormatters: inputFormater,
    decoration: InputDecoration(
      filled: true,
      fillColor: Constant.fillColor,
      hintText: hintText,
      hintStyle:
          TextStyle(color: Theme.of(context).primaryColor.withOpacity(0.6)),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide.none,
      ),
    ),
  );
}
