import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:wiser/core/riverpod/riverpod.dart';

Widget onBoardingSkipTextButton(WidgetRef ref,
    {required LiquidController liquidController}) {
  return Visibility(
    visible: ref.watch(onBoardingInitialPageProviderState) == 2 ? false : true,
    child: Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.transparent,
          ),
          onPressed: () {
            liquidController.animateToPage(page: 2);
            ref
                .read(onBoardingInitialPageProviderState.notifier)
                .update((state) => 2);
          },
          child: Text(
            'Skip',
            style: TextStyle(
              color: Colors.grey.shade300,
            ),
          ),
        ),
      ),
    ),
  );
}
