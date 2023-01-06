import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wiser/core/constant/core_constant.dart';
import 'package:wiser/core/riverpod/riverpod.dart';

Padding onBoardingSmoothIndicatorWidget(WidgetRef ref) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 30),
    child: Align(
      alignment: Alignment.bottomCenter,
      child: AnimatedSmoothIndicator(
        activeIndex: ref.watch(onBoardingInitialPageProviderState),
        count: 3,
        effect: const ExpandingDotsEffect(
          dotColor: CoreConstant.onBoardingDotColor,
          activeDotColor: CoreConstant.onBoardingActiveDotColor,
        ),
      ),
    ),
  );
}
