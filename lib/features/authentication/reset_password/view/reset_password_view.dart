import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wiser/core/constant/core_constant.dart';
import 'package:wiser/core/riverpod/riverpod.dart';
import 'package:wiser/core/validator/validator.dart';
import 'package:wiser/core/widgets/core_arrow_left_button_widget.dart';
import 'package:wiser/core/widgets/core_button_widget.dart';
import 'package:wiser/core/widgets/core_loading_animation_widget.dart';
import 'package:wiser/core/widgets/core_single_line_title_text_widget.dart';
import 'package:wiser/core/widgets/core_textfield_widget.dart';
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
        leading: coreArrowLeftButtonWidget(context),
      ),
      body: SafeArea(
        child: Padding(
          padding: CoreConstant.pageHorizontalPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              coreSingleLineTitleTextWidget(
                  context: context, title: 'Reset Password'),
              const Text(
                CoreConstant.resetPasswordSubtitleMessage,
              ),
              const SizedBox(
                height: 20,
              ),
              Form(
                key: _formKey,
                child: coreTextFormFieldWidget(
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
                    ? coreLoadingAnimationWidget()
                    : coreButtonWidget(
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
