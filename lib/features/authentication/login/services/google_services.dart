import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:wiser/features/authentication/services/authentication_set_default_account_data.dart';

/// Signs in the user using Google authentication.
/// Returns a Future that completes when the sign-in process is finished.
Future<void> signInWithGoogle() async {
  try {
    // Trigger the Google sign-in flow
    final googleUser = await GoogleSignIn().signIn();

    // Obtain the authentication details from the sign-in request
    final googleAuth = await googleUser?.authentication;

    // Create a new credential using the obtained authentication details
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Sign in to Firebase with the created credential
    final userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    final user = userCredential.user;

    // Get a reference to the user's document in the Firestore collection
    final userDocRef =
        FirebaseFirestore.instance.collection('users').doc(user!.uid);

    // Fetch the user's accounts from Firestore
    final querySnapshot = await userDocRef.collection('accounts').get();

    // If the user has no accounts, set default account data
    if (querySnapshot.docs.isEmpty) {
      await setDefaultAccountData();
    }
  } catch (error, stackTrace) {
    // Log and rethrow the error for further handling
    log('Error signing in with Google: $error',
        error: error, stackTrace: stackTrace);
    rethrow;
  }
}
