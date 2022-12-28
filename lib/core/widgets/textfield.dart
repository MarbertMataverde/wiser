import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wiser/core/constant.dart';

final passwordVisibilityStateProvider = StateProvider<bool>((ref) => true);

TextFormField textFormField(
    {required BuildContext context,
    required String hintText,
    required String? Function(String?)? validator,
    required TextEditingController controller,
    TextInputType? keyboardType,
    List<TextInputFormatter>? inputFormater,
    bool? obscureText,
    IconData? suffixIcon,
    Function()? suffixIconOnPressed}) {
  return TextFormField(
    style: TextStyle(
      color: Theme.of(context).primaryColor,
      fontWeight: FontWeight.w500,
    ),
    cursorColor: Theme.of(context).primaryColor,
    controller: controller,
    validator: validator,
    obscureText: obscureText ?? false,
    inputFormatters: inputFormater,
    keyboardType: keyboardType,
    decoration: InputDecoration(
      suffixIcon: IconButton(
        onPressed: suffixIconOnPressed,
        icon: Icon(suffixIcon),
        splashRadius: 25,
      ),
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