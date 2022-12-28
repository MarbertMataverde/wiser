import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:wiser/core/constant.dart';
import 'package:wiser/core/widgets/dialog.dart';

Future<void> createAccount({
  required BuildContext context,
  required String email,
  required String password,
  required String fullName,
}) async {
  await FirebaseAuth.instance
      .createUserWithEmailAndPassword(
    email: email,
    password: password,
  )
      .then(
    (value) async {
      await FirebaseAuth.instance.currentUser!
          .updateDisplayName(fullName)
          .then((value) => Navigator.pop(context));
    },
  ).catchError((error) {
    if (error.toString() == Constant.authNetworkErrorMessage) {
      showCustomDialog(
          context: context,
          title: 'No Internet Connection',
          content: Constant.networkRequestFailedMessage);
    } else {
      showCustomDialog(
          context: context,
          title: 'Something Went Wrong',
          content:
              '${Constant.somethingWentWrongMessage}\n${error.toString()}');
    }
  });
}
