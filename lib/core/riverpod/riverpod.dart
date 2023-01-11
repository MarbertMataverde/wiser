import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// onboarding state provider
final onBoardingInitialPageProviderState = StateProvider<int>((ref) => 0);

// authentication state provider
final authenticatingStateProvider = StateProvider<bool>((ref) => false);

// stream of current user account
final accountSteamStateProvider = StateProvider<Stream<QuerySnapshot>>(
  (ref) => FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('accounts')
      .orderBy('account-create-date', descending: false)
      .snapshots(),
);
