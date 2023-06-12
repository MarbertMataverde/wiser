import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:wiser/core/constant/core_constant.dart';

Future<dynamic> coreShowCustomDialogWidget({
  required BuildContext context,
  required String title,
  required String content,
  String? assetPath, // default: notice animated icon
  String? buttonLeftText,
  String? buttonRightText,
  bool? isTwoButton = false,
  Function()? buttonLeftVoidCallback,
  Function()? buttonRightVoidCallback,
}) {
  return showDialog(
    context: context,
    builder: (context) => Dialog(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                SizedBox(
                  height: 30,
                  width: 30,
                  child: RiveAnimation.asset(
                    assetPath ?? CoreConstant.alertIconAssetPath,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Text(
              content,
            ),
            Row(
              mainAxisAlignment: isTwoButton == true
                  ? MainAxisAlignment.spaceBetween
                  : MainAxisAlignment.center,
              children: [
                Visibility(
                  visible: isTwoButton ?? true,
                  child: TextButton(
                    onPressed:
                        buttonLeftVoidCallback ?? () => Navigator.pop(context),
                    child: Text(
                      buttonLeftText ?? 'Dismiss',
                      style: const TextStyle(
                        color: CoreConstant.primaryTextColor,
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed:
                      buttonRightVoidCallback ?? () => Navigator.pop(context),
                  style: TextButton.styleFrom(
                    backgroundColor:
                        Theme.of(context).primaryColor.withAlpha(30),
                  ),
                  child: Text(
                    buttonRightText ?? 'Okay, Continue',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
}
