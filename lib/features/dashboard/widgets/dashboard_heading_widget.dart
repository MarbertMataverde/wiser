import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
    ],
  );
}
