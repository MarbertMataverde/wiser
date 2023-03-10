import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:wiser/core/constant/core_constant.dart';
import 'package:wiser/core/widgets/core_show_dialog_widget.dart';
import 'package:wiser/features/authentication/login/services/sign_out_services.dart';
import 'package:wiser/features/authentication/services/authentication_set_default_account_data.dart';

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
          .then(
            (value) =>
                setDefaultAccountData().then((value) => Navigator.pop(context)),
          )
          .whenComplete(() async {
        coreShowCustomDialogWidget(
          context: context,
          title: 'Success',
          assetPath: CoreConstant.doneAssetPath,
          content: CoreConstant.createAccountSuccessMessage,
        );
        // Prevents immediate access to the dashboard.
        await signOut();
      });
    },
  ).catchError((error) {
    if (error.toString() == CoreConstant.authNetworkErrorMessage) {
      coreShowCustomDialogWidget(
          context: context,
          title: 'No Internet Connection',
          content: CoreConstant.networkRequestFailedMessage);
    } else if (error.toString() == CoreConstant.emailAlreadyInUse) {
      coreShowCustomDialogWidget(
          context: context,
          title: 'Email Already In Use',
          content: CoreConstant.emailAlreadyInUseMessage);
    } else {
      coreShowCustomDialogWidget(
          context: context,
          title: 'Something Went Wrong',
          content:
              '${CoreConstant.somethingWentWrongMessage}\n${error.toString()}');
    }
  });
}
