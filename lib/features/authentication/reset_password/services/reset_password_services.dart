import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:wiser/core/constant.dart';
import 'package:wiser/core/widgets/dialog.dart';

Future<void> resetPasswordRequest({
  required BuildContext context,
  required String email,
}) async {
  FirebaseAuth.instance
      .sendPasswordResetEmail(email: email)
      .then(
        (value) => showCustomDialog(
          context: context,
          title: 'Email Sent',
          buttonRightText: 'Thanks, Go back',
          assetPath: Constant.doneAssetPath,
          content: Constant.resetPasswordMailSentMessage,
          buttonRightVoidCallback: () => Navigator.popUntil(
            context,
            ModalRoute.withName('/'),
          ),
        ),
      )
      .catchError((error) {
    if (error.toString() == Constant.authUserNotFoundMessage) {
      showCustomDialog(
          context: context,
          title: 'Email Not Found',
          content: Constant.emailNotRegistered);
    } else if (error.toString() == Constant.authNetworkErrorMessage) {
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
