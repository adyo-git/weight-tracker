import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class DIModule {
  InternetConnectionChecker get connectionChecker =>
      InternetConnectionChecker();

  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}
