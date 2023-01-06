import 'package:flutter/material.dart';

Widget onBoardingPageWidget({
  required String onBoardingAssetImagePath,
  required Color onBoardingBgColor,
  required String onBoardingTitle,
  required String onBoardingDescription,
}) {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      color: onBoardingBgColor,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          onBoardingAssetImagePath,
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                onBoardingTitle,
                textScaleFactor: 1.5,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                onBoardingDescription,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
