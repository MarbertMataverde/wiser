import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wiser/features/authentication/login/services/sign_out.dart';

class DashBoard extends StatelessWidget {
  DashBoard({Key? key}) : super(key: key);

  final User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => signOut(),
            icon: const Icon(
              Iconsax.logout,
            ),
          )
        ],
      ),
      body: Center(
        child: Text(user!.displayName.toString()),
      ),
    );
  }
}
