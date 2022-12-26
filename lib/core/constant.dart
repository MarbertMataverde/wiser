import 'package:flutter/material.dart';

class Constant {
  // OnBoarding images path
  static const String onBoardingAssetImagePath1 =
      'assets/images/onboarding/onboardingAsset1.png';
  static const String onBoardingAssetImagePath2 =
      'assets/images/onboarding/onboardingAsset2.png';
  static const String onBoardingAssetImagePath3 =
      'assets/images/onboarding/onboardingAsset3.png';

  // OnBoarding Colors
  static const Color onBoardingColor1 = Color(0xffE98EC1);
  static const Color onBoardingColor2 = Color(0xffA4AEEA);
  static const Color onBoardingColor3 = Color(0xffF5D189);
  static const Color onBoardingActiveDotColor = Color(0xffEFEFEF);
  static const Color onBoardingDotColor = Color(0xFFD1D1D1);

  // onBoarding title
  static const String onBoardingTitle1 =
      'You ought to know where your money goes';
  static const String onBoardingTitle2 = 'Gain total control of your money';
  static const String onBoardingTitle3 =
      'Plan ahead and manage your money better';

  // onBoarding description
  static const String onBoardingDescription1 =
      'Get an overview of how you are performing and motivate yourself to achieve even more.';
  static const String onBoardingDescription2 =
      'Track your transaction easily, with categories and financial report';
  static const String onBoardingDescription3 =
      'Setup your budget for each categoryso you in control. Track categories you spend the most money on';

  // assets path
  static const String googleLogoAssetPath = 'assets/images/logo/google.svg';
  static const String facebookLogoAssetPath = 'assets/images/logo/facebook.svg';
  static const String envelopeLogoAssetPath = 'assets/images/logo/envelope.svg';

  // Wiser colors
  static const Color colorWhite = Colors.white;
  static Color fillColor = Colors.white.withOpacity(0.5);
  static const Color primaryColor = Color(0xff91A0EA);
  static const Color scaffoldBackgroundColor = Color(0xffEBEBEB);
  static const Color bodyColor = Color(0xFF4B4B4B);
  static const Color errorColor = Color(0xFFEA9191);

  //regex patterm
  static const regexPatternEmail =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$";
}
