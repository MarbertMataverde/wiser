import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wiser/core/constant.dart';
import 'package:wiser/core/validator/validator.dart';
import 'package:wiser/core/widgets/arrow_left_button.dart';
import 'package:wiser/core/widgets/single_line_title_text.dart';
import 'package:wiser/features/authentication/create/services/create_account_services.dart';
import 'package:wiser/features/authentication/login/widgets/login_widgets.dart';

class CreateAccount extends StatelessWidget {
  CreateAccount({Key? key}) : super(key: key);

  final TextEditingController fullName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: arrowLeftButton(context),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: Constant.pagePadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                singleLineTitleText(context: context, title: 'Create Account'),
                const Text(
                  Constant.createAccountSubtitleMessage,
                ),
                const SizedBox(
                  height: 20,
                ),
                Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      textFormField(
                        context: context,
                        controller: fullName,
                        hintText: 'Fullname',
                        keyboardType: TextInputType.text,
                        validator: (value) => fullNameValidator(value),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      textFormField(
                        context: context,
                        controller: email,
                        hintText: 'Email Address',
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) => emailValidator(value),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Consumer(builder:
                          (BuildContext context, WidgetRef ref, Widget? child) {
                        bool isPasswordHidden =
                            ref.watch(passwordVisibilityStateProvider);
                        return Column(
                          children: [
                            textFormField(
                              context: context,
                              controller: password,
                              hintText: 'Password',
                              keyboardType: TextInputType.visiblePassword,
                              validator: (value) {
                                if (password.text == confirmPassword.text) {
                                  return passwordValidator(value);
                                } else {
                                  return passwordEqualityValidator();
                                }
                              },
                              obscureText: isPasswordHidden,
                              suffixIcon: isPasswordHidden
                                  ? Iconsax.eye_slash
                                  : Iconsax.eye,
                              suffixIconOnPressed: () {
                                ref
                                    .read(passwordVisibilityStateProvider
                                        .notifier)
                                    .update((state) => !isPasswordHidden);
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            textFormField(
                              context: context,
                              controller: confirmPassword,
                              hintText: 'Confirm Password',
                              keyboardType: TextInputType.visiblePassword,
                              validator: (value) {
                                if (password.text == confirmPassword.text) {
                                  return passwordValidator(value);
                                } else {
                                  return passwordEqualityValidator();
                                }
                              },
                              obscureText: isPasswordHidden,
                              suffixIcon: isPasswordHidden
                                  ? Iconsax.eye_slash
                                  : Iconsax.eye,
                              suffixIconOnPressed: () {
                                ref
                                    .read(passwordVisibilityStateProvider
                                        .notifier)
                                    .update((state) => !isPasswordHidden);
                              },
                            ),
                          ],
                        );
                      }),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                button(
                    context: context,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        createAccount(
                            context: context,
                            email: email.text,
                            password: password.text,
                            fullName: fullName.text);
                      } else {
                        // form is invalid, show an error message
                      }
                    },
                    label: 'SUBMIT')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
