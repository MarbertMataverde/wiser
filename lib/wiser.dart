import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wiser/features/authentication/login/view/phone/login_phone_view.dart';
import 'package:wiser/features/pageview/view/page_wrapper_view.dart';
import 'package:wiser/core/theme/core_theme.dart';

class WiserApp extends StatelessWidget {
  const WiserApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wiser - Your budget buddy anywhere!',
      debugShowCheckedModeBanner: false,
      theme: wiserThemeData,
      themeMode: ThemeMode.light,
      home: const WiserHome(),
    );
  }
}

class WiserHome extends StatelessWidget {
  const WiserHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return _buildLoadingWidget(); // loading
        } else if (snapshot.hasError) {
          return _buildErrorMessageWidget(); // restart the app message
        } else if (snapshot.hasData) {
          return const PageViewWrapperView(); // home screen
        } else {
          return const LoginPhoneView();
        }
      },
    );
  }

  Widget _buildLoadingWidget() {
    return Container(); // Replace with your loading widget
  }

  Widget _buildErrorMessageWidget() {
    return Container(); // Replace with your error message widget
  }
}
