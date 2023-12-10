import 'package:flutter/material.dart';
import 'package:weight_tracker/app/app_colors.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String? errorText;
  final bool enableBoarder;
  final Color? fillColor;
  final Color? hintColor;
  final Color? textColor;
  final Color? borderColor;
  final String? Function(String?)? validator;
  final bool isPassword;
  final bool expands;
  final TextInputType? textInputType;
  final Widget? prefixIcon;

  const CustomTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      this.enableBoarder = false,
      this.errorText,
      this.fillColor,
      this.hintColor,
      this.textColor,
      this.borderColor,
      this.validator,
      this.textInputType,
      this.prefixIcon,
      this.isPassword = false,
      this.expands = false});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late InputBorder border;
  late bool obscureText;

  @override
  void initState() {
    super.initState();

    border = OutlineInputBorder(
        borderSide: BorderSide(
          width: widget.enableBoarder ? 1 : 0,
          color: widget.enableBoarder
              ? widget.borderColor ?? AppColors.grayLight
              : AppColors.white,
        ),
        borderRadius: BorderRadius.circular(20));
    obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: TextFormField(
          keyboardType: widget.textInputType,
          style: TextStyle(color: widget.textColor ?? AppColors.mainColor),
          controller: widget.controller,
          validator: widget.validator,
          obscureText: obscureText,
          decoration: InputDecoration(
            prefixIcon: widget.prefixIcon,
            fillColor: widget.fillColor ?? Colors.white,
            filled: true,
            enabledBorder: border,
            focusedBorder: border,
            errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 1.0,
                  color: AppColors.error,
                ),
                borderRadius: BorderRadius.circular(20)),
            border: border,
            hintText: widget.hintText,
            hintStyle: TextStyle(color: widget.hintColor, fontSize: 18),
            errorText: widget.errorText,
          ),
        ));
  }
}
