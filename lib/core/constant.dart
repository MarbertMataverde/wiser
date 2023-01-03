import 'package:flutter/material.dart';

class Constant {
  // page content padding
  static const EdgeInsetsGeometry pagePadding =
      EdgeInsets.symmetric(vertical: 30, horizontal: 20);

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

  static const String wrongPasswordMessage =
      'Sorry, that password is incorrect. Please try again or click \'Reset Password\' to update your password.';
  static const String userNotFoundMessage =
      'Sorry, we were unable to find an account with the provided information. Please double check your login credentials and try again. If you are having trouble accessing your account, you can try resetting your password or contacting our support team for assistance.';
  static const String userDisabledMessage =
      'Unfortunately, your account has been disabled by the application administrator. If you believe this is a mistake or have any questions, please contact the administrator for further assistance. Thank you for your understanding.';
  static const String tooManyRequestMessage =
      'Sorry, you have exceeded the maximum number of requests allowed for this application. Please try again later or contact the support team for assistance.';
  static const String networkRequestFailedMessage =
      'We apologize, but it looks like you are currently not connected to the internet. Please check your internet connection and try again.';
  static const String authUserNotFoundMessage =
      '[firebase_auth/user-not-found] There is no user record corresponding to this identifier. The user may have been deleted.';
  static const String emailNotRegistered =
      'Sorry, the email you provided is not registered in our system. Please double check the email and try again or register a new account.';
  static const String authNetworkErrorMessage =
      '[firebase_auth/network-request-failed] A network error (such as timeout, interrupted connection or unreachable host) has occurred.';
  static const String somethingWentWrongMessage =
      'Something seems to be off. Please try again or contact our support team for assistance.';
  static const String resetPasswordMailSentMessage =
      'We have sent you an email with instructions on how to reset your password. Please check your inbox and follow the steps to reset your password. If you do not receive the email, please check your spam or junk folder.';
  static const String resetPasswordSubtitleMessage =
      'Resetting your password is easy! Just follow the instructions we\'ll send you via email to get back into your account.';
  static const String createAccountSubtitleMessage =
      'Create an account to start budgeting with Wiser today!';
  static const String createAccountSuccessMessage =
      'Your account has been successfully created! You can now log in to your account.';

  // assets path
  static const String googleLogoAssetPath = 'assets/images/logo/google.svg';
  static const String facebookLogoAssetPath = 'assets/images/logo/facebook.svg';
  static const String envelopeLogoAssetPath = 'assets/images/logo/envelope.svg';
  static const String alertIconAssetPath =
      'assets/images/rive_animation/alert_icon.riv';
  static const String shapesAssetPath =
      'assets/images/rive_animation/animated_shapes.riv';
  static const String doneAssetPath = 'assets/images/rive_animation/done.riv';
  static const String loadingAssetPath =
      'assets/images/rive_animation/loading.riv';

  // Wiser colors
  static const Color colorWhite = Colors.white;
  static Color fillColor = Colors.white.withOpacity(0.5);
  static const Color primaryColor = Color(0xff91A0EA);
  static const Color scaffoldBackgroundColor = Color(0xffEBEBEB);
  static const Color bodyColor = Color(0xFF4B4B4B);
  static const Color greyColor = Color.fromARGB(255, 186, 186, 186);
  static const Color errorColor = Color(0xFFEA9191);
  static const Color greenColor = Color.fromARGB(255, 110, 214, 141);
  static const Color redColor = Color.fromARGB(255, 234, 135, 135);
  static Color overlayColor = const Color(0xff91A0EA).withOpacity(0.20);

  // Category Colors
  static const Color foodAndDrinksCategoryColor = Color(0xFFFFB444);
  static const Color shoppingCategoryColor = Color(0xFF44DAFF);
  static const Color housingCategoryColor = Color(0xFFFF4A44);
  static const Color transportationCategoryColor = Color(0xFF727272);
  static const Color vehicleCategoryColor = Color(0xFF6644FF);
  static const Color lifeAndEntertainmentCategoryColor = Color(0xFF44FF7C);
  static const Color communicationPCCategoryColor = Color(0xFF4744FF);
  static const Color financialExpensesCategoryColor = Color(0xFFBF2525);
  static const Color invesmentsCategoryColor = Color(0xFFAC1EAA);
  static const Color incomeCategoryColor = Color(0xFF36C640);
  static const Color othersCategoryColor = Color(0xFF3A3A3A);

  //regex patterm
  static const regexPatternEmail =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$";
}
