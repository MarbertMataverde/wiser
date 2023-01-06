import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:wiser/core/constant/core_constant.dart';
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
            onBoardingGetStartedTextButtonWidget(ref),
            onBoardingSmoothIndicatorWidget(ref),
            onBoardingSkipTextButtonWidget(ref,
                liquidController: liquidController),
          ],
        ),
      ),
    );
  }
}

final List<Widget> onBoardingPages = [
  onBoardingPageWidget(
    onBoardingAssetImagePath: CoreConstant.onBoardingAssetImagePath1,
    onBoardingBgColor: CoreConstant.onBoardingColor1,
    onBoardingTitle: CoreConstant.onBoardingTitle1,
    onBoardingDescription: CoreConstant.onBoardingDescription1,
  ),
  onBoardingPageWidget(
      onBoardingAssetImagePath: CoreConstant.onBoardingAssetImagePath2,
      onBoardingBgColor: CoreConstant.onBoardingColor2,
      onBoardingTitle: CoreConstant.onBoardingTitle2,
      onBoardingDescription: CoreConstant.onBoardingDescription2),
  onBoardingPageWidget(
      onBoardingAssetImagePath: CoreConstant.onBoardingAssetImagePath3,
      onBoardingBgColor: CoreConstant.onBoardingColor3,
      onBoardingTitle: CoreConstant.onBoardingTitle3,
      onBoardingDescription: CoreConstant.onBoardingDescription3),
];
