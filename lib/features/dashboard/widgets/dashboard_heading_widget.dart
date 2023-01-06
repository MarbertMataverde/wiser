import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wiser/features/authentication/login/services/sign_out_services.dart';

Row dashboardHeadingWidget({required User? user}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Welcome!',
          ),
          FittedBox(
            child: Text(
              user!.displayName!,
              textScaleFactor: 1.2,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      GestureDetector(
        onTap: () {
          signOut();
        },
        child: const Icon(Iconsax.setting),
      ),
    ],
  );
}
