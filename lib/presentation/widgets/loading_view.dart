import 'package:flutter/material.dart';
import 'package:weight_tracker/app/extensions.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
          height: 5.h, width: 5.h,
          child: const CircularProgressIndicator()),
    );
  }
}
