import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wiser/core/constant/core_constant.dart';

final passwordVisibilityStateProvider = StateProvider<bool>((ref) => true);

TextFormField coreTextFormFieldWidget({
  required BuildContext context,
  required String hintText,
  String? Function(String?)? validator,
  required TextEditingController controller,
  TextInputType? keyboardType,
  List<TextInputFormatter>? inputFormater,
  bool? obscureText,
  IconData? suffixIcon,
  bool isHintCentered = false,
  TextStyle? customTextStyle,
  Color? customCursorColor,
  Color? customHintColor,
  int? customMaxLine,
  Function()? suffixIconOnPressed,
  Function(String)? onChanged,
}) {
  return TextFormField(
    textAlign: isHintCentered ? TextAlign.center : TextAlign.start,
    maxLines: customMaxLine ?? 1,
    onChanged: validator,
    style: customTextStyle ??
        TextStyle(
          color: Theme.of(context).primaryColor,
          fontWeight: FontWeight.w500,
        ),
    cursorColor: customCursorColor ?? Theme.of(context).primaryColor,
    controller: controller,
    validator: validator,
    obscureText: obscureText ?? false,
    inputFormatters: inputFormater,
    keyboardType: keyboardType,
    decoration: InputDecoration(
      suffixIcon: isHintCentered
          ? null
          : GestureDetector(
              onTap: suffixIconOnPressed,
              child: Icon(suffixIcon),
            ),
      filled: true,
      fillColor: CoreConstant.fillColor,
      hintText: hintText,
      hintStyle: TextStyle(
        color:
            customHintColor ?? Theme.of(context).primaryColor.withOpacity(0.6),
      ),
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
