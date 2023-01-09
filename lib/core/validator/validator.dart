import 'package:wiser/core/constant/core_constant.dart';

String? fullNameValidator(value) {
  if (value!.isEmpty) {
    return 'What do you want to be called?';
  }
  if (value.toString().length <= 3) {
    return 'Nickname too short';
  }
  return null;
}

String? emailValidator(value) {
  if (value!.isEmpty) {
    return 'Please enter an email';
  }
  if (!RegExp(CoreConstant.regexPatternEmail).hasMatch(value)) {
    return 'Please enter a valid email';
  }
  return null;
}

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

String? passwordEqualityValidator() {
  return 'Please make sure your passwords match.';
}

String? newTransactionAmountValidator(value) {
  if (value!.isEmpty) {
    return 'Please enter an amount';
  }
  return null;
}

String? newAccountInitalValueValidator(value) {
  if (value!.isEmpty) {
    return 'Please enter an amount';
  }
  return null;
}

String? newAccountNameValidator(value) {
  if (value!.isEmpty) {
    return 'Please enter account name';
  }
  if (value.toString().length <= 2) {
    return 'Account name too short';
  }
  return null;
}
