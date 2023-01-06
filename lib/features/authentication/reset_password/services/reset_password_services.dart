import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:wiser/core/constant/core_constant.dart';
import 'package:wiser/core/widgets/core_show_dialog_widget.dart';

Future<void> resetPasswordRequest({
  required BuildContext context,
  required String email,
}) async {
  FirebaseAuth.instance
      .sendPasswordResetEmail(email: email)
      .then(
        (value) => coreShowCustomDialogWidget(
          context: context,
          title: 'Email Sent',
          buttonRightText: 'Thanks, Go back',
          assetPath: CoreConstant.doneAssetPath,
          content: CoreConstant.resetPasswordMailSentMessage,
          buttonRightVoidCallback: () => Navigator.popUntil(
            context,
            ModalRoute.withName('/'),
          ),
        ),
      )
      .catchError((error) {
    if (error.toString() == CoreConstant.authUserNotFoundMessage) {
      coreShowCustomDialogWidget(
          context: context,
          title: 'Email Not Found',
          content: CoreConstant.emailNotRegistered);
    } else if (error.toString() == CoreConstant.authNetworkErrorMessage) {
      coreShowCustomDialogWidget(
          context: context,
          title: 'No Internet Connection',
          content: CoreConstant.networkRequestFailedMessage);
    } else {
      coreShowCustomDialogWidget(
          context: context,
          title: 'Something Went Wrong',
          content:
              '${CoreConstant.somethingWentWrongMessage}\n${error.toString()}');
    }
  });
}
