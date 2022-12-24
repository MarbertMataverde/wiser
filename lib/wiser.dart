import 'package:flutter/material.dart';
import 'package:wiser/features/onboarding/view/view_onboarding.dart';
import 'package:wiser/features/settings/theme/theme.dart';

class WiserApp extends StatelessWidget {
  const WiserApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wiser - Your budget buddy anywhere!',
      debugShowCheckedModeBanner: false,
      theme: wiserThemeData,
      themeMode: ThemeMode.system,
      home: const WiserHome(),
    );
  }
}

class WiserHome extends StatelessWidget {
  const WiserHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Onboarding();
  }
}
