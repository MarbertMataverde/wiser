import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wiser/features/authentication/login/view/view_login.dart';
import 'package:wiser/features/dashboard/dashboard.dart';
import 'package:wiser/features/settings/theme/theme.dart';

class WiserApp extends StatelessWidget {
  const WiserApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wiser - Your budget buddy anywhere!',
      debugShowCheckedModeBanner: false,
      theme: wiserThemeData,
      themeMode: ThemeMode.dark,
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
          return Container(); // loading
        } else if (snapshot.hasError) {
          return Container(); // restart the app message
        } else if (snapshot.hasData) {
          return DashBoard(); // home screen
        } else {
          return Login();
        }
      },
    );
  }
}
