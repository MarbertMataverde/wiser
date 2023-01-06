import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wiser/core/constant/core_constant.dart';
import 'package:wiser/core/riverpod/riverpod.dart';
import 'package:wiser/core/validator/validator.dart';
import 'package:wiser/core/widgets/core_arrow_left_button_widget.dart';
import 'package:wiser/core/widgets/core_button_widget.dart';
import 'package:wiser/core/widgets/core_loading_animation_widget.dart';
import 'package:wiser/core/widgets/core_single_line_title_text_widget.dart';
import 'package:wiser/core/widgets/core_textfield_widget.dart';
import 'package:wiser/features/authentication/create/services/create_account_services.dart';

class CreateAccount extends StatelessWidget {
  CreateAccount({Key? key}) : super(key: key);

  final TextEditingController nickName = TextEditingController();
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
        leading: coreArrowLeftButtonWidget(context),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: CoreConstant.pageHorizontalPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                coreSingleLineTitleTextWidget(
                    context: context, title: 'Create Account'),
                const Text(
                  CoreConstant.createAccountSubtitleMessage,
                ),
                const SizedBox(
                  height: 20,
                ),
                Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      coreTextFormFieldWidget(
                        context: context,
                        controller: nickName,
                        hintText: 'Nickname',
                        keyboardType: TextInputType.text,
                        validator: (value) => fullNameValidator(value),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      coreTextFormFieldWidget(
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
                            coreTextFormFieldWidget(
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
                            coreTextFormFieldWidget(
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
                Consumer(builder:
                    (BuildContext context, WidgetRef ref, Widget? child) {
                  final isLoading = ref.watch(authenticatingStateProvider);
                  return isLoading
                      ? coreLoadingAnimationWidget()
                      : coreButtonWidget(
                          context: context,
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              ref
                                  .read(authenticatingStateProvider.notifier)
                                  .update((state) => !isLoading);
                              await createAccount(
                                  context: context,
                                  email: email.text,
                                  password: password.text,
                                  fullName: nickName.text);
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
      ),
    );
  }
}
