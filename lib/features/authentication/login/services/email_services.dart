import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wiser/core/constant/core_constant.dart';
import 'package:wiser/core/widgets/core_show_dialog_widget.dart';

Future<void> signInWithEmailAndPassword({
  required BuildContext context,
  required String email,
  required String password,
}) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  } on FirebaseAuthException catch (error) {
    switch (error.code) {
      case 'wrong-password':
        coreShowCustomDialogWidget(
            context: context,
            title: 'Wrong Password',
            content: CoreConstant.wrongPasswordMessage);
        break;
      case 'user-not-found':
        coreShowCustomDialogWidget(
            context: context,
            title: 'User Not Found',
            content: CoreConstant.userNotFoundMessage);
        break;
      case 'user-disabled':
        coreShowCustomDialogWidget(
            context: context,
            title: 'User Disabled',
            content: CoreConstant.userDisabledMessage);
        break;
      case 'too-many-requests':
        coreShowCustomDialogWidget(
            context: context,
            title: 'Too Many Request',
            content: CoreConstant.tooManyRequestMessage);
        break;
      case 'network-request-failed':
        coreShowCustomDialogWidget(
            context: context,
            title: 'No Internet Connection',
            content: CoreConstant.networkRequestFailedMessage);
        break;
      default:
        coreShowCustomDialogWidget(
            context: context,
            title: error.code,
            content: error.message.toString());
    }
  } catch (error) {
    coreShowCustomDialogWidget(
      context: context,
      title: 'Something Went Wrong',
      content: error.toString(),
    );
  }
}
