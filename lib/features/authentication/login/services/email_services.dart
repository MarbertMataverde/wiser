import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wiser/core/constant.dart';
import 'package:wiser/core/widgets/dialog.dart';

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
        showCustomDialog(
            context: context,
            title: 'Wrong Password',
            content: Constant.wrongPasswordMessage);
        break;
      case 'user-not-found':
        showCustomDialog(
            context: context,
            title: 'User Not Found',
            content: Constant.userNotFoundMessage);
        break;
      case 'user-disabled':
        showCustomDialog(
            context: context,
            title: 'User Disabled',
            content: Constant.userDisabledMessage);
        break;
      case 'too-many-requests':
        showCustomDialog(
            context: context,
            title: 'Too Many Request',
            content: Constant.tooManyRequestMessage);
        break;
      case 'network-request-failed':
        showCustomDialog(
            context: context,
            title: 'No Internet Connection',
            content: Constant.networkRequestFailedMessage);
        break;
      default:
        showCustomDialog(
            context: context,
            title: error.code,
            content: error.message.toString());
    }
  } catch (error) {
    showCustomDialog(
      context: context,
      title: 'Something Went Wrong',
      content: error.toString(),
    );
  }
}
