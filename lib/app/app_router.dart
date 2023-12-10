import 'package:flutter/material.dart';
import 'package:weight_tracker/presentation/screens/home/home_screen.dart';
import 'package:weight_tracker/presentation/screens/sign_in/sign_in_screen.dart';

class AppRouter {
  static String initialRoute = SignInScreen.id;

  static Route<dynamic> generatedRoute(RouteSettings settings) {
    // String arguments = settings.arguments;
    switch (settings.name) {
      case SignInScreen.id:
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      case HomeScreen.id:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      default:
        return MaterialPageRoute(
            builder: (_) => const Center(
                  child: Text("Page Not Found"),
                ));
    }
  }
}
