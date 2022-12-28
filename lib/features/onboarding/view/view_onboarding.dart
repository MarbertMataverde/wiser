import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:wiser/core/constant.dart';
import 'package:wiser/core/riverpod/riverpod.dart';
import 'package:wiser/features/onboarding/widgets/widget.dart';

class Onboarding extends ConsumerWidget {
  Onboarding({Key? key}) : super(key: key);
  final LiquidController liquidController = LiquidController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            LiquidSwipe(
              pages: onBoardingPages,
              enableLoop: false,
              enableSideReveal: true,
              positionSlideIcon: 0.82,
              liquidController: liquidController,
              ignoreUserGestureWhileAnimating: true,
              slideIconWidget: const SizedBox(width: 20, height: 20),
              initialPage: ref.read(onBoardingInitialPageProviderState),
              onPageChangeCallback: (activePageIndex) => ref
                  .read(onBoardingInitialPageProviderState.notifier)
                  .update((state) => activePageIndex),
            ),
            onBoardingGetStartedTextButton(ref),
            onBoardingSmoothIndicator(ref),
            onBoardingSkipTextButton(ref, liquidController: liquidController),
          ],
        ),
      ),
    );
  }
}

final List<Widget> onBoardingPages = [
  onBoardingPage(
    onBoardingAssetImagePath: Constant.onBoardingAssetImagePath1,
    onBoardingBgColor: Constant.onBoardingColor1,
    onBoardingTitle: Constant.onBoardingTitle1,
    onBoardingDescription: Constant.onBoardingDescription1,
  ),
  onBoardingPage(
      onBoardingAssetImagePath: Constant.onBoardingAssetImagePath2,
      onBoardingBgColor: Constant.onBoardingColor2,
      onBoardingTitle: Constant.onBoardingTitle2,
      onBoardingDescription: Constant.onBoardingDescription2),
  onBoardingPage(
      onBoardingAssetImagePath: Constant.onBoardingAssetImagePath3,
      onBoardingBgColor: Constant.onBoardingColor3,
      onBoardingTitle: Constant.onBoardingTitle3,
      onBoardingDescription: Constant.onBoardingDescription3),
];
