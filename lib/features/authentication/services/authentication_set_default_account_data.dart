import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> setDefaultAccountData() async {
  FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('accounts')
      .doc()
      .set({
    'account-name': 'Cash',
    'account-initial-amount': 0,
    'account-icon-code-point': 60473,
    'account-background-color': 'Color(0xff008a64)',
    'account-create-date': Timestamp.now()
  });
}
