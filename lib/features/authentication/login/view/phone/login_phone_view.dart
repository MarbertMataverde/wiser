import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wiser/core/constant/core_constant.dart';
import 'package:wiser/core/riverpod/riverpod.dart';
import 'package:wiser/core/widgets/core_button_widget.dart';
import 'package:wiser/core/widgets/core_loading_animation_widget.dart';
import 'package:wiser/core/widgets/core_textfield_widget.dart';
import 'package:wiser/features/authentication/create/view/create_account_view.dart';
import 'package:wiser/features/authentication/login/services/email_services.dart';
import 'package:wiser/features/authentication/login/services/google_services.dart';
import 'package:wiser/core/validator/validator.dart';
import 'package:wiser/features/authentication/login/widgets/login_widgets.dart';
import 'package:wiser/features/authentication/reset_password/view/reset_password_view.dart';

/// The widget responsible for displaying the phone login view.
class LoginPhoneView extends StatefulWidget {
  const LoginPhoneView({Key? key}) : super(key: key);

  @override
  LoginPhoneViewState createState() => LoginPhoneViewState();
}

class LoginPhoneViewState extends State<LoginPhoneView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: CoreConstant.pagePadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    // Tagline widget
                    loginTaglineWidget(context),
                    const SizedBox(
                      height: 40,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          // Email address textfield
                          coreTextFormFieldWidget(
                            context: context,
                            controller: email,
                            hintText: 'Email Address',
                            validator: emailValidator,
                            keyboardType: TextInputType.emailAddress,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          // Password textfield
                          Consumer(
                            builder: (BuildContext context, WidgetRef ref,
                                Widget? child) {
                              bool isPasswordHidden =
                                  ref.watch(passwordVisibilityStateProvider);
                              return coreTextFormFieldWidget(
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
                                    return 'Please enter a password';
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.visiblePassword,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    // Reset password widget
                    resetPasswordWidget(
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
                    Consumer(
                      builder:
                          (BuildContext context, WidgetRef ref, Widget? child) {
                        final isLoading =
                            ref.watch(authenticatingStateProvider);
                        return isLoading
                            ? coreLoadingAnimationWidget()
                            : coreButtonWidget(
                                context: context,
                                label: 'LOGIN',
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    ref
                                        .read(authenticatingStateProvider
                                            .notifier)
                                        .update((state) => !isLoading);
                                    await signInWithEmailAndPassword(
                                      context: context,
                                      email: email.text,
                                      password: password.text,
                                    );
                                    ref.invalidate(authenticatingStateProvider);
                                  } else {
                                    // Form is invalid, show an error message
                                  }
                                },
                              );
                      },
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Continue with',
                        textScaleFactor: 0.8,
                        style: TextStyle(
                          color: CoreConstant.secondaryTextColor,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        continueWithIconButtonWidget(
                          assetPath: CoreConstant.googleLogoAssetPath,
                          onPressed: () => signInWithGoogle(),
                        ),
                        continueWithIconButtonWidget(
                          assetPath: CoreConstant.facebookLogoAssetPath,
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
                        continueWithIconButtonWidget(
                          assetPath: CoreConstant.envelopeLogoAssetPath,
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
