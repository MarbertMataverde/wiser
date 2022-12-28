import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wiser/core/constant.dart';
import 'package:wiser/core/riverpod/riverpod.dart';
import 'package:wiser/core/validator/validator.dart';
import 'package:wiser/core/widgets/arrow_left_button.dart';
import 'package:wiser/core/widgets/loading_animation.dart';
import 'package:wiser/core/widgets/single_line_title_text.dart';
import 'package:wiser/features/authentication/login/widgets/login_widgets.dart';
import 'package:wiser/features/authentication/reset_password/services/reset_password_services.dart';

class ResetPassword extends StatelessWidget {
  ResetPassword({Key? key}) : super(key: key);

  final TextEditingController email = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: arrowLeftButton(context),
      ),
      body: SafeArea(
        child: Padding(
          padding: Constant.pagePadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              singleLineTitleText(context: context, title: 'Reset Password'),
              const Text(
                Constant.resetPasswordSubtitleMessage,
              ),
              const SizedBox(
                height: 20,
              ),
              Form(
                key: _formKey,
                child: textFormField(
                  context: context,
                  controller: email,
                  hintText: 'Email Address',
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) => emailValidator(value),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Consumer(builder:
                  (BuildContext context, WidgetRef ref, Widget? child) {
                final isLoading = ref.watch(authenticatingStateProvider);
                return isLoading
                    ? loadingAnimation()
                    : button(
                        context: context,
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            ref
                                .read(authenticatingStateProvider.notifier)
                                .update((state) => !isLoading);
                            await resetPasswordRequest(
                                context: context, email: email.text);
                            ref.invalidate(authenticatingStateProvider);
                          } else {
                            // form is invalid, show an error message
                          }
                        },
                        label: 'SUBMIT');
              })
            ],
          ),
        ),
      ),
    );
  }
}
