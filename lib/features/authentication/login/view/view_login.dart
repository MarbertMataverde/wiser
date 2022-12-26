import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:wiser/core/constant.dart';
import 'package:wiser/features/authentication/login/validator/validator.dart';
import 'package:wiser/features/authentication/login/widgets/continue_with.dart';
import 'package:wiser/features/authentication/login/widgets/continue_with_icon_button.dart';
import 'package:wiser/features/authentication/login/widgets/login_button.dart';
import 'package:wiser/features/authentication/login/widgets/reset_password_button.dart';
import 'package:wiser/features/authentication/login/widgets/tagline.dart';
import 'package:wiser/features/authentication/login/widgets/textfield.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                            hintText: 'Email Adrress',
                            validator: emailValidator,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          // password textfield
                          loginTextFormField(
                            context: context,
                            hintText: 'Password',
                            validator: passwordValidator,
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
                    loginButton(context: context, formKey: _formKey),
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
                            formKey: _formKey,
                            assetPath: Constant.googleLogoAssetPath),
                        continueWithIconButton(
                            formKey: _formKey,
                            assetPath: Constant.facebookLogoAssetPath),
                        continueWithIconButton(
                            formKey: _formKey,
                            assetPath: Constant.envelopeLogoAssetPath),
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
