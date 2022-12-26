import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:wiser/core/constant.dart';
import 'package:wiser/features/authentication/login/validator/validator.dart';
import 'package:wiser/features/authentication/login/widgets/continue_with.dart';
import 'package:wiser/features/authentication/login/widgets/login_button.dart';
import 'package:wiser/features/authentication/login/widgets/reset_password_button.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
                    // email address textfield
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
                    GestureDetector(
                      onTap: () {},
                      child: const Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Reset Password',
                          textScaleFactor: 0.9,
                          style: TextStyle(
                            color: Constant.primaryColor,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: TextButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // form is valid, proceed with submission
                            } else {
                              // form is invalid, show an error message
                            }
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                          ),
                          child: const Text(
                            'LOGIN',
                            style: TextStyle(
                              color: Constant.colorWhite,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
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
                          color: Constant.bodyColor,
                        ),
                      ),
                    ),
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

  TextFormField loginTextFormField({
    required BuildContext context,
    required String hintText,
    required String? Function(String?)? validator,
    List<TextInputFormatter>? inputFormater,
    bool? obscureText,
  }) {
    return TextFormField(
      style: TextStyle(
        color: Theme.of(context).primaryColor,
        fontWeight: FontWeight.w500,
      ),
      cursorColor: Theme.of(context).primaryColor,
      validator: validator,
      obscureText: obscureText ?? false,
      inputFormatters: inputFormater,
      decoration: InputDecoration(
        filled: true,
        fillColor: Constant.fillColor,
        hintText: hintText,
        hintStyle:
            TextStyle(color: Theme.of(context).primaryColor.withOpacity(0.6)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  SizedBox loginTagline(BuildContext context) {
    return SizedBox(
      width: 300,
      child: FittedBox(
        child: Text(
          'Wiser\nYour budget\nbuddy anywhere',
          style: TextStyle(
            height: 1,
            fontSize: 50,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}

Container continueWithIconButton({
  required GlobalKey<FormState> formKey,
  required String assetPath,
}) {
  return Container(
    decoration: BoxDecoration(
      color: Constant.fillColor,
      borderRadius: BorderRadius.circular(5),
    ),
    child: IconButton(
      onPressed: () {
        if (formKey.currentState!.validate()) {
          // form is valid, proceed with submission
        } else {
          // form is invalid, show an error message
        }
      },
      icon: SvgPicture.asset(
        assetPath,
        width: 25,
      ),
    ),
  );
}
