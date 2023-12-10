import 'package:flutter/material.dart';
import 'package:weight_tracker/app/app_router.dart';

class MyApp extends StatelessWidget {
  static late BuildContext appContext;
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (context){
        appContext = context;
        return "Weight Tracker";
      },
      onGenerateRoute: AppRouter.generatedRoute,
      initialRoute: AppRouter.initialRoute,
    );
  }
}