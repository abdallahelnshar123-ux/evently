import 'package:easy_localization/easy_localization.dart';
import 'package:evently/authentication/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../provider/app_theme_provider.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/screen_size.dart';
import '../home_tab/widget/event_widget.dart';

class FavoriteTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.fromLTRB(
            context.width * 0.04,
            context.width * 0.07,
            context.width * 0.04,
            0,
          ),
          child: Column(
            spacing: context.height * 0.04,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomTextField(
                dataStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.none,
                ),
                filled: true,
                fillColor: context.isLight
                    ? AppColors.whiteColor
                    : AppColors.inputsColor,

                hintText: context.tr('search_for_event'),
                hintStyle: Theme.of(context).textTheme.labelSmall,
                suffixIcon: Icon(
                  size: 30,
                  HeroIcons.magnifying_glass,
                  color: context.isLight
                      ? AppColors.mainColor
                      : AppColors.mainDarkModeColor,
                ),
                errorBorderColor: AppColors.redColor,
                generalBorderColor: context.isLight
                    ? AppColors.strokeColor
                    : AppColors.strokeDarkColor,
              ),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) => EventWidget(),
                  separatorBuilder: (context, index) =>
                      SizedBox(height: context.height * 0.019),
                  itemCount: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
