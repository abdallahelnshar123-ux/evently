import 'package:evently/provider/app_theme_provider.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  bool? filled;
  Color? fillColor;
  Color generalBorderColor;
  Color errorBorderColor;
  Widget? prefixIcon;
  Widget? suffixIcon;
  String? hintText;
  String? labelText;
  TextStyle? hintStyle;
  TextStyle? labelStyle;
  TextStyle? dataStyle;
  bool obscureText;

  CustomTextField({
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
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: dataStyle,
      obscuringCharacter: '*',
      obscureText: obscureText,
      cursorColor: context.isLight ? AppColors.whiteColor : AppColors.mainColor,
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
        contentPadding: EdgeInsets.symmetric(vertical: 14),
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
