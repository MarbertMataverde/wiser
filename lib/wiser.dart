import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wiser/core/layout/responsive_layout.dart';
import 'package:wiser/features/authentication/login/view/login_view.dart';
import 'package:wiser/features/pageview/view/page_wrapper_view.dart';
import 'package:wiser/core/theme/core_theme.dart';
import 'package:wiser/layout%20tester/desktop_size.dart';
import 'package:wiser/layout%20tester/phone_size.dart';
import 'package:wiser/layout%20tester/tablet_size.dart';

class WiserApp extends StatelessWidget {
  const WiserApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wiser - Your budget buddy anywhere!',
      debugShowCheckedModeBanner: false,
      theme: wiserThemeData,
      themeMode: ThemeMode.light,
      home: const ResponsiveLayout(
        phone: PhoneSize(),
        tablet: TabletSize(),
        desktop: DesktopSize(),
      ),
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
          return const PageViewWrapperView(); // home screen
        } else {
          return Login();
        }
      },
    );
  }
}
