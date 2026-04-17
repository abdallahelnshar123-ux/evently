import 'package:evently/provider/app_theme_provider.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/screen_size.dart';
import 'package:flutter/widgets.dart';

class ContainerChild extends StatelessWidget {
  final Widget child;

  const ContainerChild({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(context.width * 0.02),
      decoration: BoxDecoration(
        color: context.isLight
            ? AppColors.backgroundColor
            : AppColors.bgDarkModeColor,
        border: Border.all(
          color: context.isLight
              ? AppColors.strokeColor
              : AppColors.strokeDarkColor,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: child,
    );
  }
}
