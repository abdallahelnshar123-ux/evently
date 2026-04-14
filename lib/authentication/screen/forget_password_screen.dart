import 'package:easy_localization/easy_localization.dart';
import 'package:evently/on_boarding/widget/back_button_widget.dart';
import 'package:evently/utils/dialog_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../on_boarding/widget/custom_elevated_button.dart';
import '../../provider/app_theme_provider.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';
import '../../utils/screen_size.dart';
import '../widget/custom_text_field.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.tr('forget_password'),
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
            color: context.isLight
                ? AppColors.mainTextColor
                : AppColors.whiteColor,
          ),
        ),
        centerTitle: true,
        leadingWidth: 70,
        leading: BackButtonWidget(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(context.width * 0.04),
        child: Column(
          spacing: context.height * 0.04,
          children: [
            Image.asset(
              context.isLight
                  ? AppAssets.forgetPasswordLightImage
                  : AppAssets.forgetPasswordDarkImage,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            CustomTextField(
              controller: emailController,

              validator: (text) {
                if (text?.trim().isEmpty ?? true) {
                  return context.tr('please_enter_email');
                }
                final bool emailValid = RegExp(
                  r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                ).hasMatch(text!);
                if (!emailValid) {
                  return context.tr('please_enter_valid_email');
                }
                return null;
              },
              keyBoardType: TextInputType.emailAddress,
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
            CustomElevatedButton(
              backgroundColor: context.isLight
                  ? AppColors.mainColor
                  : AppColors.mainDarkModeColor,
              child: Text(
                context.tr('reset_password'),
                style: AppStyles.sBold20White,
              ),
              onPressed: () async {
                try {
                  if (emailController.text.trim().isEmpty) {
                    DialogUtils.showMessage(
                      context: context,
                      message: 'Please enter your email',
                    );
                    return;
                  }

                  if (!mounted) return;
                  DialogUtils.showLoading(context: context);

                  await FirebaseAuth.instance.sendPasswordResetEmail(
                    email: emailController.text.trim(),
                  );

                  if (!mounted) return;
                  DialogUtils.hideLoading(context: context);

                  DialogUtils.showMessage(
                    context: context,
                    message: 'Password reset email sent. Check your inbox.',
                    title: 'Success',
                    posActionText: 'ok',
                  );
                } on FirebaseAuthException catch (e) {
                  if (!mounted) return;
                  DialogUtils.hideLoading(context: context);

                  String message;

                  switch (e.code) {
                    case 'user-not-found':
                      message = 'No user found with this email';
                      break;
                    case 'invalid-email':
                      message = 'Invalid email format';
                      break;
                    default:
                      message = 'Something went wrong';
                  }

                  DialogUtils.showMessage(
                    context: context,
                    message: message,
                    title: 'Error',
                    posActionText: 'ok',
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
