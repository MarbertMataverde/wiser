import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rive/rive.dart';
import 'package:wiser/core/constant.dart';
import 'package:wiser/core/riverpod/riverpod.dart';
import 'package:wiser/core/widgets/loading_animation.dart';
import 'package:wiser/features/authentication/create/view/view_create_account.dart';
import 'package:wiser/features/authentication/login/services/email_services.dart';
import 'package:wiser/features/authentication/login/services/google_services.dart';
import 'package:wiser/core/validator/validator.dart';
import 'package:wiser/features/authentication/login/widgets/login_widgets.dart';
import 'package:wiser/features/authentication/reset_password/view/view_reset_password.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const RiveAnimation.asset(
            Constant.shapesAssetPath,
            alignment: Alignment.bottomCenter,
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 30, sigmaY: 40),
            child: const SizedBox(
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: Constant.pagePadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    loginTagline(context),
                    const SizedBox(
                      height: 40,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          // email address textfield
                          textFormField(
                            context: context,
                            controller: email,
                            hintText: 'Email Address',
                            validator: emailValidator,
                            keyboardType: TextInputType.emailAddress,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          // password textfield
                          Consumer(builder: (BuildContext context,
                              WidgetRef ref, Widget? child) {
                            bool isPasswordHidden =
                                ref.watch(passwordVisibilityStateProvider);
                            return textFormField(
                              context: context,
                              obscureText: isPasswordHidden,
                              controller: password,
                              hintText: 'Password',
                              suffixIcon: isPasswordHidden
                                  ? Iconsax.eye_slash
                                  : Iconsax.eye,
                              suffixIconOnPressed: () {
                                ref
                                    .read(passwordVisibilityStateProvider
                                        .notifier)
                                    .update((state) => !isPasswordHidden);
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter an password';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.visiblePassword,
                            );
                          }),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    resetPassword(
                      context: context,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResetPassword(),
                        ),
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
                              label: 'LOGIN',
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  ref
                                      .read(
                                          authenticatingStateProvider.notifier)
                                      .update((state) => !isLoading);
                                  await signInWithEmailAndPassword(
                                    context: context,
                                    email: email.text,
                                    password: password.text,
                                  );
                                  ref.invalidate(authenticatingStateProvider);
                                } else {
                                  // form is invalid, show an error message
                                }
                              },
                            );
                    }),
                    const SizedBox(
                      height: 50,
                    ),
                    continueWith(),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        continueWithIconButton(
                          assetPath: Constant.googleLogoAssetPath,
                          onPressed: () => signInWithGoogle(),
                        ),
                        continueWithIconButton(
                          assetPath: Constant.facebookLogoAssetPath,
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Theme.of(context).primaryColor,
                                behavior: SnackBarBehavior.floating,
                                content:
                                    const Text('Feature not yet implemented'),
                              ),
                            );
                          },
                        ),
                        continueWithIconButton(
                          assetPath: Constant.envelopeLogoAssetPath,
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CreateAccount(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
