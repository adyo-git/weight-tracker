import 'package:flutter/material.dart';
import 'package:weight_tracker/app/app_firebase.dart';
import 'package:weight_tracker/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppFirebase.initializeFireBase();
  runApp(const MyApp());
}

