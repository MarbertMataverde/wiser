import 'package:wiser/core/constant.dart';

String? passwordValidator(value) {
  if (value!.isEmpty) {
    return 'Please enter an password';
  } else if (value.length < 8) {
    return 'Password must be at least 8 characters';
  } else if (!value.contains(RegExp(r'[A-Z]'))) {
    return 'Password must contain at least one uppercase letter';
  } else if (!value.contains(RegExp(r'[a-z]'))) {
    return 'Password must contain at least one lowercase letter';
  } else if (!value.contains(RegExp(r'[0-9]'))) {
    return 'Password must contain at least one number';
  } else if (!value.contains(RegExp(r'[!@#\$%\^&\*]'))) {
    return 'Password must contain at least one special character';
  }
  return null;
}

String? emailValidator(value) {
  if (value!.isEmpty) {
    return 'Please enter an email';
  }
  if (!RegExp(Constant.regexPatternEmail).hasMatch(value)) {
    return 'Please enter a valid email';
  }
  return null;
}
