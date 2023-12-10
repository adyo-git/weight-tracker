import 'package:firebase_core/firebase_core.dart';

abstract class AppFirebase {
  static Future initializeFireBase() async {
    await Firebase.initializeApp();
  }
}
