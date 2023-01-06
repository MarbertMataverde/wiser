import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wiser/core/constant/core_constant.dart';
import 'package:wiser/core/riverpod/riverpod.dart';

Visibility onBoardingGetStartedTextButtonWidget(WidgetRef ref) {
  return Visibility(
    visible: ref.watch(onBoardingInitialPageProviderState) == 2 ? true : false,
    child: Padding(
      padding: const EdgeInsets.only(bottom: 80),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          width: 200,
          height: 40,
          child: TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              backgroundColor: CoreConstant.primaryColor,
            ),
            child: const Text(
              'Get Started',
              style: TextStyle(
                color: CoreConstant.colorWhite,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
