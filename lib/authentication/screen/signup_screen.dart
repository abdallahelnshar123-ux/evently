import 'package:easy_localization/easy_localization.dart';
import 'package:evently/authentication/widget/custom_text_field.dart';
import 'package:evently/on_boarding/widget/custom_elevated_button.dart';
import 'package:evently/provider/app_theme_provider.dart';
import 'package:evently/utils/app_assets.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_routes.dart';
import 'package:evently/utils/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/app_styles.dart';

class SignupScreen extends StatelessWidget {
  bool obscure = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          context.isLight
              ? AppAssets.eventlyLogoLight
              : AppAssets.eventlyLogoDark,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(context.width * 0.04),
        child: Form(
          key: formKey,
          child: Column(
            spacing: context.width * 0.04,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// login to your account text ==================================
              Text(
                context.tr('create_your_account'),
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: context.height * 0.009),

              /// name text field ===============================================
              CustomTextField(
                controller: nameController,
                validator: (text) {
                  if (text?.trim().isEmpty ?? true) {
                    return context.tr('you_must_enter_name');
                  }

                  return null;
                },
                errorBorderColor: AppColors.redColor,
                generalBorderColor: context.isLight
                    ? AppColors.strokeColor
                    : AppColors.strokeDarkColor,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(10),
                  child: SvgPicture.asset(AppAssets.profileUnselectedIcon),
                ),
                filled: true,
                fillColor: context.isLight
                    ? AppColors.whiteColor
                    : AppColors.inputsColor,
                hintText: context.tr('enter_your_name'),
                hintStyle: Theme.of(context).textTheme.labelSmall,
                dataStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.none,
                ),
              ),

              /// email text field ============================================
              CustomTextField(
                controller: emailController,
                validator: (text) {
                  if (text?.trim().isEmpty ?? true) {
                    return context.tr('please_enter_email');
                  }
                  final bool emailValid = RegExp(
                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                  ).hasMatch(text!);
                  if (!emailValid) {
                    return context.tr('please_enter_valid_email');
                  }
                  return null;
                },
                errorBorderColor: AppColors.redColor,
                generalBorderColor: context.isLight
                    ? AppColors.strokeColor
                    : AppColors.strokeDarkColor,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(10),
                  child: SvgPicture.asset(AppAssets.smsIcon),
                ),
                filled: true,
                fillColor: context.isLight
                    ? AppColors.whiteColor
                    : AppColors.inputsColor,
                hintText: context.tr('enter_your_email'),
                hintStyle: Theme.of(context).textTheme.labelSmall,
                dataStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.none,
                ),
              ),

              /// password text field ==========================================
              CustomTextField(
                validator: (text) {
                  if (text?.trim().isEmpty ?? true) {
                    return context.tr('please_enter_password');
                  }
                  if (text!.length < 6) {
                    return context.tr('password_must_be_at_least');
                  }
                  return null;
                },
                controller: passwordController,
                errorBorderColor: AppColors.redColor,
                generalBorderColor: context.isLight
                    ? AppColors.strokeColor
                    : AppColors.strokeDarkColor,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(10),
                  child: SvgPicture.asset(AppAssets.lockIcon),
                ),
                filled: true,
                fillColor: context.isLight
                    ? AppColors.whiteColor
                    : AppColors.inputsColor,
                hintText: context.tr('enter_your_password'),
                hintStyle: Theme.of(context).textTheme.labelSmall,
                dataStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.none,
                ),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    obscure
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: AppColors.disableColor,
                  ),
                ),
              ),

              /// re password text field =======================================
              CustomTextField(
                controller: rePasswordController,
                validator: (text) {
                  if (text?.trim().isEmpty ?? true) {
                    return context.tr('please_confirm_password');
                  }
                  if (text != passwordController.text) {
                    return context.tr('password_do_not_match');
                  }
                  return null;
                },
                errorBorderColor: AppColors.redColor,
                generalBorderColor: context.isLight
                    ? AppColors.strokeColor
                    : AppColors.strokeDarkColor,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(10),
                  child: SvgPicture.asset(AppAssets.lockIcon),
                ),
                filled: true,
                fillColor: context.isLight
                    ? AppColors.whiteColor
                    : AppColors.inputsColor,
                hintText: context.tr('confirm_your_password'),
                hintStyle: Theme.of(context).textTheme.labelSmall,
                dataStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.none,
                ),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    obscure
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: AppColors.disableColor,
                  ),
                ),
              ),

              SizedBox(height: context.height * 0.018),

              /// signup button ================================================
              CustomElevatedButton(
                onPressed: () {
                  if (formKey.currentState?.validate() == true) {
                    // todo: signup
                  }
                },
                backgroundColor: context.isLight
                    ? AppColors.mainColor
                    : AppColors.mainDarkModeColor,
                child: Text(
                  context.tr('signup'),
                  style: AppStyles.sBold20White,
                ),
              ),
              SizedBox(height: context.height * 0.01),

              /// login text ==================================================
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    context.tr('already_have_an_account'),
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(padding: EdgeInsets.all(0)),
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        AppRoutes.loginRouteName,
                      );
                    },
                    child: Text(
                      context.tr('login'),
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        decoration: TextDecoration.underline,
                        decorationColor: context.isLight
                            ? AppColors.mainColor
                            : AppColors.mainDarkModeColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),

              /// or divider ====================================================
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: Divider()),
                  Text(
                    context.tr('or'),
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      color: context.isLight
                          ? AppColors.mainColor
                          : AppColors.mainDarkModeColor,
                    ),
                  ),
                  Expanded(child: Divider()),
                ],
              ),

              /// login with google button ======================================
              CustomElevatedButton(
                onPressed: () {},
                borderColor: context.isLight
                    ? AppColors.strokeColor
                    : AppColors.strokeDarkColor,
                backgroundColor: context.isLight
                    ? AppColors.whiteColor
                    : AppColors.inputsColor,
                child: Row(
                  spacing: 10,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AppAssets.googleIcon, width: 24),
                    Text(
                      context.tr('sign_up_with_google'),
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
