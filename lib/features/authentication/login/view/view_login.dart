import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:wiser/core/constant.dart';
import 'package:wiser/features/authentication/login/services/email_services.dart';
import 'package:wiser/features/authentication/login/services/google_services.dart';
import 'package:wiser/features/authentication/login/validator/validator.dart';
import 'package:wiser/features/authentication/login/widgets/login_widgets.dart';

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
            'assets/images/animated_shapes.riv',
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
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
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
                          loginTextFormField(
                            context: context,
                            controller: email,
                            hintText: 'Email Adrress',
                            validator: emailValidator,
                            keyboardType: TextInputType.emailAddress,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          // password textfield
                          loginTextFormField(
                            context: context,
                            obscureText: true,
                            controller: password,
                            hintText: 'Password',
                            validator: passwordValidator,
                            keyboardType: TextInputType.visiblePassword,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    resetPassword(context: context),
                    const SizedBox(
                      height: 20,
                    ),
                    loginButton(
                      context: context,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          signInWithEmailAndPassword(
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
