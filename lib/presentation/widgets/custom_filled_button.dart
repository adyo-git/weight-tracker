import 'package:flutter/material.dart';
import 'package:weight_tracker/app/extensions.dart';

import '../../app/app_colors.dart';

class CustomFilledButton extends StatelessWidget {
  final String title;
  final double? radius;
  final Function() onTap;

  const CustomFilledButton(
      {Key? key, required this.title, this.radius, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        width: double.infinity,
        height: 6.h,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              foregroundColor: AppColors.mainColor,
              backgroundColor: AppColors.mainColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius ?? 2.0.w))),
          onPressed: onTap,
          child: Center(
            child: Text(
              title,
              style: const TextStyle(color: AppColors.white),
            ),
          ),
        ));
  }
}
