import 'package:firebase_core/firebase_core.dart';
import 'package:weight_tracker/firebase_options.dart';

abstract class AppFirebase {
  static Future initializeFireBase() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}
