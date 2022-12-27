import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wiser/core/constant.dart';
import 'package:wiser/features/authentication/login/validator/validator.dart';
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
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          iconSize: 30,
          splashRadius: 25,
          highlightColor: Constant.overlayColor,
          icon: Icon(
            Iconsax.arrow_left,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: Constant.pagePadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FittedBox(
                child: Text(
                  'Reset Password',
                  style: TextStyle(
                    height: 1,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              const Text(
                'Resetting your password is easy! Just follow the instructions we\'ll send you via email to get back into your account.',
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
              button(
                  context: context,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      resetPasswordRequest(context: context, email: email.text);
                    } else {
                      // form is invalid, show an error message
                    }
                  },
                  label: 'SUBMIT')
            ],
          ),
        ),
      ),
    );
  }
}
