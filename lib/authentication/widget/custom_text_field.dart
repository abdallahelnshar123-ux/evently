import 'package:evently/provider/app_theme_provider.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:flutter/material.dart';

typedef OnChanged = void Function(String)?;
typedef ValidatorFunction = String? Function(String?)?;

class CustomTextField extends StatelessWidget {
  final bool? filled;
  final Color? fillColor;
  final Color generalBorderColor;
  final Color errorBorderColor;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? hintText;
  final String? labelText;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final TextStyle? dataStyle;
  final bool obscureText;
  final int? maxLines;
  final OnChanged? onChanged;
  final TextEditingController? controller;
  final TextInputType? keyBoardType;
  final String? initialValue;
  final ValidatorFunction? validator;

  const CustomTextField({
    super.key,
    this.filled,
    this.fillColor,
    this.prefixIcon,
    this.suffixIcon,
    this.hintText,
    this.hintStyle,
    this.labelStyle,
    this.labelText,
    required this.errorBorderColor,
    required this.generalBorderColor,
    this.obscureText = false,
    this.dataStyle,
    this.maxLines = 1,
    this.validator,
    this.onChanged,
    this.controller,
    this.keyBoardType,
    this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enableInteractiveSelection: true,
      initialValue: initialValue,
      keyboardType: keyBoardType,
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      maxLines: maxLines,
      style: dataStyle,
      obscuringCharacter: '*',
      obscureText: obscureText,
      cursorColor: context.isLight
          ? AppColors.mainColor
          : AppColors.mainDarkModeColor,
      decoration: InputDecoration(
        enabledBorder: builtDecorationBorder(generalBorderColor),
        focusedBorder: builtDecorationBorder(generalBorderColor),
        errorBorder: builtDecorationBorder(errorBorderColor),
        focusedErrorBorder: builtDecorationBorder(errorBorderColor),
        filled: filled,
        fillColor: fillColor,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: hintStyle,
        labelText: labelText,
        labelStyle: labelStyle,
        contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 14),
      ),
    );
  }

  OutlineInputBorder builtDecorationBorder(Color borderColor) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: borderColor, width: 1),
    );
  }
}
