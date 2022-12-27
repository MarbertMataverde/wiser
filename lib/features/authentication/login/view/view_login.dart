import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:wiser/core/constant.dart';
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
            Constant.animatedShapesAssetPath,
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
                          textFormField(
                            context: context,
                            obscureText: true,
                            controller: password,
                            hintText: 'Password',
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter an password';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.visiblePassword,
                          ),
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
                    button(
                      context: context,
                      label: 'LOGIN',
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          signInWithEmailAndPassword(
                            context: context,
                            email: email.text,
                            password: password.text,
                          );
                        } else {
                          // form is invalid, show an error message
                        }
                      },
                    ),
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
                          onPressed: () {},
                        ),
                        continueWithIconButton(
                          assetPath: Constant.envelopeLogoAssetPath,
                          onPressed: () {},
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
