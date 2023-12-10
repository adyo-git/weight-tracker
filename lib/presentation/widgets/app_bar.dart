import 'package:flutter/material.dart';
import 'package:weight_tracker/app/extensions.dart';

import '../../app/app_colors.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Function()? onBackPressed;
  final List<Widget>? actions;

  const DefaultAppBar(
      {super.key, required this.title, this.onBackPressed, this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.mainColor,
      elevation: 0,
      actions: actions,
      leading: onBackPressed == null
          ? const SizedBox()
          : IconButton(
              onPressed: onBackPressed ??
                  () {
                    Navigator.pop(context);
                  },
              icon: const Icon(Icons.arrow_back)),
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(
          color: AppColors.white,
          fontSize: 13.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(6.h);
}
