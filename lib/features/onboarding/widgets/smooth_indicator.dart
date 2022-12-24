import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wiser/core/constant.dart';
import 'package:wiser/features/onboarding/riverpod/riverpod.dart';

Padding onBoardingSmoothIndicator(WidgetRef ref) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 30),
    child: Align(
      alignment: Alignment.bottomCenter,
      child: AnimatedSmoothIndicator(
        activeIndex: ref.watch(initialPageProviderState),
        count: 3,
        effect: const ExpandingDotsEffect(
          dotColor: Constant.onBoardingDotColor,
          activeDotColor: Constant.onBoardingActiveDotColor,
        ),
      ),
    ),
  );
}
