import 'package:firebase_auth/firebase_auth.dart';

signOut() async => await FirebaseAuth.instance.signOut();
