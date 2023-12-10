import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weight_tracker/app/app_router.dart';
import 'package:weight_tracker/app_cubit.dart';
import 'package:weight_tracker/domain/di/di.dart';
import 'package:weight_tracker/presentation/screens/home/home_screen.dart';
import 'package:weight_tracker/presentation/screens/sign_in/sign_in_screen.dart';

class MyApp extends StatelessWidget {
  static late BuildContext appContext;
  final AppCubit _appCubit = getIt();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _appCubit,
      child: BlocBuilder(
        bloc: _appCubit,
        builder: (context, state) {
          AppRouter.initialRoute =
              _appCubit.isCurrentUserSignedIn ? SignInScreen.id : HomeScreen.id;
          return MaterialApp(
            onGenerateTitle: (context) {
              appContext = context;
              return "Weight Tracker";
            },
            onGenerateRoute: AppRouter.generatedRoute,
            initialRoute: AppRouter.initialRoute,
          );
        },
      ),
    );
  }
}
