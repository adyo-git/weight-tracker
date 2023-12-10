import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weight_tracker/domain/di/di.dart';
import 'package:weight_tracker/presentation/base/base_states.dart';
import 'package:weight_tracker/presentation/screens/home/home_screen.dart';
import 'package:weight_tracker/presentation/screens/sign_in/sign_in_view_model.dart';
import 'package:weight_tracker/presentation/utils/dialog_utils.dart';
import 'package:weight_tracker/presentation/utils/toast_utils.dart';
import 'package:weight_tracker/presentation/widgets/app_bar.dart';
import 'package:weight_tracker/presentation/widgets/custom_filled_button.dart';

class SignInScreen extends StatefulWidget {
  static const id = "sign_in";

  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  SignInViewModel viewModel = getIt();

  @override
  Widget build(BuildContext context) {
    return BlocListener(
        bloc: viewModel,
        listener: (context, state) {
          if (state is BaseSuccessState) {
            Navigator.of(context); //Hide loading
            Navigator.pushReplacementNamed(context, HomeScreen.id);
          } else if (state is BaseErrorState) {
            //Hide loading
            if (state.isNetworkError) {
              ToastUtils.showNetworkErrorToast();
            } else {
              DialogUtils.showErrorDialog(context, state.errorMessage);
            }
          } else if (state is BaseLoadingState) {
            DialogUtils.showLoadingDialog(context);
          }
        },
        child: Scaffold(
          appBar: const DefaultAppBar(
            title: "Sign in",
          ),
          body: Center(
            child: CustomFilledButton(
              title: "Anonymous sign in",
              onTap: () {
                viewModel.signIn();
              },
            ),
          ),
        ));
  }
}
