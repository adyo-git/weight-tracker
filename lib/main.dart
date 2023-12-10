import 'package:flutter/material.dart';
import 'package:weight_tracker/app/app_firebase.dart';
import 'package:weight_tracker/domain/di/di.dart';
import 'package:weight_tracker/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await AppFirebase.initializeFireBase();
  runApp(MyApp());
}

